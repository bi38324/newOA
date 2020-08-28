<?php

namespace App\Http\Controllers\Api;


use App\Http\Model\Customer;
use App\Http\Model\Orders;
use App\Http\Services\OrdersService;
use App\Http\Services\WxUserService;
use App\Libs\WechatApi;
use Illuminate\Http\Request;

class WeChatController extends Controller
{
    public $service;
    public $wechatApi;

    public function __construct()
    {
        $this->service = new WxUserService();
        $this->wechatApi = new WechatApi();
    }


    /**
     * 微信分享获取签名，ticket
     * @param Request $request
     * @return WeChatController|\Illuminate\Http\Response|mixed
     */
    public function weChatShare(Request $request)
    {
        $shareUrl = $request->get('url');
        return $this->success($this->wechatApi->getShareData($shareUrl));
    }


    /**
     * 获取微信的openid
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getWeChatInfo(Request $request)
    {
        $code = $request->get('code');
        $wechatData = $this->wechatApi->getWechatInfo($code);

        if(empty($wechatData)){
            return $this->error(2100);
        }
        $user = $this->service->saveWechatInfo($wechatData);


        $wechatData['openid'] = '';
        $wechatData['unionid'] = '';
        $wechatData['user_type'] = $user->user_type;
        $wechatData['wx_user_id'] = $user->id;

        return $this->success(['data' => $wechatData]);
    }

    public function getOrdersInfo(Request $request)
    {
        $order_id = $request->input('order_id');

        $order = (new OrdersService())->getOrdersInfo($order_id);

        return $this->success($order);
    }

    public function bindPhone(Request $request)
    {
//        $user = session('wechat.oauth_user.default');// 拿到授权用户资料
//        $wx_user = json_decode(json_encode($user,true),true);
        $wx_user = [
            'open_id' => 'asdasdasofihwrhwe',
            'headImgUrl' => null,
            'sex' => null
        ];
        $customer = $request->input('customer_name');
        $phone = $request->input('phone');
        // 判断当前公司和这个手机号的联系人是否存在
        $users = (new Customer())->getContactByTitle($customer, $phone);
        if ($users)
        {
            $contact['customer_contact_id'] = $users->id;
            $contact['customer_id'] = $users->customer_id;
            $bind_back = $users->update(['open_id' => $wx_user['open_id'], 'headImgUrl' => $wx_user['headImgUrl'], 'sex' => $wx_user['sex']??0]);
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
}
