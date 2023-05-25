<?php

use Carbon\Carbon;
use App\Models\User;
use App\Models\Upload;
use App\Models\Translation;
use Illuminate\Support\Str;
use App\Models\Frontend\Menu;
use App\Models\Settings\ApiSetup;
use Illuminate\Support\Facades\DB;
use App\Models\Visit\VisitSchedule;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Log;
use App\Models\Settings\HrmLanguage;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Config;
use App\Models\coreApp\Setting\Setting;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use App\Models\Hrm\Attendance\Attendance;
use App\Models\Hrm\Attendance\EmployeeBreak;
use App\Notifications\HrmSystemNotification;
use App\Models\coreApp\Setting\CompanyConfig;
use App\Repositories\Hrm\Attendance\AttendanceRepository;

/*
 * Set active class
 */



function menu_active_by_route($route)
{
    return request()->routeIs($route) ? 'active' : 'in-active';
}
function menu_active_by_url($url)
{
    return url()->current() == $url ? 'active' : 'in-active';
}

function set_active($path, $active = 'mm-show')
{
    return call_user_func_array('Request::is', (array)$path) ? $active : '';
}
if (!function_exists('breadcrumb')) {
    function breadcrumb($list)
    {
        $html = '<div class="breadcrumb-warning d-flex justify-content-between ot-card">';
        if (@$list['title']) {
            $html .= '<div><h3>' . @$list['title'] . '</h3></div>';
            unset($list['title']);
        }
        $html .= '<nav aria-label="breadcrumb ">';
        $html .= '<ol class="breadcrumb ot-breadcrumb ot-breadcrumb-basic">';
        foreach ($list as $key => $value) {
            if ($key == '#') {
                $html .= '<li class="breadcrumb-item active">' . $value . '</li>';
            } else {
                $html .= '<li class="breadcrumb-item ">';
                $html .= '<a href="' . $key . '">' . $value . '</a>';
                $html .= '</li>';
            }
        }
        $html .= '</ol>';
        $html .= '</nav>';
        $html .= '</div>';
        return $html;
    }
}

function getMonthDays($month): array
{
    $date = Carbon::parse($month);
    $startOfMonth = $date->copy()->startOfMonth()->subDay();
    $endOfMonth = $date->copy()->endOfMonth()->format('d');
    $monthDays = [];

    for ($i = 0; $i < $endOfMonth; $i++) {
        $monthDays[] = $startOfMonth->addDay()->startOfDay()->copy();
    }

    return $monthDays;
}

if (!function_exists('appMode')) {
    function appMode()
    {
        $app_sync = Config::get('app.app_sync');
        $app_style = Config::get('app.APP_STYLE');
        if ($app_sync) {
            if ($app_style == 'demo') {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}

if (!function_exists('userBranch')) {
    function userBranch()
    {
     try {
        $user = Auth::user();
        if ($user->role->slug == 'admin') {
            if (Session::has('session_branch_id')) {
                return Session::get('session_branch_id');
            } else {
                return $user->branch_id;
            }
        } else {
            return $user->branch_id;
        }
     } catch (\Throwable $th) {
       return 1;
     }
    }
}
if (!function_exists('demoCheck')) {
    function demoCheck($message = '')
    {
        if (appMode()) {
            if (empty($message)) {
                $message = 'For the demo version, you cannot change this';
            }
            Toastr::error($message, 'Failed');
            return true;
        } else {
            return false;
        }
    }
}
if (!function_exists('getSetting')) {
    function getSetting($key)
    {
        try {
            $data = ApiSetup::where('name', $name)
                ->select('key', 'secret', 'endpoint', 'status_id')
                ->first();
            return $data;
        } catch (\Throwable $th) {
            return null;
        }
    }
}
if (!function_exists('_trasnlation')) {
    function _trasnlation($key)
    {
        $trans = trans($key);
        try {
            $exp = explode('.', $trans);
            if (count($exp) == 2) {
                return $exp[1];
            } else {
                return $trans;
            }
        } catch (\Throwable $th) {
            return $key;
        }
    }
}
if (!function_exists('_trans')) {
    function _trans($value)
    {
        try {
            $local = app()->getLocale();

            $langPath = resource_path('lang/' . $local . '/');

            if (!file_exists($langPath)) {
                mkdir($langPath, 0777, true);
            }

            if (str_contains($value, '.')) {
                $new_trns = explode('.', $value);
                $file_name = $new_trns[0];
                $trans_key = $new_trns[1];


                $file_path = $langPath . '' . $file_name . '.json';
                if (file_exists($file_path)) {

                    $file_data = json_decode(file_get_contents($file_path), true);
                    $file_content = new \stdClass;
                    foreach (array_keys($file_data) as $property) {
                        $file_content->{$property} = $file_data[$property];
                    }
                    if (array_key_exists($trans_key, $file_data)) {
                        return $file_content->{$trans_key};
                    } else {
                        $file_content->{$trans_key} = $trans_key;
                        $str = <<<EOT
                                            {
                                            EOT;
                        foreach ($file_content as $key => $val) {
                            if (gettype($val) == 'string') {

                                $line = <<<EOT
                                                                    "{$key}" : "{$val}",\n
                                                                EOT;
                            }
                            if (gettype($val) == 'array') {
                                $line =  <<<EOT
                                                                            "{$key}": [\n
                                                                        EOT;
                                $str .= $line;
                                foreach ($val as $lang_key => $lang_val) {

                                    $line =  <<<EOT
                                                                            "{$lang_key}": "{$lang_val}",\n
                                                                        EOT;

                                    $str .= $line;
                                }

                                $line =  <<<EOT
                                                                        ],\n
                                                                    EOT;
                            }

                            $str .= $line;
                        }
                        $end = <<<EOT
                                                 }
                                            EOT;
                        $str .= $end;

                        $new_setting = [];
                        $new_setting[$trans_key] = $trans_key;
                        $merged_array = array_merge($file_data, $new_setting);
                        $merged_array = json_encode($merged_array, JSON_PRETTY_PRINT);
                        file_put_contents($file_path, $merged_array);
                    }
                } else {

                    fopen($file_path, 'w');

                    $file_content = [];
                    $file_content[$trans_key] = $trans_key;


                    $str = <<<EOT
                                            {
                                            EOT;
                    foreach ($file_content as $key => $val) {
                        if (gettype($val) == 'string') {

                            $line = <<<EOT
                                                                    "{$key}" : "{$val}"\n
                                                                EOT;
                        }
                        if (gettype($val) == 'array') {
                            $line =  <<<EOT
                                                                            "{$key}" : [\n
                                                                        EOT;
                            $str .= $line;
                            foreach ($val as $lang_key => $lang_val) {

                                $line =  <<<EOT
                                                                            "{$lang_key}" : "{$lang_val}",\n
                                                                        EOT;

                                $str .= $line;
                            }

                            $line =  <<<EOT
                                                                        ]\n
                                                                    EOT;
                        }

                        $str .= $line;
                    }
                    $end = <<<EOT
                                                }
                                            EOT;
                    $str .= $end;
                    $file_data = json_encode($str);
                    $file_data = json_decode($file_data, true);
                    $new_setting = [];
                    $new_setting[$trans_key] = $trans_key;
                    file_put_contents($file_path, $file_data);
                }
                return _trasnlation($value);
            } else {

                $trans_key = $value;
                $file_path = resource_path('lang/' . $local . '/' . $local . '.json');

                fopen($file_path, 'w');
                $file_content = [];
                $file_content[$trans_key] = $trans_key;
                $str = <<<EOT
                                            {
                                            EOT;
                foreach ($file_content as $key => $val) {
                    if (gettype($val) == 'string') {

                        $line = <<<EOT
                                                                    "{$key}" : "{$val}",\n
                                                                EOT;
                    }
                    if (gettype($val) == 'array') {
                        $line =  <<<EOT
                                                                            "{$key}" : [\n
                                                                        EOT;
                        $str .= $line;
                        foreach ($val as $lang_key => $lang_val) {

                            $line =  <<<EOT
                                                                            "{$lang_key}" : "{$lang_val}",\n
                                                                        EOT;

                            $str .= $line;
                        }

                        $line =  <<<EOT
                                                                        ],\n
                                                                    EOT;
                    }

                    $str .= $line;
                }
                $end = <<<EOT
                                                }

                                            EOT;
                $str .= $end;

                $file_data = json_encode($str);
                $file_data = json_decode($file_data, true);
                $new_setting = [];
                $new_setting[$trans_key] = $trans_key;
                file_put_contents($file_path, $file_data);

                return _trasnlation($value);
            }
            return _trasnlation($value);
        } catch (Exception $exception) {
            return $value;
        }
    }
}



function set_menu(array $path, $active = 'show')
{
    foreach ($path as $route) {
        print_r($route);
        if (Route::currentRouteName() == $route) {
            return $active;
        }
    }
    return (request()->is($path)) ? $active : '';
}

function random($length = 8)
{
    if (!function_exists('openssl_random_pseudo_bytes')) {
        throw new RuntimeException('OpenSSL extension is required.');
    }

    $bytes = openssl_random_pseudo_bytes($length * 2);

    if ($bytes === false) {
        throw new RuntimeException('Unable to generate random string.');
    }

    return substr(str_replace(array('/', '+', '='), '', base64_encode($bytes)), 0, $length);
}

function string_clean($string)
{
    $string = str_replace(array('[\', \']'), '', $string);
    $string = preg_replace(array('/[^a-z0-9]/i', '/[-]+/'), ' ', $string);
    return strtolower(trim($string, ' '));
}

function main_date_format($data)
{
    return date('d M y', strtotime($data));
}

function main_time_format($data)
{
    return date('H:i:s', strtotime($data));
}
if (!function_exists('uploaded_asset')) {
    function uploaded_asset($id)
    {
        if (($asset = Upload::find($id)) != null) {
            return my_asset($asset->img_path);
        } else {
            return url('public/static/blank_small.png');
        }
        return url('public/static/blank_small.png');
    }
}
if (!function_exists('logo_light')) {
    function logo_light($id)
    {
        if (($asset = Upload::find($id)) != null) {
            return my_asset($asset->img_path);
        } else {
            return url('public/assets/logo-white.png');
        }
        return url('public/assets/logo-white.png');
    }
}
if (!function_exists('logo_dark')) {
    function logo_dark($id)
    {
        if (($asset = Upload::find($id)) != null) {
            return my_asset($asset->img_path);
        } else {
            return url('public/assets/logo-dark.png');
        }
        return url('public/assets/logo-dark.png');
    }
}
if (!function_exists('company_fav_icon')) {
    function company_fav_icon($id)
    {
        if (($asset = Upload::find($id)) != null) {
            return my_asset($asset->img_path);
        } else {
            return url('public/assets/favicon.png');
        }
        return url('public/assets/favicon.png');
    }
}
if (!function_exists('background_asset')) {
    function background_asset($id)
    {
        if (($asset = Upload::find($id)) != null) {
            return my_asset($asset->img_path);
        } else {
            return url('public/assets/images/BG2.jpg');
        }
        return url('public/assets/images/BG2.jpg');
    }
}

if (!function_exists('uploaded_asset_with_type')) {
    function uploaded_asset_with_type($id)
    {
        if (($asset = Upload::find($id)) != null) {
            return [
                'path' => my_asset($asset->img_path),
                'type' => $asset->type
            ];
        } else {
            return [
                'path' => url('public/static/blank_small.png'),
                'type' => 'image'
            ];
        }
    }
}

if (!function_exists('uploaded_asset_with_user')) {
    function uploaded_asset_with_user($id)
    {
        if ($user = User::find($id)) {
            if ($asset = Upload::find($user->avatar_id))
                return my_asset($asset->img_path);
            else
                return url('public/static/blank_small.png');
        } else
            return url('public/static/blank_small.png');
    }
}

if (!function_exists('check_file_exist')) {
    function check_file_exist($file_path)
    {
        if (file_exists($file_path)) {
            return true;
        } else {
            return false;
        }
    }
}

if (!function_exists('my_asset')) {
    function my_asset($path, $secure = null)
    {
        // \Log::info($path);
        if ($path == "") {
            return url('public/static/blank_small.png');
        } else {
            if (env('FILESYSTEM_DRIVER') == 's3') {
                return Storage::disk('s3')->url($path);
            } elseif (env('FILESYSTEM_DRIVER') == 'local') {
                return Storage::url($path);
            } else {
                return url('public/static/blank_small.png');
            }
        }
    }
}


function asset_path($id)
{
    $path = Upload::find($id);
    if ($path)
        return $path->img_path;
    return false;
}

function date_format_for_db($date)
{
    $strtotime = strtotime($date);
    $date = date('Y-m-d', $strtotime);
    return $date;
}

function date_format_for_view($date)
{
    $strtotime = strtotime($date);
    $date = date('d/m/Y', $strtotime);
    return $date;
}

// where between is date search string
if (!function_exists('start_end_datetime')) {
    function start_end_datetime($start_date, $end_date)
    {
        $date = [$start_date . ' ' . '00:00:00', $end_date . ' ' . '23:59:59'];
        // Log::info($date);
        return $date;
    }
}

function openJSONFile($lang)
{
    $jsonString = [];
    if (File::exists(base_path('resources/lang/' . $lang . '.json'))) {
        $jsonString = file_get_contents(base_path('resources/lang/' . $lang . '.json'));
        $jsonString = json_decode($jsonString, true);
    }
    return $jsonString;
}

function saveJSONFile($lang, $data)
{
    $jsonData = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    file_put_contents(base_path('resources/lang/' . $lang . '.json'), stripslashes($jsonData));
}

// translate funcation for laravel
if (!function_exists('__translate')) {
    function __translate($key)
    {
        return $key;
    }
}

// translate funcation for laravel
if (!function_exists('_translate')) {
    function _translate($key, $type = true)
    {
        return $key;
    }
}
if (!function_exists('_trans')) {
    function _trans($key, $type = true)
    {
        return $key;
    }
    //asd
}

// random number generated from
function rand_string($length)
{
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return substr(str_shuffle($chars), 0, $length);
}

function actionButton($string, $param, $type = Null)
{
    if ($type == 'delete') {
        return
            '<a href="javascript:;" class="dropdown-item" onclick="' . $param . '">
            ' . $string . '
        </a>';
    } elseif ($type == 'approve') {
        return auth()->user() ?
            '<a href="javascript:;" class="dropdown-item" onclick="' . $param . '">
        ' . $string . '
        </a>'
            : '';
    } elseif ($type == 'reject') {
        return auth()->user() ?
            '<a href="javascript:;" class="dropdown-item" onclick="' . $param . '">
        ' . $string . '
        </a>'
            : '';
    } elseif ($type == 'modal') {
        return auth()->user() ?
            '<a href="javascript:;" class="dropdown-item" onclick="' . $param . '">
        ' . $string . '
        </a>'
            : '';
    } else {
        return auth()->user() ?
            '<a class="dropdown-item" href="' . $param . '">
            ' . _translate($string, false) . '
            </a>'
            : '';
    }
}

if (!function_exists('numberTowords')) {
    function numberTowords($num)
    {

        $ones = array(
            0 => "ZERO",
            1 => "ONE",
            2 => "TWO",
            3 => "THREE",
            4 => "FOUR",
            5 => "FIVE",
            6 => "SIX",
            7 => "SEVEN",
            8 => "EIGHT",
            9 => "NINE",
            10 => "TEN",
            11 => "ELEVEN",
            12 => "TWELVE",
            13 => "THIRTEEN",
            14 => "FOURTEEN",
            15 => "FIFTEEN",
            16 => "SIXTEEN",
            17 => "SEVENTEEN",
            18 => "EIGHTEEN",
            19 => "NINETEEN",
            "01" => "ZERO ONE",
            "02" => "ZERO TWO",
            "03" => "ZERO THREE",
            "04" => "ZERO FOUR",
            "05" => "ZERO FIVE",
            "06" => "ZERO SIX",
            "07" => "ZERO SEVEN",
            "08" => "ZERO EIGHT",
            "09" => "ZERO NINE",
        );
        $tens = array(
            0 => "ZERO",
            1 => "TEN",
            2 => "TWENTY",
            3 => "THIRTY",
            4 => "FORTY",
            5 => "FIFTY",
            6 => "SIXTY",
            7 => "SEVENTY",
            8 => "EIGHTY",
            9 => "NINETY",
        );
        $hundreds = array(
            "HUNDRED",
            "THOUSAND",
            "MILLION",
            "BILLION",
            "TRILLION",
            "QUARDRILLION",
        ); /*limit t quadrillion */
        $num = number_format($num, 2, ".", ",");
        $num_arr = explode(".", $num);
        $wholenum = $num_arr[0];
        $decnum = $num_arr[1];
        $whole_arr = array_reverse(explode(",", $wholenum));
        krsort($whole_arr, 1);
        $rettxt = "";
        foreach ($whole_arr as $key => $i) {

            while (substr($i, 0, 1) == "0") {
                $i = substr($i, 1, 5);
            }

            if ($i < 20) {
                /* echo "getting:".$i; */
                $rettxt .= @$ones[$i];
            } elseif ($i < 100) {
                if (substr($i, 0, 1) != "0") {
                    $rettxt .= $tens[substr($i, 0, 1)];
                }

                if (substr($i, 1, 1) != "0") {
                    $rettxt .= " " . $ones[substr($i, 1, 1)];
                }
            } else {
                if (substr($i, 0, 1) != "0") {
                    $rettxt .= $ones[substr($i, 0, 1)] . " " . $hundreds[0];
                }

                if (substr($i, 1, 1) != "0") {
                    $rettxt .= " " . $tens[substr($i, 1, 1)];
                }

                if (substr($i, 2, 1) != "0") {
                    $rettxt .= " " . $ones[substr($i, 2, 1)];
                }
            }
            if ($key > 0) {
                $rettxt .= " " . $hundreds[$key] . " ";
            }
        }
        if ($decnum > 0) {
            $rettxt .= " and ";
            if (@$decnum < 20) {
                $rettxt .= $ones[$decnum];
            } elseif ($decnum < 100) {
                $rettxt .= $tens[substr($decnum, 0, 1)];
                $rettxt .= " " . $ones[substr($decnum, 1, 1)];
            }
        }
        return $rettxt;
    }
}

function actionHTML($action_button)
{
    return '<div class="dropdown dropdown-action">
            <button type="button" class="btn-dropdown" data-bs-toggle="dropdown"
                aria-expanded="false">
                <i class="fa-solid fa-ellipsis"></i>
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
            ' . $action_button . '
            </ul>
        </div>';
}
if (!function_exists('settings')) {
    function settings($key)
    {
        try {
            return CompanyConfig::where('key', $key)->first()->value;
        } catch (Exception $e) {
            return null;
        }
    }
}
if (!function_exists('showAmount')) {
    function showAmount($amount)
    {
        try {
            return settings('currency_symbol') . ' ' . $amount;
        } catch (Exception $e) {
            return null;
        }
    }
}

function teams($members)
{
    $make_membars = '';
    foreach ($members as $member) {
        if (hasPermission('profile_view')) {
            $url = route('user.profile', [$member->user->id, 'official']);
        } else {
            $url = '#';
        }
        $make_membars .= '<a target="_blank" href="' . $url  . '"><img data-toggle="tooltip" data-placement="top" title="' . $member->user->name . '" src="' . uploaded_asset($member->user->avatar_id) . '" class="staff-profile-image-small" ></a>';
    }
    return $make_membars;
}

                                   

                                    
function TagImgShow($img,$id,$type){
    // dd($img);
    $url = route('attendance.showModalImage',['id'=>$id,'type'=>$type]);
    $action_button = actionButton('<div class="user-img" ><img data-toggle="tooltip" data-placement="top" src="' . uploaded_asset($img) . '" class="img-cover" ></div>', 'mainModalOpen(`' . $url . '`)', 'modal');
    return $action_button;
}
 

if (!function_exists('showDate')) {
    function showDate($date)
    {
        try {
            if ($date != null) {
                $date_setting = settings('date_format')??'d-m-Y';
                return Carbon::parse($date)->locale(app()->getLocale())->translatedFormat($date_setting);
            } else {
                return 'N/A';
            }
        } catch (\Exception $e) {
            return;
        }
    }
}
if (!function_exists('isModuleActive')) {
    function isModuleActive($module_name)
    {
        try {
            $json = file_get_contents(base_path('modules_statuses.json'));
            $modules = json_decode($json, true);
            if (array_key_exists($module_name, $modules)) {
                return $modules[$module_name];
            } else {
                return false;
            }
        } catch (\Exception $e) {
            return false;
        }
    }
}
if (!function_exists('showTime')) {
    function showTime($time)
    {
        if (settings('time_format') == 'h') {
            return Carbon::createFromFormat('H:i:s', $time)->format('h:i A');
        } else {
            return Carbon::createFromFormat('H:i:s', $time)->format('H:i');
        }
    }
}
if (!function_exists('plainShowTime')) {
    function plainShowTime($time)
    {
        return date("g:i a", strtotime($time));
    }
}
if (!function_exists('showTimeFromTimeStamp')) {
    function showTimeFromTimeStamp($time)
    {
        if (settings('time_format') == 'h') {
            return Carbon::createFromFormat('Y-m-d H:i:s', $time)->format('h:i A');
        } else {
            return Carbon::createFromFormat('Y-m-d H:i:s', $time)->format('H:i');
        }
    }
}
function base_settings($data)
{
    return DB::table('settings')->where('name', $data)->first()->value;
}

function attachment($attachment_id)
{
    // image show
    if ($attachment_id != null) {
        $image = '<img src="' . uploaded_asset($attachment_id) . '" class="img-fluid" alt="image">';
    } else {
        $image = '';
    }
    return $image;
}
if (!function_exists('timeDiff')) {
    function timeDiff($start_time, $end_time, $format, $start_date = null, $end_date = null)
    {
        if ($start_date == null) {
            $start_date = date('Y-m-d');
        }
        if ($end_date == null) {
            $end_date = date('Y-m-d');
        }
        $start_time = Carbon::parse($start_date . ' ' . $start_time);
        $end_time = Carbon::parse($end_date . ' ' . $end_time);
        $diff = $start_time->diffInSeconds($end_time);

        $hours = floor($diff / 3600);
        $minutes = floor(($diff - ($hours * 3600)) / 60);
        $seconds = $diff - ($hours * 3600) - ($minutes * 60);
        if ($format == 'h') {
            return $hours;
        }
        if ($format == 'm') {
            return $minutes;
        }
        if ($format == 's') {
            return $seconds;
        }
        return $hours . ':' . $minutes . ':' . $seconds;
    }
}

function date_diff_days($date, $date2 = null)
{
    $date1 = Carbon::parse($date);
    $date2 = $date2 ?? Carbon::now();
    return $date1->diffInDays($date2);
}


if (!function_exists('appSuperUser')) {

    function appSuperUser()
    {
        if (auth()->user()->is_admin == 1 || auth()->user()->is_hr == 1 || auth()->user()->role_id == 1) {
            return true;
        } else {
            return false;
        }
    }
}
if (!function_exists('is_Admin')) {

    function is_Admin()
    {
        if (auth()->user()->role->slug == 'superadmin' || auth()->user()->role->slug == 'admin' || auth()->user()->role->slug == 'hr') {
            return true;
        } else {
            return false;
        }
    }
}

if (!function_exists('myCompanyData')) {
    function myCompanyData($company_id)
    {
        if ($company_id == auth()->user()->company->id || auth()->user()->role_id == 1) {
            return true;
        } else {
            return false;
        }
    }
}
if (!function_exists('dateFormet')) {
    function dateFormet($date, $format)
    {
        try {
            return Carbon::parse($date)->locale(app()->getLocale())->translatedFormat($format);
        } catch (\Throwable $th) {
            return;
        }
    }
}
if (!function_exists('hasPermission')) {

    function hasPermission($key_word)
    {
        if (config('app.APP_BRANCH') != 'saas' && auth()->user()->is_admin == 1) {
            return true;
        } elseif (in_array($key_word, auth()->user()->permissions)) {
            return true;
        } else {
            return false;
        }
    }
}

//if function not exists
if (!function_exists('sendDatabaseNotification')) {
    function sendDatabaseNotification($user, $details)
    {
        try {
            \Notification::send($user, new HrmSystemNotification($details));
        } catch (\Throwable $th) {
            Log::error('Notification Error:' . $th->getMessage());
        }
    }
}


if (!function_exists('getActionButtons')) {

    function getActionButtons($action_button)
    {
        return '<div class="flex-nowrap">
                    <div class="dropdown">
                        <button class="btn btn-white dropdown-toggle align-text-top action-dot-btn" data-boundary="viewport" data-toggle="dropdown">
                            <i class="fas fa-ellipsis-v"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">' . $action_button . '</div>
                    </div>
                </div>';
    }
}
if (!function_exists('visitStatusColor')) {

    function visitStatusColor($status)
    {
        $status_color = 'FF8F5E';
        switch ($status) {
            case 'started':
                $status_color = 'FF8F5E';
                break;
            case 'reached':
                $status_color = '8A21F3';
                break;
            case 'cancelled':
                $status_color = 'BBC0CC';
                break;
            case 'created':
                $status_color = 'FF8F5E';
                break;
            case 'completed':
                $status_color = '12B89D';
                break;

            default:
                $status_color = 'FF8F5E';
                break;
        }

        return '0xFF' . $status_color;
    }
}
if (!function_exists('arrayObjectUnique')) {

    function arrayObjectUnique($array, $keep_key_assoc = false)
    {
        $duplicate_keys = array();
        $tmp = array();

        foreach ($array as $key => $val) {
            // convert objects to arrays, in_array() does not support objects
            if (is_object($val))
                $val = (array)$val;

            if (!in_array($val, $tmp))
                $tmp[] = $val;
            else
                $duplicate_keys[] = $key;
        }

        foreach ($duplicate_keys as $key)
            unset($array[$key]);

        return $keep_key_assoc ? $array : array_values($array);
    }
}

function appColorCodePrefix(): string
{
    return "0xFF";
}

function getReached($visit)
{
    $reached_at = VisitSchedule::where('visit_id', $visit->id)->where('status', "reached")->latest()->first();
    if ($reached_at) {
        return onlyTimePlainText($reached_at->reached_at);
    }
    return null;
}
function getDurration($visit)
{
    $started_at = VisitSchedule::where('visit_id', $visit->id)->where('status', "started")->first();
    $reached_at = VisitSchedule::where('visit_id', $visit->id)->where('status', "reached")->latest()->first();
    if ($started_at != '' && $reached_at != '') {
        $start_time = strtotime($started_at->started_at);
        $end_time = strtotime($reached_at->reached_at);
        $diff = $end_time - $start_time;
        $hours = floor($diff / 3600);
        $minutes = floor(($diff - ($hours * 3600)) / 60);
        $seconds = $diff - ($hours * 3600) - ($minutes * 60);
        return $hours . 'hr ' . $minutes . 'm ' . $seconds . 's';
    }
    return null;
}


function dateFormatInPlainText($date): string
{
    return Carbon::parse($date)->format("F j, Y, g:i a");
}

function onlyTimePlainText($date): string
{
    return Carbon::parse($date)->format("g:i a");
}
function onlyDateMonthYear($date): string
{
    return Carbon::parse($date)->isoFormat('Do MMM, YYYY');
}

function getCurrencyByCode($code)
{
    $list = array(
        'ALL' => 'Albania Lek',
        'AFN' => 'Afghanistan Afghani',
        'ARS' => 'Argentina Peso',
        'AWG' => 'Aruba Guilder',
        'AUD' => 'Australia Dollar',
        'AZN' => 'Azerbaijan New Manat',
        'BSD' => 'Bahamas Dollar',
        'BBD' => 'Barbados Dollar',
        'BDT' => 'Bangladeshi taka',
        'BYR' => 'Belarus Ruble',
        'BZD' => 'Belize Dollar',
        'BMD' => 'Bermuda Dollar',
        'BOB' => 'Bolivia Boliviano',
        'BAM' => 'Bosnia and Herzegovina Convertible Marka',
        'BWP' => 'Botswana Pula',
        'BGN' => 'Bulgaria Lev',
        'BRL' => 'Brazil Real',
        'BND' => 'Brunei Darussalam Dollar',
        'KHR' => 'Cambodia Riel',
        'CAD' => 'Canada Dollar',
        'KYD' => 'Cayman Islands Dollar',
        'CLP' => 'Chile Peso',
        'CNY' => 'China Yuan Renminbi',
        'COP' => 'Colombia Peso',
        'CRC' => 'Costa Rica Colon',
        'HRK' => 'Croatia Kuna',
        'CUP' => 'Cuba Peso',
        'CZK' => 'Czech Republic Koruna',
        'DKK' => 'Denmark Krone',
        'DOP' => 'Dominican Republic Peso',
        'XCD' => 'East Caribbean Dollar',
        'EGP' => 'Egypt Pound',
        'SVC' => 'El Salvador Colon',
        'EEK' => 'Estonia Kroon',
        'EUR' => 'Euro Member Countries',
        'FKP' => 'Falkland Islands (Malvinas) Pound',
        'FJD' => 'Fiji Dollar',
        'GHC' => 'Ghana Cedis',
        'GIP' => 'Gibraltar Pound',
        'GTQ' => 'Guatemala Quetzal',
        'GGP' => 'Guernsey Pound',
        'GYD' => 'Guyana Dollar',
        'HNL' => 'Honduras Lempira',
        'HKD' => 'Hong Kong Dollar',
        'HUF' => 'Hungary Forint',
        'ISK' => 'Iceland Krona',
        'INR' => 'India Rupee',
        'IDR' => 'Indonesia Rupiah',
        'IRR' => 'Iran Rial',
        'IMP' => 'Isle of Man Pound',
        'ILS' => 'Israel Shekel',
        'JMD' => 'Jamaica Dollar',
        'JPY' => 'Japan Yen',
        'JEP' => 'Jersey Pound',
        'KZT' => 'Kazakhstan Tenge',
        'KPW' => 'Korea (North) Won',
        'KRW' => 'Korea (South) Won',
        'KGS' => 'Kyrgyzstan Som',
        'LAK' => 'Laos Kip',
        'LVL' => 'Latvia Lat',
        'LBP' => 'Lebanon Pound',
        'LRD' => 'Liberia Dollar',
        'LTL' => 'Lithuania Litas',
        'MKD' => 'Macedonia Denar',
        'MYR' => 'Malaysia Ringgit',
        'MUR' => 'Mauritius Rupee',
        'MXN' => 'Mexico Peso',
        'MNT' => 'Mongolia Tughrik',
        'MZN' => 'Mozambique Metical',
        'NAD' => 'Namibia Dollar',
        'NPR' => 'Nepal Rupee',
        'ANG' => 'Netherlands Antilles Guilder',
        'NZD' => 'New Zealand Dollar',
        'NIO' => 'Nicaragua Cordoba',
        'NGN' => 'Nigeria Naira',
        'NOK' => 'Norway Krone',
        'OMR' => 'Oman Rial',
        'PKR' => 'Pakistan Rupee',
        'PAB' => 'Panama Balboa',
        'PYG' => 'Paraguay Guarani',
        'PEN' => 'Peru Nuevo Sol',
        'PHP' => 'Philippines Peso',
        'PLN' => 'Poland Zloty',
        'QAR' => 'Qatar Riyal',
        'RON' => 'Romania New Leu',
        'RUB' => 'Russia Ruble',
        'SHP' => 'Saint Helena Pound',
        'SAR' => 'Saudi Arabia Riyal',
        'RSD' => 'Serbia Dinar',
        'SCR' => 'Seychelles Rupee',
        'SGD' => 'Singapore Dollar',
        'SBD' => 'Solomon Islands Dollar',
        'SOS' => 'Somalia Shilling',
        'ZAR' => 'South Africa Rand',
        'LKR' => 'Sri Lanka Rupee',
        'SEK' => 'Sweden Krona',
        'CHF' => 'Switzerland Franc',
        'SRD' => 'Suriname Dollar',
        'SYP' => 'Syria Pound',
        'TWD' => 'Taiwan New Dollar',
        'THB' => 'Thailand Baht',
        'TTD' => 'Trinidad and Tobago Dollar',
        'TRY' => 'Turkey Lira',
        'TRL' => 'Turkey Lira',
        'TVD' => 'Tuvalu Dollar',
        'UAH' => 'Ukraine Hryvna',
        'GBP' => 'United Kingdom Pound',
        'USD' => 'United States Dollar',
        'UYU' => 'Uruguay Peso',
        'UZS' => 'Uzbekistan Som',
        'VEF' => 'Venezuela Bolivar',
        'VND' => 'Viet Nam Dong',
        'YER' => 'Yemen Rial',
        'ZWD' => 'Zimbabwe Dollar'
    );
    if (isset($list[$code])) {
        $data = [
            'code' => $code,
            'name' => $list[$code]
        ];
        return $data;
    } else {
        return '';
    }
}
function getCode($n)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomString = '';

    for ($i = 0; $i < $n; $i++) {
        $index = rand(0, strlen($characters) - 1);
        $randomString .= $characters[$index];
    }

    return $randomString;
}

function get_country_currency($code)
{
    $list =  array(
        'AF' => 'AFN',
        'AL' => 'ALL',
        'DZ' => 'DZD',
        'AS' => 'USD',
        'AD' => 'EUR',
        'AO' => 'AOA',
        'AI' => 'XCD',
        'AQ' => 'XCD',
        'AG' => 'XCD',
        'AR' => 'ARS',
        'AM' => 'AMD',
        'AW' => 'AWG',
        'AU' => 'AUD',
        'AT' => 'EUR',
        'AZ' => 'AZN',
        'BS' => 'BSD',
        'BH' => 'BHD',
        'BD' => 'BDT',
        'BB' => 'BBD',
        'BY' => 'BYR',
        'BE' => 'EUR',
        'BZ' => 'BZD',
        'BJ' => 'XOF',
        'BM' => 'BMD',
        'BT' => 'BTN',
        'BO' => 'BOB',
        'BA' => 'BAM',
        'BW' => 'BWP',
        'BV' => 'NOK',
        'BR' => 'BRL',
        'IO' => 'USD',
        'BN' => 'BND',
        'BG' => 'BGN',
        'BF' => 'XOF',
        'BI' => 'BIF',
        'KH' => 'KHR',
        'CM' => 'XAF',
        'CA' => 'CAD',
        'CV' => 'CVE',
        'KY' => 'KYD',
        'CF' => 'XAF',
        'TD' => 'XAF',
        'CL' => 'CLP',
        'CN' => 'CNY',
        'HK' => 'HKD',
        'CX' => 'AUD',
        'CC' => 'AUD',
        'CO' => 'COP',
        'KM' => 'KMF',
        'CG' => 'XAF',
        'CD' => 'CDF',
        'CK' => 'NZD',
        'CR' => 'CRC',
        'HR' => 'HRK',
        'CU' => 'CUP',
        'CY' => 'EUR',
        'CZ' => 'CZK',
        'DK' => 'DKK',
        'DJ' => 'DJF',
        'DM' => 'XCD',
        'DO' => 'DOP',
        'EC' => 'ECS',
        'EG' => 'EGP',
        'SV' => 'SVC',
        'GQ' => 'XAF',
        'ER' => 'ERN',
        'EE' => 'EUR',
        'ET' => 'ETB',
        'FK' => 'FKP',
        'FO' => 'DKK',
        'FJ' => 'FJD',
        'FI' => 'EUR',
        'FR' => 'EUR',
        'GF' => 'EUR',
        'TF' => 'EUR',
        'GA' => 'XAF',
        'GM' => 'GMD',
        'GE' => 'GEL',
        'DE' => 'EUR',
        'GH' => 'GHS',
        'GI' => 'GIP',
        'GR' => 'EUR',
        'GL' => 'DKK',
        'GD' => 'XCD',
        'GP' => 'EUR',
        'GU' => 'USD',
        'GT' => 'QTQ',
        'GG' => 'GGP',
        'GN' => 'GNF',
        'GW' => 'GWP',
        'GY' => 'GYD',
        'HT' => 'HTG',
        'HM' => 'AUD',
        'HN' => 'HNL',
        'HU' => 'HUF',
        'IS' => 'ISK',
        'IN' => 'INR',
        'ID' => 'IDR',
        'IR' => 'IRR',
        'IQ' => 'IQD',
        'IE' => 'EUR',
        'IM' => 'GBP',
        'IL' => 'ILS',
        'IT' => 'EUR',
        'JM' => 'JMD',
        'JP' => 'JPY',
        'JE' => 'GBP',
        'JO' => 'JOD',
        'KZ' => 'KZT',
        'KE' => 'KES',
        'KI' => 'AUD',
        'KP' => 'KPW',
        'KR' => 'KRW',
        'KW' => 'KWD',
        'KG' => 'KGS',
        'LA' => 'LAK',
        'LV' => 'EUR',
        'LB' => 'LBP',
        'LS' => 'LSL',
        'LR' => 'LRD',
        'LY' => 'LYD',
        'LI' => 'CHF',
        'LT' => 'EUR',
        'LU' => 'EUR',
        'MK' => 'MKD',
        'MG' => 'MGF',
        'MW' => 'MWK',
        'MY' => 'MYR',
        'MV' => 'MVR',
        'ML' => 'XOF',
        'MT' => 'EUR',
        'MH' => 'USD',
        'MQ' => 'EUR',
        'MR' => 'MRO',
        'MU' => 'MUR',
        'YT' => 'EUR',
        'MX' => 'MXN',
        'FM' => 'USD',
        'MD' => 'MDL',
        'MC' => 'EUR',
        'MN' => 'MNT',
        'ME' => 'EUR',
        'MS' => 'XCD',
        'MA' => 'MAD',
        'MZ' => 'MZN',
        'MM' => 'MMK',
        'NA' => 'NAD',
        'NR' => 'AUD',
        'NP' => 'NPR',
        'NL' => 'EUR',
        'AN' => 'ANG',
        'NC' => 'XPF',
        'NZ' => 'NZD',
        'NI' => 'NIO',
        'NE' => 'XOF',
        'NG' => 'NGN',
        'NU' => 'NZD',
        'NF' => 'AUD',
        'MP' => 'USD',
        'NO' => 'NOK',
        'OM' => 'OMR',
        'PK' => 'PKR',
        'PW' => 'USD',
        'PA' => 'PAB',
        'PG' => 'PGK',
        'PY' => 'PYG',
        'PE' => 'PEN',
        'PH' => 'PHP',
        'PN' => 'NZD',
        'PL' => 'PLN',
        'PT' => 'EUR',
        'PR' => 'USD',
        'QA' => 'QAR',
        'RE' => 'EUR',
        'RO' => 'RON',
        'RU' => 'RUB',
        'RW' => 'RWF',
        'SH' => 'SHP',
        'KN' => 'XCD',
        'LC' => 'XCD',
        'PM' => 'EUR',
        'VC' => 'XCD',
        'WS' => 'WST',
        'SM' => 'EUR',
        'ST' => 'STD',
        'SA' => 'SAR',
        'SN' => 'XOF',
        'RS' => 'RSD',
        'SC' => 'SCR',
        'SL' => 'SLL',
        'SG' => 'SGD',
        'SK' => 'EUR',
        'SI' => 'EUR',
        'SB' => 'SBD',
        'SO' => 'SOS',
        'ZA' => 'ZAR',
        'GS' => 'GBP',
        'SS' => 'SSP',
        'ES' => 'EUR',
        'LK' => 'LKR',
        'SD' => 'SDG',
        'SR' => 'SRD',
        'SJ' => 'NOK',
        'SZ' => 'SZL',
        'SE' => 'SEK',
        'CH' => 'CHF',
        'SY' => 'SYP',
        'TW' => 'TWD',
        'TJ' => 'TJS',
        'TZ' => 'TZS',
        'TH' => 'THB',
        'TG' => 'XOF',
        'TK' => 'NZD',
        'TO' => 'TOP',
        'TT' => 'TTD',
        'TN' => 'TND',
        'TR' => 'TRY',
        'TM' => 'TMT',
        'TC' => 'USD',
        'TV' => 'AUD',
        'UG' => 'UGX',
        'UA' => 'UAH',
        'AE' => 'AED',
        'GB' => 'GBP',
        'US' => 'USD',
        'UM' => 'USD',
        'UY' => 'UYU',
        'UZ' => 'UZS',
        'VU' => 'VUV',
        'VE' => 'VEF',
        'VN' => 'VND',
        'VI' => 'USD',
        'WF' => 'XPF',
        'EH' => 'MAD',
        'YE' => 'YER',
        'ZM' => 'ZMW',
        'ZW' => 'ZWD',
    );


    if (isset($list[$code])) {
        $data = [
            'code' => $code,
            'name' => $list[$code]
        ];
        return $data;
    } else {
        return '';
    }
}

if (!function_exists('aboutSystem')) {
    function aboutSystem()
    {
        $data = [
            'version' => '',
            'release_date' => ''
        ];
        try {
            $about_system = base_path('version.json');
            $about_system = file_get_contents($about_system);
            $about_system = json_decode($about_system, true);
            $data['version'] = $about_system['version'];
            $data['release_date'] = $about_system['release_date'];
            return $data;
        } catch (\Throwable $th) {
            return $data;
        }
    }
}

function dummyEmployeeList()
{

    return  $list = [
        [
            "name" => "Hr Manager",
            "company_id" => 2,
            "country_id" => 17,
            "phone" => "+88014555887",
            "role_id" => 6,
            "department_id" => 17,
            "designation_id" => 33,
            "shift_id" => 4,
            "is_hr" => 1,
            "email" => "hr@onesttech.com",
        ],
        [
            "name" => "Staff",
            "company_id" => 2,
            "country_id" => 17,
            "phone" => "+8855412547",
            "role_id" => 7,
            "department_id" => 18,
            "designation_id" => 44,
            "shift_id" => 4,
            "is_hr" => 0,
            "email" => "staff@onesttech.com",
        ]
    ];
}

function isBreakRunning()
{

    $user = auth()->user();
    if (@$user->country->time_zone) {
        date_default_timezone_set($user->country->time_zone);
    }
    $takeBreak = EmployeeBreak::query()
        ->where([
            'company_id' => $user->company->id,
            'user_id' => $user->id,
            'date' => date('Y-m-d')
        ])->whereNull('back_time')
        ->first();
    if ($takeBreak) {
        $status = "start";
    } else {
        $status = "end";
    }
    return $status;
}

// function isAttendee()
// {
//     if (Auth::check()) {
//         $attendance = Attendance::where(['user_id' => auth()->user()->id, 'date' => date('Y-m-d')])->latest()->first();
//         if ($attendance) {
//             if ($attendance->check_out) {
//                 return [
//                     'id' => $attendance->id,
//                     'checkin' => true,
//                     'checkout' => true,
//                 ];
//             } else {
//                 return [
//                     'id' => $attendance->id,
//                     'checkin' => true,
//                     'checkout' => false,
//                 ];
//             }
//         } else {
//             return [
//                 'checkin' => false,
//                 'checkout' => false,
//                 'in_time' => null,
//                 'out_time' => null,
//                 'stay_time' => null
//             ];
//         }
//     } else {
//         return [
//             'checkin' => false,
//             'checkout' => false,
//             'in_time' => null,
//             'out_time' => null,
//             'stay_time' => null
//         ];
//     };
// }

function isAttendee()
{
    if (Auth::check()) {
        try {
            $attendance_repository = resolve(AttendanceRepository::class);

            $attendanceStatus= $attendance_repository->getCheckInCheckoutStatus(auth()->user()->id);
            $result =$attendanceStatus->original['data'];

            return $result;
            
        } catch (\Throwable $th) {
            return [
                'checkin' => false,
                'checkout' => false,
                'in_time' => null,
                'out_time' => null,
                'stay_time' => null
            ];
        }
    }else{
        return [
            'checkin' => false,
            'checkout' => false,
            'in_time' => null,
            'out_time' => null,
            'stay_time' => null
        ];
    }
}

function RawTable($table)
{
    return DB::table($table);
}

function dbTable($table, $select = '*', $where = [], $order = ['id', 'desc'])
{
    $query = RawTable($table);
    if (count($where) > 0) {
        $query = $query->where($where)->where('branch_id',userBranch());
    }
    return $query->select($select)->orderBy($order[0], $order[1]);
}

function menu($type = Null)
{
    if ($type) {
        return Menu::with('page')->where('type', $type)->where('status_id', 1)->orderBy('position', 'asc')->get();
    } else {
        return Menu::with('page')->where('status_id', 1)->orderBy('position', 'asc')->get();
    }
}

function dateTimeIn($time): string
{
    $userCountry = auth()->user()->company->country;
    date_default_timezone_set($userCountry->time_zone);
    $now = Carbon::now();
    return $now->parse($time)->format('g:i A');
}

if (!function_exists('userLocal')) {
    function userLocal()
    {
        try {
            $user = auth()->user();
            if (isset($user->lang)) {
                $user_lang = $user->lang;
            } elseif ($user->company->configs) {
                $user_lang = $user->company->configs->where('key', 'lang')->first()->value;
            } else {
                $user_lang = App::getLocale();
            }
            return $user_lang;
        } catch (\Throwable $th) {
            return 'en';
        }
    }
}


function isRTL()
{
    return DB::table('languages')->where('code', userLocal())->first()->rtl;
}



if (!function_exists('putEnvConfigration')) {
    function putEnvConfigration($envKey, $envValue)
    {
        $envValue = str_replace('\\', '\\' . '\\', $envValue);
        $value = '"' . $envValue . '"';
        $envFile = app()->environmentFilePath();
        $str = file_get_contents($envFile);

        $str .= "\n";
        $keyPosition = strpos($str, "{$envKey}=");


        if (is_bool($keyPosition)) {

            $str .= $envKey . '="' . $envValue . '"';
        } else {
            $endOfLinePosition = strpos($str, "\n", $keyPosition);
            $oldLine = substr($str, $keyPosition, $endOfLinePosition - $keyPosition);
            $str = str_replace($oldLine, "{$envKey}={$value}", $str);

            $str = substr($str, 0, -1);
        }

        if (!file_put_contents($envFile, $str)) {
            return false;
        } else {
            return true;
        }
    }
}

if (!function_exists('hrm_languages')) {
    function hrm_languages()
    {
        $languages = HrmLanguage::where('status_id', 1)->get();

        return $languages;
    }
}
if (!function_exists('api_setup')) {
    function api_setup($name, $slug)
    {
        $api_setup = ApiSetup::where('name', $name)->first("{$slug}");
        return $api_setup->{$slug};
    }
}

function currency_format($value)
{
    $currency_symbol = auth()->user()->company->configs->where('key', 'currency_symbol')->first()->value;
    return $currency_symbol . '' . $value;
}

function distanceCalculate($lat1, $lon1, $lat2, $lon2)
{
    $theta = $lon1 - $lon2;
    $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
    $dist = acos($dist);
    $dist = rad2deg($dist);
    // meters
    return $dist * 60 * 1.1515 * 1.609344 * 1000;
}
if (!function_exists('plain_text')) {
    function plain_text($text)
    {
        return Str::title(Str::replace('_', ' ', $text));
    }
}

function breakDuration($date, $user_id)
{
    $hours = 0;
    $minutes = 0;
    $seconds = 0;
    $totalBreakBacks = RawTable('employee_breaks')->where(['date' => $date, 'user_id' => $user_id])->get();

    foreach ($totalBreakBacks as $item) {
        $startTime = strtotime($item->break_time);
        $endTime = strtotime($item->back_time);
        if ($endTime > 0) {
            $totalSeconds = $endTime - $startTime;
        } else {
            $totalSeconds = 0;
        }


        $hours += floor($totalSeconds / 3600);
        $minutes += floor(($totalSeconds / 60) % 60);
        $seconds += $totalSeconds % 60;
    }
    if ($hours > 0) {
        // hour greater than 1 it will be plural
        $hours = $hours . ' ' . Str::plural('hr', $hours);
        if ($minutes > 0) {
            $minutes = $minutes . ' ' . Str::plural('min', $minutes);
            return $hours . ', ' . $minutes;
        } else {
            return $hours;
        }
    } else {
        $minutes = $minutes . ' ' . Str::plural('min', $minutes);
        return $minutes;
    }
}

function number_format_short($n)
{
    $n = floatval($n);
    if ($n >= 0 && $n < 10) {
        $n_format = '0' . ($n);
        $suffix = '';
    } elseif ($n >= 10 && $n < 1000) {
        // 1 - 999
        $n_format = floor($n);
        $suffix = '';
    } elseif ($n > 1000) {
        $x = round($n);
        $x_number_format = number_format($x);
        $x_array = explode(',', $x_number_format);
        $x_parts = array('k', 'm', 'b', 't');
        $x_count_parts = count($x_array) - 1;
        $x_display = $x;
        $x_display = $x_array[0] . ((int) $x_array[1][0] !== 0 ? '.' . $x_array[1][0] : '');
        $x_display .= $x_parts[$x_count_parts - 1];

        return $x_display;
    }


    return !empty($n_format . $suffix) ? $n_format . $suffix : 0;
}

function cleanSpecialCharacters($string)
{
    $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.

    return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
}

//if function not exists
if (!function_exists('getUserIpAddr')) {
    function getUserIpAddr()
    {
        try {
            $ipaddress = '';
            if (isset($_SERVER['HTTP_CLIENT_IP']))
                $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
            else if (isset($_SERVER['HTTP_X_FORWARDED_FOR']))
                $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
            else if (isset($_SERVER['HTTP_X_FORWARDED']))
                $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
            else if (isset($_SERVER['HTTP_FORWARDED_FOR']))
                $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
            else if (isset($_SERVER['HTTP_FORWARDED']))
                $ipaddress = $_SERVER['HTTP_FORWARDED'];
            else if (isset($_SERVER['REMOTE_ADDR']))
                $ipaddress = $_SERVER['REMOTE_ADDR'];
            else
                $ipaddress = getUserIpAddr();

            return $ipaddress;
        } catch (\Throwable $th) {
            return getUserIpAddr();
        }
    }
}

//spearate time and date from datetime
if (!function_exists('separateDateAndTime')) {
    function separateDateAndTime($datetime,$date_or_time=null)
    {
        $date = date('Y-m-d', strtotime($datetime));
        $time = date('h:i:s', strtotime($datetime));
        if($date_or_time == 'date'){
            return $date;
        }elseif($date_or_time == 'time'){
            return $time;
        }else{
            return ['date' => $date, 'time' => $time];
        }
    }
}
