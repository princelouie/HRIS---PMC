<?php

namespace App\Http\Controllers;

use Notification;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Http;
use App\Models\Permission\Permission;
use App\Notifications\HrmSystemNotification;
use App\Helpers\CoreApp\Traits\PermissionTrait;

class DevController extends Controller
{
    use PermissionTrait;
    
    public function sendNotification(Request $request)
    {
        $user = User::first();
  
        $details = [
            'title' => 'Hi Artisan',
            'body' => 'This is my first notification',
            'actionText' => 'View My Site',
            'actionURL' => [
                'app' => '',
                'web' => url('/'),
                'target' => '_blank',
            ],
            'sender_id' => 46
        ];
  
        Notification::send($user, new HrmSystemNotification($details));
   
    }



    public function permissionUpdate()
    {
        try {
            DB::beginTransaction();
            $delete_existing_permissions = Permission::truncate();
            $attributes = $this->adminRolePermissions();
            foreach ($attributes as $key => $attribute) {
                $permission = new Permission;
                $permission->attribute = $key;
                $permission->keywords = $attribute;
                $permission->save();
            }
            DB::commit();
            Toastr::success(_trans('settings.Permission updated successfully'), 'Success');
            return redirect()->back();
        } catch (\Throwable $th) {
            DB::rollBack();
            Toastr::error(_trans('response.Something went wrong!'), 'Error');
            return redirect()->back();
        }
        
    }

    public function syncFlug($language_name)
    {
       try {
        $url = "https://restcountries.com/v3.1/lang/Afrikaans";

        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        
        $response = curl_exec($curl);
        curl_close($curl);
       } catch (\Throwable $th) {
       }
    }
}
