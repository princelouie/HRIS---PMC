<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Role\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::check()) {
            if (@Auth::user())
            {
                // dd(Auth::user()->company_id);
                $role_id=Auth::user()->role_id;
                $role=DB::table('roles')->where('id',$role_id)->first();
                if ($role->web_login != 1) {
                    Auth::logout();
                    return redirect('/sign-in')->with('error', 'You are not allowed to login to the admin panel');
                }
                return $next($request);
            } else {
                abort('401');
            }
         } else {
             return redirect('/');
         }
    }
}
