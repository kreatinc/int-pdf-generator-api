<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
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
        // get the authenticated user and check if he has the an admin role
        $auth = Auth::user();
        if(!$auth->isAdmin()) {
            return response(['error'=>'Unauthorized'],404);
        }
        return $next($request);
    }
}
