<?php

namespace App\Http\Controllers\OpenPlatFrom;

use App\Http\Model\ServiceMenu;
use App\Http\Model\WechatQrcodeRecord;
use App\Http\Services\EventRecordService;
use App\Http\Services\PromoteSubjectService;
use EasyWeChat\Factory;
use EasyWeChat\Kernel\Messages\Image;
use EasyWeChat\Kernel\Messages\Text;
use Illuminate\Http\Request;

class ServerController extends Controller
{
    public function index(){
        return '';
    }

    // 授权验证
    public function ticket(){

        $openPlatform = Factory::openPlatform($this->config);
        $server = $openPlatform->server;

        return $server->serve();
    }

    public function event(Request $request, $appId){

        $openPlatform = Factory::openPlatform($this->config);
        // 代公众号实现业务
        $refreshToken = $this->getRefreshToken($appId);
        $officialAccount = $openPlatform->officialAccount($appId,$refreshToken);

        $server = $officialAccount->server;

        $message = $server->getMessage();

        $this->message($message,$appId);
        $response = $server->serve();
        return $response->send();
    }

    private function message($message,$appId, $officialAccount = null){

        if(empty($officialAccount)){
            $openPlatform = Factory::openPlatform($this->config);
            // 代公众号实现业务
            $refreshToken = $this->getRefreshToken($appId);
            $officialAccount = $openPlatform->officialAccount($appId,$refreshToken);
        }

        //{"ToUserName":"gh_8ab10108d176","FromUserName":"ob-3s57OxSWe5EOsO4nEqLRLcA1Y","CreateTime":"1559786223","MsgType":"event","Event":"unsubscribe","EventKey":null}
        $recodeService = new EventRecordService();
        $user = $officialAccount->user->get($message['FromUserName']);
        switch ($message['MsgType']) {
            case 'event':
                if('subscribe' == $message['Event']){
                    $this->subscribeMsg($officialAccount, $message['FromUserName']);
                }

                //if(isset($message['EventKey'])){
                //    $this->projectQrRecord($appId, $message, $officialAccount, $user);
                //}
                $this->eventOperation($message, $officialAccount, $message['FromUserName']);
                $recodeService->saveEventRecord($appId, $message, $user);
                break;
            default:
                $recodeService->saveEventRecord($appId, $message, $user);
//                $msg = new Text('您好default！');
//                $officialAccount
//                    ->customer_service
//                    ->message($msg)
//                    ->to($message['FromUserName'])
//                    ->send();
                break;
        }
        return 'success';
    }

    public function projectQrRecord($appId, $message, $officialAccount, $user){

        //if('subscribe' == $message['Event']){
        //    $this->subscribeMsg($officialAccount, $message['FromUserName']);
        //}

//        //$channel = 'promotesubject_'.$user['UserId'].'_'.$subject['id'];
//        $channel = str_replace('qrscene_','',$message['EventKey']);
//        $channel = explode('_',$channel);
//
//        if(isset($channel[0]) && $channel[0] == 'promotesubject'){
//
//            if(!in_array($channel[0], ['promotesubject', 'youzansubject'])){
//                return false;
//            }
//
//            $recordData = [
//                'type'            => $message['Event'],
//                'openid'          => $message['FromUserName'],
//                'scene'           => $message['EventKey'],
//                'unionid'         => $user['unionid'],
//                'appid'           => $appId,
//                'nickname'        => $user['nickname'],
//                'sex'             => $user['sex'],
//                'city'            => $user['city'],
//                'province'        => $user['province'],
//                'subscribe_time'  => $user['subscribe_time'],
//                'subscribe_scene' => $user['subscribe_scene'],
//                'channel'         => $channel[0] ?? '',
//                'promote'         => $channel[1] ?? '',
//                'subjectid'       => $channel[2] ?? '',
//            ];
//            if(isset($channel[2])){
//                app(WechatQrcodeRecord::class)->save($recordData);
//                $content = (new PromoteSubjectService())->getById($channel[2]);
//                if($content){
//
//                    $this->subscribeMsg($officialAccount, $message['FromUserName']);
//                }
//            }
//        }

    }

    public function eventOperation($message, $officialAccount, $openid){

        if($message['Event'] == 'CLICK'){
            // 考点喵关注消息
            //$this->subscribeMsg($officialAccount, $user['openid']);

            switch ($message['EventKey']){
                case 'MENU1_MY_SUBJECT':
                    $msg = new Text('请点击导航"在线学习"-“在线课程”进入！');
                    $officialAccount
                    ->customer_service
                    ->message($msg)
                    ->to($openid)
                    ->send();
                    break;
                case 'MENU2_ONLINE':
                    $msg = new Text('在公众号下方直接留言，客服小姐姐一直都在哦~[玫瑰]！');
                    $officialAccount
                        ->customer_service
                        ->message($msg)
                        ->to($openid)
                        ->send();
                    break;
                case 'MENU3_APP_DOWNLOAD':
                    // 财经小站；6xvxKNVRFImgKPyUzror_5mRwaKyEa7a8jGx-xhpmdw
                    // app: 6xvxKNVRFImgKPyUzror_2PZQBi8LzoN47j4vukEBK4
                    $image = new Image('6xvxKNVRFImgKPyUzror_2PZQBi8LzoN47j4vukEBK4');
                    $officialAccount
                        ->customer_service
                        ->message($image)
                        ->to($openid)
                        ->send();

                    break;
                case 'MENU3_WECHAT_SUBSCRIPTION':
                    $image = new Image('6xvxKNVRFImgKPyUzror_5mRwaKyEa7a8jGx-xhpmdw');
                    $officialAccount
                        ->customer_service
                        ->message($image)
                        ->to($openid)
                        ->send();
                    break;
            }
        }

    }

    public function subscribeMsg($officialAccount,$openid){

        $officialAccount->template_message->send([
            'touser' => $openid,
            'template_id' => 'cPgYcbOCciaC0-YX2p1VlJISpi8WnxmDp0_6YPsCaaU',
            'url' => 'http://wechat.yinhangren.cn/#/login',
            'data' => [
                'first' => '您好，欢迎来到时代顾邦教育，请点击进入课程兑换流程！',
                'keyword1' => '课程礼包在兑换后可进入我的课程查看详情',
                'keyword2' => '课程兑换后可随时学习',
                'remark' => '【注意事项】首次进入请验证输入手机号用于发放课程>>',
            ],]);

    }


    public function getMenu($appId){

        $openPlatform = Factory::openPlatform($this->config);

        // 代公众号实现业务
        $refreshToken = $this->getRefreshToken($appId);
        $officialAccount = $openPlatform->officialAccount($appId,$refreshToken);
        $list = $officialAccount->menu->list();

        dump($list);

    }

    public function createMenu($appId){

        $buttons = [
            [
                "name" => "时代商城",
                //"type" => "view",
                //"url"  => "https://shop43210321.youzan.com/v2/showcase/homepage?alias=b6UeDfbqo1&redirect_count=1&sf=wx_sm&is_share=1&from_uuid=899ceb9d-69ab-98ac-c97e-fce25d78e0af&sl=52xlMI",
                "sub_button" => [
                    [
                        "type" => "view",
                        "name" => "嗨3天主会场",
                        "url"  => "https://h5.youzan.com/wscshop/showcase/feature?alias=J8c98fHGNe"
                    ],
                    [
                        "type" => "view",
                        "name" => "银保监会",
                        "url"  => "https://h5.youzan.com/v2/showcase/tag?alias=mgsckea11"
                    ],
                    [
                        "type" => "view",
                        "name" => "中国人民银行",
                        'url' => 'https://h5.youzan.com/v2/showcase/tag?alias=r2x4g4gd1'
                    ],
                    [
                        'type' => 'view',
                        'name' => '中级经济师',
                        'url' => 'https://h5.youzan.com/v2/showcase/tag?alias=mdza32k21'
                    ],
                    [
                        'type' => 'view',
                        'name' => '时代商城主会场',
                        'url' => 'https://h5.youzan.com/wscshop/showcase/homepage?alias=b6UeDfbqo1&reft=1562223498133&spm=g.484383045'
                    ]
                ],
            ],
            [
                "name"       => "在线学习",
                "type" => "view",
                'url' => 'http://wechat.yinhangren.cn/#/home/'

                //"sub_button" => [
                //    [
                //        "type" => "view",
                //        "name" => "新大纲发布会",
                //        "url"  => "http://wechat.yinhangren.cn/#/coursedetail/162/0"
                //    ],
                //    [
                //        "type" => "view",
                //        "name" => "财经晚课",
                //        "url"  => "http://wechat.yinhangren.cn/#/coursedetail/197/0/0"
                //    ],
                //    [
                //        "type" => "view",
                //        "name" => "在线课程",
                //        'url' => 'http://wechat.yinhangren.cn/#/home/'
                //    ],
                //],
            ],
            [
                "name"       => "学员服务",
                "sub_button" => [
                    [
                        "type" => "click",
                        "name" => "我的课程",
                        "key" => 'MENU1_MY_SUBJECT'
                        //"url"  => "http://wechat.yinhangren.cn/#/coursedetail/162/0"
                    ],
                    [
                        "type" => "click",
                        "name" => "在线咨询",
                        "key" => 'MENU2_ONLINE'
                        //"url"  => "https://shop43210321.youzan.com/v2/goods/364681oxchyuh?banner_id=ag.43018153~goods.2~1~PepXKJHj&reft=1560757777809_1560757819446&spm=f.79941118_ag.43018153&sf=wx_sm"
                    ],
                    [
                        "type" => "click",
                        "name" => "APP下载",
                        "key" => 'MENU3_APP_DOWNLOAD'
                        //'url' => 'http://wechat.yinhangren.cn/#/home/'
                    ],
                    [
                        "type" => "click",
                        "name" => "微信订阅号",
                        "key" => 'MENU3_WECHAT_SUBSCRIPTION'
                        //'url' => 'http://wechat.yinhangren.cn/#/home/'
                    ],
                ],
            ],
        ];

        $openPlatform = Factory::openPlatform($this->config);

        // 代公众号实现业务
        $refreshToken = $this->getRefreshToken($appId);
        $app = $openPlatform->officialAccount($appId,$refreshToken);
        $ret = $app->menu->create($buttons);
        dump($ret);
    }

    public function getMedia($appId){

        $openPlatform = Factory::openPlatform($this->config);

        // 代公众号实现业务
        $refreshToken = $this->getRefreshToken($appId);
        $officialAccount = $openPlatform->officialAccount($appId,$refreshToken);
        $list = $officialAccount->material->list('image');
        dump($list);

    }

    //
    // 财经小站；6xvxKNVRFImgKPyUzror_5mRwaKyEa7a8jGx-xhpmdw
    // app: 6xvxKNVRFImgKPyUzror_2PZQBi8LzoN47j4vukEBK4
    public function uploadMedia($appId){

        $openPlatform = Factory::openPlatform($this->config);

        // 代公众号实现业务
        $refreshToken = $this->getRefreshToken($appId);
        $app = $openPlatform->officialAccount($appId,$refreshToken);
        $result = $app->material->uploadImage(public_path().'/img/WechatIMG1.jpeg');
        echo '资源：';
        dump($result);

        $result = $app->material->uploadImage(public_path().'/img/WechatIMG2.jpeg');
        echo '资源：';
        dump($result);


    }

    public function pushMenu($appId){

        $buttons = (new ServiceMenu())->getFormatButtons($appId);
        $openPlatform = Factory::openPlatform($this->config);

        // 代公众号实现业务
        $refreshToken = $this->getRefreshToken($appId);
        $app = $openPlatform->officialAccount($appId,$refreshToken);
        $app->menu->create($buttons);

        return $this->success();
    }
}
