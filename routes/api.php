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
$api = app('Dingo\Api\Routing\Router');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


$api->version('v1', [
    'namespace' => 'App\Http\Controllers\Api',
    //'middleware' => '',
], function ($api) {
    // 微信授权
    $api->post('getWeChatInfo', 'WeChatController@getWeChatInfo');
    $api->post('getOrders', 'WeChatController@getOrdersInfo');
    $api->post('bindPhone', 'WeChatController@bindPhone');
    $api->post('getAllOrders', 'WeChatController@getAllOrders');

});
