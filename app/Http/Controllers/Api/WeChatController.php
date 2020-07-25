<?php

namespace App\Http\Controllers\Api;


use App\Http\Model\Orders;
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
}
