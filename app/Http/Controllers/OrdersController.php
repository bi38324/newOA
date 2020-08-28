<?php

namespace App\Http\Controllers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerContact;
use App\Http\Model\Orders;
use App\Http\Model\OrdersDetail;
use App\Http\Model\OrdersStatus;
use App\Http\Model\ordersStatusLog;
use App\Http\Services\OrdersService;
use App\Http\Services\WxUserService;
use App\Libs\WechatApi;
use Illuminate\Http\Request;


class OrdersController extends Controller
{
    /**
     * 订单列表
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function list()
    {
        $user = session('wechat.oauth_user.default');// 拿到授权用户资料
        $wx_user = json_decode(json_encode($user,true),true);
        return view('orders.list', ['user' => $wx_user]);
    }

//    public function info(Request $request)
//    {
//        $user = session('wechat.oauth_user.default');// 拿到授权用户资料
//        $wx_user = json_decode(json_encode($user,true),true);
//        return view('orders.list', ['user' => $wx_user]);
//    }

    public function confirm(Request $request)
    {
        $order_id = $request->input('order_id');

        $order = (new OrdersService())->getOrdersInfo($order_id);

        $user = session('wechat.oauth_user.default');// 拿到授权用户资料
        $wx_user = json_decode(json_encode($user,true),true);
//        $wx_user = [
//            'id' => 'asdasdasofihwrhwe',
//            'headImgUrl' => null,
//            'sex' => null
//        ];
        // 判断当前用户是否绑定手机号
        $customer_contact = (new CustomerContact())->getByOpenId($wx_user['id']);
        if ($customer_contact)
        {
            $wx_user['is_band'] = 1;
            $wx_user['customer_contact_id'] = $customer_contact->id;
            $wx_user['name'] = $customer_contact->name;
        } else {
            $wx_user['is_band'] = 0;
            $wx_user['customer_contact_id'] = null;
        }
        return view('orders.confirm', ['user' => $wx_user, 'order' => $order]);
//        return view('orders.confirm', ['order' => $order]);
    }

    public function bindPhone(Request $request)
    {
        $user = session('wechat.oauth_user.default');// 拿到授权用户资料
        $wx_user = json_decode(json_encode($user,true),true);
        $customer = $request->input('customer_name');
        $phone = $request->input('phone');
//        $wx_user = [
//            'id' => 'asdasdasofihwrhwe',
//            'headImgUrl' => null,
//            'sex' => null
//        ];

        // 判断当前公司和这个手机号的联系人是否存在
        $users = (new Customer())->getContactByTitle($customer, $phone);
        if ($users)
        {
            $contact['customer_contact_id'] = $users->id;
            $contact['customer_id'] = $users->customer_id;
            $bind_back = $users->update(['open_id' => $wx_user['id'], 'headImgUrl' => $wx_user['headImgUrl'], 'sex' => $wx_user['sex']??0]);
            if ($bind_back)
            {
                return $this->success(['user' => $contact]);
            } else {
                return $this->error(1001);
            }
        } else {
            return $this->error(1000);
        }
    }

    public function order_handle(Request $request)
    {
        $order_id = $request->input('order_id');
        // 客户确认需求
        $customer_status = $request->input('customer_status');
        $customer_contact_id = $request->input('customer_contact_id');
        // 判断当前状态是否存在
        $order_status = (new OrdersStatus())->getByOrdersId($order_id);
        $params = [
            'orders_id' => $order_id,
            'customer_status' => $customer_status,
            'customer_contact_id' => $customer_contact_id
        ];
        if ($order_status)
        {
            $order_status_back = $order_status->update(['customer_status' => $customer_status, 'customer_contact_id' => $customer_contact_id]);
        } else {
            $order_status_back = (new OrdersStatus())->create($params);
        }
        return $this->success();
    }
}
