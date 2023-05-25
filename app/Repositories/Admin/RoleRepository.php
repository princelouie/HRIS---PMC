<?php

namespace App\Repositories\Admin;

use App\Helpers\CoreApp\Traits\ApiReturnFormatTrait;
use App\Helpers\CoreApp\Traits\AuthorInfoTrait;
use App\Models\coreApp\Relationship\RelationshipTrait;
use App\Models\Permission\Permission;
use App\Models\Role\Role;
use App\Models\Traits\RelationCheck;
use App\Services\Hrm\DeleteService;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

class RoleRepository
{
    use AuthorInfoTrait, RelationshipTrait, RelationCheck, ApiReturnFormatTrait;

    protected $role;

    public function __construct(Role $role)
    {
        $this->role = $role;
    }

    public function get($id)
    {
        return $this->role->query()->where('company_id', $this->companyInformation()->id)->findOrFail($id);
    }

    public function getAll()
    {
            return $this->role->query()->where('company_id', $this->companyInformation()->id)->where('status_id', 1)->branch()->where('id', '!=', '1')->get();
     }

    public function getPermission()
    {
        return Permission::get();
    }

    public function index()
    {
        // TODO: Implement index() method.
    }

    public function dataTable($request, $id = null)
    {
        $roles = $this->role->query()->where('company_id', $this->companyInformation()->id)->with('status')->where('id', '!=', '1');
        if (@$request->from && @$request->to) {
            $roles = $roles->whereBetween('created_at', start_end_datetime($request->from, $request->to));
        }
        if (@$id) {
            $roles = $roles->where('id', $id);
        }

        return datatables()->of($roles->latest()->get())
            ->addColumn('action', function ($data) {
                $action_button = '';
                $edit = _trans('common.Edit');
                $delete = _trans('common.Delete');
                if (hasPermission('role_update')) {
                    $action_button .= '<a href="' . route('roles.edit', $data->id) . '" class="dropdown-item"> ' . $edit . '</a>';
                }
                if (hasPermission('role_delete')) {

                    $action_button .= actionButton($delete, '__globalDelete(' . $data->id . ',`hrm/roles/delete/`)', 'delete');
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
                return @$data->name;
            })
            ->addColumn('web_login', function ($data) {
                //bootstrap switch
                $checked = $data->web_login == 1 ? 'checked' : '';
                $switch = '<div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="web_login_' . $data->id . '" ' . $checked . ' onchange="changeStatus(`hrm/roles/change-status/`,' . $data->id . ',`web_login`)" >
                    <label class="custom-control-label" for="web_login_' . $data->id . '"></label>
                </div>';
                return @$switch;
            })
            ->addColumn('app', function ($data) {
                return @$data->name;
            })
            ->addColumn('permissions', function ($data) {
                return $data->permissions != null ? count($data->permissions) : 0;
            })
            ->addColumn('status', function ($data) {
                return '<span class="badge badge-' . @$data->status->class . '">' . @$data->status->name . '</span>';
            })
            ->rawColumns(array('name', 'status', 'web_login', 'app', 'action'))
            ->make(true);
    }

    public function store($request)
    {
        $request['slug'] = Str::slug($request->name, '-');
        $this->role->query()->create($request->all());
    }

    public function show($id)
    {
        return $this->role->query()->find($id);
    }

    public function update($request)
    {
        $this->role->query()->where('id', $request->role_id)->update($request->only(['name', 'status_id', 'permissions']));
        return true;
    }

    public function destroy($id)
    {
        $foreign_id = \Illuminate\Support\Str::singular($this->role->getTable()) . '_id';
        return \App\Services\Hrm\DeleteService::deleteData($this->role->getTable(), $foreign_id, $id);
    }

    // new functions

    public function fields()
    {
        return [
            _trans('common.ID'),
            _trans('common.Name'),
            _trans('common.Status'),
            _trans('common.Web Login'),
            _trans('common.App Login'),
            _trans('common.Action'),

        ];
    }

    // data table functions
    public function table($request)
    {{
        $data = $this->role->query()->with('status')->branch()
            ->where('company_id', auth()->user()->company_id);
        $where = array();
        if ($request->search) {
            $where[] = ['name', 'like', '%' . $request->search . '%'];
        }
        $data = $data
            ->where($where)
            ->orderBy('id', 'DESC')
            ->paginate($request->limit ?? 2);
        return [
            'data' => $data->map(function ($data) {
                $action_button = '';
                $system_roles = ['admin', 'hr', 'staff'];
                if (in_array($data->slug, $system_roles)) {
                    $button = '<span class="badge badge-danger">' . _trans('common.Restricted') . '</span>';
                } else {
                    if (hasPermission('role_update')) {
                        $action_button .= '<a href="' . route('roles.edit', $data->id) . '" class="dropdown-item"> ' . _trans('common.Edit') . '</a>';
                    }
                    if (hasPermission('role_delete')) {
                        $action_button .= actionButton(_trans('common.Delete'), '__globalDelete(' . $data->id . ',`hrm/roles/delete/`)', 'delete');
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
                }

                $web_checked = $data->web_login == 1 ? 'checked' : '';
                $app_checked = $data->app_login == 1 ? 'checked' : '';
                return [
                    'id' => $data->id,
                    'name' => $data->name,
                    'status' => '<small class="badge badge-' . @$data->status->class . '">' . @$data->status->name . '</small>',

                    'web_login' => '<div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" onchange="changeLoginStatus(`' . route('roles.change_login') . '`,' . $data->id . ',`web_login`)" role="switch" id="web_login_' . $data->id . '" ' . $web_checked . '>
                        <label class="form-check-label" for="web_login_' . $data->id . '"></label>
                    </div>',
                    'app_login' => '<div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" onchange="changeLoginStatus(`' . route('roles.change_login') . '`,' . $data->id . ',`app_login`)" role="switch" id="app_login_' . $data->id . '" ' . $app_checked . '>
                        <label class="form-check-label" for="app_login_' . $data->id . '"></label>
                    </div>',
                    'action' => $button,
                ];

            }),
            'pagination' => [
                'total' => $data->total(),
                'count' => $data->count(),
                'per_page' => $data->perPage(),
                'current_page' => $data->currentPage(),
                'total_pages' => $data->lastPage(),
                'pagination_html' => $data->links('backend.pagination.custom')->toHtml(),
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
                $role = $this->role->where('company_id', auth()->user()->company_id)->whereIn('id', $request->ids)->update(['status_id' => 1]);
                return $this->responseWithSuccess(_trans('message.Role activate successfully.'), $role);
            }
            if (@$request->action == 'inactive') {
                $role = $this->role->where('company_id', auth()->user()->company_id)->whereIn('id', $request->ids)->update(['status_id' => 4]);
                return $this->responseWithSuccess(_trans('message.Role inactivate successfully.'), $role);
            }
            return $this->responseWithError(_trans('message.Role inactivate failed'), [], 400);
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }

    public function destroyAll($request)
    {
        try {
            if (@$request->ids) {
                $role = $this->role->where('company_id', auth()->user()->company_id)->whereIn('id', $request->ids)->update(['deleted_at' => now()]);
                return $this->responseWithSuccess(_trans('message.Role activate successfully.'), $role);
            } else {
                return $this->responseWithError(_trans('message.Role not found'), [], 400);
            }
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }

    //new functions

    public function createAttributes()
    {
        return [
            'name' => [
                'field' => 'input',
                'type' => 'text',
                'required' => true,
                'id' => 'name',
                'class' => 'form-control ot-form-control ot-input',
                'col' => 'col-md-12 form-group mb-3',
                'label' => _trans('common.Name'),
            ],
            'status' => [
                'field' => 'select',
                'type' => 'select',
                'required' => true,
                'id' => 'status',
                'class' => 'form-select select2-input ot-input mb-3 modal_select2',
                'col' => 'col-md-12 form-group mb-3',
                'label' => _trans('common.Status'),
                'options' => [
                    [
                        'text' => _trans('payroll.Active'),
                        'value' => 1,
                        'active' => true,
                    ],
                    [
                        'text' => _trans('payroll.Inactive'),
                        'value' => 4,
                        'active' => false,
                    ],
                ],
            ],

        ];
    }

    public function newStore($request)
    {
        try {
            if ($this->isExistsWhenStore($this->role, 'name', $request->name)) {
                $role = new $this->role;
                $role->name = $request->name;
                $role->slug = Str::slug($request->name, '-');
                $role->status_id = $request->status;
                $role->company_id = auth()->user()->company_id;
                $role->branch_id = userBranch();
                $role->save();
                $this->createdBy($role);
                return $this->responseWithSuccess(_trans('message.Role delete successfully.'), 200);
            } else {
                return $this->responseWithError(_trans('message.Data already exists'), [], 400);
            }
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }

    public function changeLogin($request)
    {
        try {
            $role = $this->role->where('company_id', auth()->user()->company_id)->where('branch_id',auth()->user()->branch_id)->where('id', $request->id)->first();
            if ($role) {
                if ($request->type == 'web_login') {
                    $role->web_login = $role->web_login == 1 ? 4 : 1;
                }
                if ($request->type == 'app_login') {
                    $role->app_login = $role->app_login == 1 ? 4 : 1;
                }
                $role->save();
            }
            return $role;
        } catch (\Throwable $th) {
            return $this->responseWithError($th->getMessage(), [], 400);
        }
    }
}
