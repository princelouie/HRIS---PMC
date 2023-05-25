<?php

namespace App\Repositories;


use Carbon\Carbon;
use App\Models\User;
use App\Models\Role\Role;
use App\Models\Role\RoleUser;
use App\Models\Hrm\Shift\Shift;
use App\Models\Track\LocationLog;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Validator;
use App\Helpers\CoreApp\Traits\SmsHandler;
use App\Helpers\CoreApp\Traits\FileHandler;
use App\Helpers\CoreApp\Traits\MailHandler;
use App\Repositories\Interfaces\UserInterface;
use App\Helpers\CoreApp\Traits\AuthorInfoTrait;
use App\Helpers\CoreApp\Traits\ApiReturnFormatTrait;
use App\Models\coreApp\Relationship\RelationshipTrait;

class UserRepository
{

    use FileHandler, SmsHandler, AuthorInfoTrait, RelationshipTrait, ApiReturnFormatTrait, MailHandler;

    public $model;

    public function __construct(User $model)
    {
        $this->model = $model;
    }

    public function getAll()
    {
        return $this->model->query()->where('company_id', $this->companyInformation()->id)->get();
    }
    public function getActiveAll()
    {
        return $this->model->query()->where('status_id', 1)->where('company_id', $this->companyInformation()->id)->get();
    }

    public function getShift()
    {
        return Shift::query()->where('company_id', $this->companyInformation()->id)->get();
    }
    public function getActiveShift()
    {
        return Shift::query()->where('status_id', 1)->where('company_id', $this->companyInformation()->id)->get();
    }

    public function getById($id)
    {
        return $this->model->find($id);
    }

    public function getUserByKeywords($request)
    {
        $where = [];
        if ($request->has('department_id')) {
            $where = array('department_id' => $request->get('department_id'));
        }
        if ($request->has('params')) {
            $where = array_merge($where, $request->get('params'));
        }
        return $this->model->query()->where('company_id', $this->companyInformation()->id)
            ->where($where)
            ->where('name', 'LIKE', "%$request->term%")
            ->select('id', 'name', 'phone', 'employee_id')
            ->where('branch_id', userBranch())
            ->take(10)
            ->get();
    }

    public function save($request)
    {
        DB::beginTransaction();
        try {
            if (empty($request->joining_date)) {
                $request['joining_date'] = date('Y-m-d');
            }
            if ($request->role_id) {
                $request['permissions'] = Role::where('id',$request->role_id)->first()->permissions;
            } else {
                $request['permissions'] = [];
            }

            // dd($request['permissions']);
            
            $request['company_id'] = $this->companyInformation()->id;
            $request['password'] = !empty($request->password) ? Hash::make($request->password) : Hash::make('12345678');
            $request['country_id'] = $request->country;
            $request['branch_id'] = userBranch();
            $user = $this->model->query()->create($request->all());
            $user->userRole()->create([
                'user_id' => $user->id,
                'role_id' => $request->role_id
            ]);
            //email send using queue
            
            // if (!$this->sendEmail($user, $password)) {
            //     return $this->responseWithError(_trans('message.Mail not send.'), [], 400);
            // }
            DB::commit();
            return $this->responseWithSuccess(_trans('message.Employee successfully.'), $user);
        } catch (\Throwable $th) {
            DB::rollBack();
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }

    public function update($request, $id)
    {

        // dd($request->all());
        $request->validate([
            'phone' => 'required|unique:users,phone,' . $id,
            'email' => 'required|unique:users,email,' . $id,
            'name' => 'required|max:250',
            'gender' => 'nullable|max:250',
            'avatar' => 'nullable|image|mimes:jpeg,png,jpg|max:25000',
        ]);
        DB::beginTransaction();
        try {
            $user = $this->model->query()->find($id);
            $user->name = $request->name;
            $user->email = $request->email;
            $user->gender = $request->gender;
            $user->phone = $request->phone;
            $user->joining_date = $request->joining_date;
            $user->department_id = $request->department_id;
            $user->designation_id = $request->designation_id;
            $user->address = $request->address;
            $user->religion = $request->religion;
            $user->shift_id = $request->shift_id;
            $user->marital_status = $request->marital_status;
            $user->basic_salary = $request->basic_salary;
            $user->role_id = $request->role_id;
            $user->birth_date = $request->birth_date;
            // $user->permissions = $request->permissions;
            $user->is_free_location = $request->is_free_location;
            $user->time_zone = $request->time_zone ?? 'Asia/Dhaka';

            if ($request->avatar) {
                $user->avatar_id = $this->uploadImage($request->avatar, 'uploads/user')->id;
            }
            //author info update here

            if($request->password != ''){
                $user->password =  Hash::make($request->password);
            }

            if ($request->role_id) {
                $user->permissions = Role::where('id',$request->role_id)->first()->permissions;
            } else {
                $user->permissions = [];
            }

            $user->save();
            $role = RoleUser::where('user_id', $user->id)->first();
            $role->role_id = $user->role_id;
            $role->save();
            $this->updatedBy($user);
            DB::commit();
            return $this->responseWithSuccess(_trans('response.User update successfully.'), $user);
            return $user;
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }

    public function permission_update($request, $id)
    {
        DB::beginTransaction();
        try {
            $user = $this->model->query()->find($id);
            $user->permissions = $request->permissions;
            $user->save();
            $this->updatedBy($user);
            DB::commit();
            return $this->responseWithSuccess(_trans('response.User Permission update successfully.'), $user);
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }

    public function updateProfile($request)
    {
        DB::beginTransaction();
        try {
            $user = $this->model->query()->find($request->id);
            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->gender = $request->gender;
            $user->birth_date = $request->birth_date;

            if ($request->avatar) {
                $this->deleteImage(asset_path($user->avatar_id));
                $user->avatar_id = $this->uploadImage($request->avatar, 'uploads/user')->id;
            }
            DB::commit();
            $user->save();
            //author info update here
            $this->updatedBy($user);
            Toastr::success('Operation successful!', 'Success');
            return redirect()->back();
        } catch (\Exception $e) {
            DB::rollBack();
            Toastr::error(_trans('response.Something went wrong!'), 'Error');
            return back();
        }
    }


    public function delete($user)
    {
        $user->delete();
        return true;
    }

    public function changeStatus($user, $status)
    {
        $user->update([
            'status_id' => $status
        ]);
        return true;
    }
    public function makeHR($user_id)
    {
        try {
            $user = $this->model->query()->find($user_id);
            if ($user->is_hr == 1) {
                $user->is_hr = 0;
                $user->update();
                $message = _trans('message.HR role removed successfully');
            } else {
                $user->is_hr = 1;
                $user->update();
                $message = _trans('message.HR role updated successfully');
            }
            return $this->responseWithSuccess($message, $user);
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }

        return true;
    }

    public function data_table($request, $id = null)
    {

        $users = $this->model->query()->with('department', 'designation', 'role', 'shift', 'status')
            ->where('id', '!=', $this->companyInformation()->id)
            ->where('company_id', $this->companyInformation()->id)
            ->select('id', 'company_id', 'role_id', 'department_id', 'designation_id', 'name', 'email', 'phone', 'shift_id', 'status_id', 'is_hr');
        if (@$request->from && @$request->to) {
            $users = $users->whereBetween('created_at', start_end_datetime($request->from, $request->to));
        }

        if (@$request->userTypeId) {
            $users = $users->where('role_id', $request->userTypeId);
        }
        if (@$request->user_id) {
            $users = $users->where('id', $request->user_id);
        }
        $users = $users->latest()->get();


        return datatables()->of($users)
            ->addColumn('action', function ($data) {
                $action_button = '';
                $edit = _trans('common.Edit');
                $delete = _trans('common.Delete');
                $unBanned = _trans('common.Unbanned');
                $banned = _trans('common.Banned');
                // $action_button .= actionButton($delete, '__globalDelete(' . $data->id . ',`hrm/department/delete/`)', 'delete');

                if (hasPermission('profile_view')) {
                    $action_button .= actionButton('Profile', route('user.profile', [$data->id, 'official']), 'profile');
                }
                if (hasPermission('user_edit')) {
                    $action_button .= actionButton($edit, route('user.edit', $data->id), 'profile');
                }
                if ($data->status_id == 3) {
                    if (hasPermission('user_banned')) {
                        $action_button .= actionButton($unBanned, 'ApproveOrReject(' . $data->id . ',' . "1" . ',`dashboard/user/change-status/`,`Approve`)', 'approve');
                    }
                } else {
                    if (hasPermission('user_unbanned')) {
                        $action_button .= actionButton($banned, 'ApproveOrReject(' . $data->id . ',' . "3" . ',`dashboard/user/change-status/`,`Approve`)', 'approve');
                    }
                }
                if (hasPermission('user_delete')) {
                    $action_button .= actionButton($delete, '__globalDelete(' . $data->id . ',`dashboard/user/delete/`)', 'delete');
                }
                if (hasPermission('make_hr')) {

                    if ($data->is_hr == "1") {
                        $hr_btn = _trans('leave.Remove HR');
                    } else {
                        $hr_btn = _trans('leave.Make HR');
                    }
                    $action_button .= actionButton($hr_btn, 'MakeHrByAdmin(' . $data->id . ',`dashboard/user/make-hr/`,`HR`)', 'approve');
                }
                $button = '<div class="flex-nowrap">
                    <div class="dropdown">
                        <button class="btn btn-white dropdown-toggle align-text-top action-dot-btn" data-boundary="viewport" data-toggle="dropdown">
                            <i class="fas fa-ellipsis-v"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">' . $action_button . '</div>
                    </div>
                </div>';
                return $button;
            })
            ->addColumn('name', function ($data) {
                if ($data->is_hr == 1) {
                    $actAsHr = _trans('Acting as HR');
                    $hr_badge = @$data->name . ' </br><small class="text-success">[' . $actAsHr . ']</small>';
                } else {
                    $hr_badge = @$data->name . "";
                }
                return @$hr_badge;
            })
            ->addColumn('email', function ($data) {
                return @$data->email;
            })
            ->addColumn('phone', function ($data) {
                return @$data->phone;
            })
            ->addColumn('department', function ($data) {
                return @$data->department->title;
            })
            ->addColumn('designation', function ($data) {
                return @$data->designation->title;
            })
            ->addColumn('role', function ($data) {
                return @$data->role->name;
            })
            ->addColumn('shift', function ($data) {
                return @$data->shift->name;
            })
            ->addColumn('status', function ($data) {
                return '<span class="badge badge-' . @$data->status->class . '">' . @$data->status->name . '</span>';
            })
            ->rawColumns(array('name', 'email', 'phone', 'department', 'designation', 'role', 'shift', 'status', 'action'))
            ->make(true);
    }

    public function liveTrackingEmployee($request, $id = null)
    {
        return $track = $this->model->query()->with('location_log')
            ->where('company_id', $this->companyInformation()->id)
            ->whereHas('location_log', function ($query) use ($request) {
                $query->where('date', 'LIKE', $request->date . '%');
            })
            ->select('company_id', 'id', 'name')
            ->get();
    }

    public function employeeLocationHistory($request, $id = null)
    {
        $logs =   DB::table('location_logs')
            ->select('latitude', 'longitude', 'address as start_location', 'id', 'created_at')
            ->where('company_id', $this->companyInformation()->id)
            ->where('user_id', $request->user)
            ->where('date', 'LIKE', $request->date . '%')
            ->get();

        $data = [];
        $total = $logs->count();
        foreach ($logs as $key => $value) {
            if ($total > 25 ? ($key % ceil($total / 25)) == 0 || $key == 0 || $key == $total - 1 : true) {
                array_push($data, $value);
            }
        }
        return $data;
    }

    public function departmentWiseUser($request)
    {
        $users = $this->model->query()->where('company_id', $this->companyInformation()->id);
        $users = $users->select('id', 'company_id', 'role_id', 'department_id', 'designation_id', 'name', 'email', 'phone', 'status_id');


        return datatables()->of($users->latest()->get())
            ->addColumn('action', function ($data) {
                $action_button = '';
                $action_button .= actionButton('Profile', route('user.profile', [$data->id, 'official']), 'profile');


                $button = '<div class="flex-nowrap">
                    <div class="dropdown">
                        <button class="btn btn-white dropdown-toggle align-text-top action-dot-btn" data-boundary="viewport" data-toggle="dropdown">
                            <i class="fas fa-ellipsis-v"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">' . $action_button . '</div>
                    </div>
                </div>';
                return $button;
            })
            ->addColumn('name', function ($data) {
                return @$data->name;
            })
            ->addColumn('email', function ($data) {
                return @$data->email;
            })
            ->addColumn('phone', function ($data) {
                return @$data->phone;
            })
            ->addColumn('department', function ($data) {
                return $data->department->title;
            })
            ->addColumn('designation', function ($data) {
                return $data->designation->title;
            })
            ->addColumn('role', function ($data) {
                return $data->role->name;
            })
            ->addColumn('status', function ($data) {
                return '<span class="badge badge-' . @$data->status->class . '">' . @$data->status->name . '</span>';
            })
            ->rawColumns(array('name', 'email', 'phone', 'department', 'designation', 'role', 'status', 'action'))
            ->make(true);
    }


    // new function for user list

    function fields()
    {
        return [
            _trans('common.ID'),
            _trans('common.Name'),
            _trans('common.Email'),
            _trans('common.Phone'),
            _trans('common.Designation'),
            _trans('common.Department'),
            _trans('common.Role'),
            _trans('common.Shift'),
            _trans('common.Status'),
            _trans('common.Action'),

        ];
    }

    function table($request)
    { {
            // Log::info($request->all());
            $data =  $this->model->query()->where('company_id', $this->companyInformation()->id)->where('branch_id', userBranch())
                ->select('id', 'company_id', 'role_id', 'department_id', 'designation_id', 'name', 'email', 'phone', 'status_id', 'shift_id', 'is_free_location', 'is_hr','is_admin')
                ->where('company_id', auth()->user()->company_id);
            $where = array();
            if ($request->search) {
                $where[] = ['name', 'like', '%' . $request->search . '%'];
            }
            if (@$request->designation) {
                $where[] = ['designation_id', $request->designation];
            }
            $data = $data
                ->where($where)
                ->paginate($request->limit ?? 2);
            return [
                'data' => $data->map(function ($data) {
                    $action_button = '';
                    $edit = _trans('common.Edit');
                    $delete = _trans('common.Delete');
                    $unBanned = _trans('common.Unbanned');
                    $banned = _trans('common.Banned');
                    // $action_button .= actionButton($delete, '__globalDelete(' . $data->id . ',`hrm/department/delete/`)', 'delete');

                    if (hasPermission('profile_view')) {
                        $action_button .= actionButton(_trans('common.Profile'), route('user.profile', [$data->id, 'personal']), 'profile');
                    }
                    if (hasPermission('user_edit')) {
                        $action_button .= actionButton($edit, route('user.edit', $data->id), 'profile');
                    }
                    if (hasPermission('user_permission')) {
                        $action_button .= actionButton(_trans('common.Permission'), route('user.permission_edit.profile', $data->id), 'profile');
                    }
                    if ($data->status_id == 3) {
                        if (hasPermission('user_banned') ) {
                            $action_button .= actionButton($unBanned, 'ApproveOrReject(' . $data->id . ',' . "1" . ',`dashboard/user/change-status/`,`Approve`)', 'approve');
                        }
                    } else {
                        if (hasPermission('user_unbanned') && !$data->is_admin) {
                            $action_button .= actionButton($banned, 'ApproveOrReject(' . $data->id . ',' . "3" . ',`dashboard/user/change-status/`,`Approve`)', 'approve');
                        }
                    }
                    if (hasPermission('user_delete') && !$data->is_admin) {
                        $action_button .= actionButton($delete, '__globalDelete(' . $data->id . ',`dashboard/user/delete/`)', 'delete');
                    }
                    if (hasPermission('make_hr')) {

                        if ($data->is_hr == "1") {
                            $hr_btn = _trans('leave.Remove HR');
                            $icon = 'warning';
                        } else {
                            $hr_btn = _trans('leave.Make HR');
                            $icon = 'success';
                        }
                        $action_button .= actionButton($hr_btn, 'GlobalSweetAlert(`' . $hr_btn . '`,`' . _trans('alert.Are you sure?') . '`,`' . $icon . '`,`' . _trans('common.Yes') . '`,`' . route('user.make_hr', $data->id) . '`)', 'approve');
                        // $action_button .= actionButton($hr_btn, 'MakeHrByAdmin(' . $data->id . ',`dashboard/user/make-hr/`,`HR`)', 'approve');
                    }
                    $button = ' <div class="dropdown dropdown-action">
                                    <button type="button" class="btn-dropdown" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                    ' . $action_button . '
                                    </ul>
                                </div>';
                    if (@$data->is_free_location == 1) {
                        $location = '<br>[<small class="text-info">' . _trans('common.Free Location') . '</small>]';
                    }

                    if (@$data->is_hr     == 1) {
                        $hr = '<br>[<small class="text-success">' . _trans('common.Acting as HR') . '</small>]';
                    }

                    return [
                        'name' => $data->name . '' . @$location . '' . @$hr,
                        'email' => $data->email,
                        'phone' => $data->phone,
                        'department' => @$data->department->title,
                        'designation' => @$data->designation->title,
                        'role' => @$data->role->name,
                        'shift' => @$data->shift->name,
                        'id' => $data->id,
                        'status' => '<small class="badge badge-' . @$data->status->class . '">' . @$data->status->name . '</small>',
                        'action'   => $button
                    ];
                }),
                'pagination' => [
                    'total' => $data->total(),
                    'count' => $data->count(),
                    'per_page' => $data->perPage(),
                    'current_page' => $data->currentPage(),
                    'total_pages' => $data->lastPage(),
                    'pagination_html' =>  $data->links('backend.pagination.custom')->toHtml(),
                ],
            ];
        }
    }
    function phoneBookTable($request)
    { {
            // Log::info($request->all());
            $data =  $this->model->query()->where('company_id', $this->companyInformation()->id)
                ->select('id', 'company_id', 'role_id', 'department_id', 'designation_id', 'name', 'email', 'phone', 'status_id', 'shift_id', 'created_at');
            if ($request->from && $request->to) {
                $data = $data->whereBetween('created_at', start_end_datetime($request->from, $request->to));
            }
            $data = $data->orderBy('name', 'asc')
                ->paginate($request->limit ?? 2);
            return [
                'data' => $data->map(function ($data) {

                    return [
                        'name' => $data->name,
                        'email' => $data->email,
                        'phone' => $data->phone,
                        'department' => $data->department->title,
                        'designation' => $data->designation->title,
                        'role' => $data->role->name,
                        'status' => '<small class="badge badge-' . @$data->status->class . '">' . @$data->status->name . '</small>',
                    ];
                }),
                'pagination' => [
                    'total' => $data->total(),
                    'count' => $data->count(),
                    'per_page' => $data->perPage(),
                    'current_page' => $data->currentPage(),
                    'total_pages' => $data->lastPage(),
                    'pagination_html' =>  $data->links('backend.pagination.custom')->toHtml(),
                ],
            ];
        }
    }


    // statusUpdate
    public function statusUpdate($request)
    {
        try {
            // Log::info($request->all());
            if (@$request->action == 'active') {
                $userI = $this->model->where('company_id', auth()->user()->company_id)->whereIn('id', $request->ids)->update(['status_id' => 1]);
                return $this->responseWithSuccess(_trans('message.User activate successfully.'), $userI);
            }
            if (@$request->action == 'inactive') {
                $userI = $this->model->where('company_id', auth()->user()->company_id)->whereIn('id', $request->ids)->update(['status_id' => 4]);
                return $this->responseWithSuccess(_trans('message.User inactivate successfully.'), $userI);
            }
            return $this->responseWithError(_trans('message.User status change failed'), [], 400);
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }


    public function destroyAll($request)
    {
        try {
            if (@$request->ids) {
                $user = $this->model->where('company_id', auth()->user()->company_id)->whereIn('id', $request->ids)->update(['deleted_at' => now()]);
                return $this->responseWithSuccess(_trans('message.User activate successfully.'), $user);
            } else {
                return $this->responseWithError(_trans('message.User not found'), [], 400);
            }
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }


    function phonebookFields()
    {
        return [
            _trans('common.Name'),
            _trans('common.Email'),
            _trans('common.Phone'),
            _trans('common.Designation'),
            _trans('common.Department'),
            _trans('common.Role'),
            _trans('common.Status'),
        ];
    }
}
