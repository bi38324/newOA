<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//$api = app('Dingo\Api\Routing\Router');

//Route::get('/', function () {
//   $user = session('wechat.oauth_user.default');// 拿到授权用户资料
//   dd($user);
//})->middleware('wechat.oauth');

Route::get('/orders_confirm', function () {
    return view('orders.confirm');
});

Route::middleware('wechat.oauth')->group(function ($api) {
    // 微信授权
    $api->get('/', 'OrdersController@index');
});
//$api->version('v1', [
//    'middleware' => 'wechat.oauth',
//], function ($api) {
//    // 微信授权
//    $api->get('/', 'OrdersController@index.php');
//
//});

Route::get('/orders_list', function () {
    return view('orders.list');
});
