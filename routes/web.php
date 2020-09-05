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
//
Route::middleware('wechat.oauth')->group(function ($api) {
    // 订单列表
//    $api->get('/orders', 'OrdersController@list');
    $api->get('/orders_confirm', 'OrdersController@confirm');
    // 客户绑定手机号
    $api->post('/bindPhone', 'OrdersController@bindPhone');
});

// 确认订单
Route::post('/order_handle','OrdersController@order_handle');
Route::any('/orders_info','OrdersController@info');
Route::any('/orders', 'OrdersController@list');
