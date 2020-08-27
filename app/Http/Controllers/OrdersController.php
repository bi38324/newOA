<?php

namespace App\Http\Controllers;
use App\Http\Model\Orders;
use App\Http\Services\WxUserService;
use App\Libs\WechatApi;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    public function index()
    {
        $user = session('wechat.oauth_user.default');// 拿到授权用户资料
        $wx_user = json_decode(json_encode($user,true),true);
        return view('orders.list', ['user' => $wx_user]);
    }
}
