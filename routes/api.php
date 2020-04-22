<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// user routes
Route::post('login', 'UserController@login');
Route::group(['middleware' => 'auth:api'], function () {
    Route::get('templates', 'UserController@index');
    Route::get('templates/{id}', 'UserController@show')->middleware('can:own-template,id');
    Route::patch('templates/{id}', 'UserController@update')->middleware('can:own-template,id');
});


// admin routes
Route::post('admin/login', 'AdminController@login');
Route::group(['middleware' => ['auth:api', 'isAdmin']], function () {
    Route::prefix('admin')->group(function () {
        Route::get('users', 'AdminController@users');
        Route::get('templates', 'AdminController@templates');
        Route::post('templates', 'AdminController@store');
        Route::get('templates/{id}', 'AdminController@show');
        Route::delete('templates/{id}', 'AdminController@delete');
        Route::patch('templates/{id}', 'AdminController@update');
    });
});