<?php

namespace App\Http\Controllers\OpenPlatFrom;

use App\Http\Services\WxUserService;
use EasyWeChat\Factory;

class MsgController extends Controller
{
    /**
     * @param $appid
     * @param $type   消息类型：
     *                          order_confirm
     * @param $openid
     */
    public function index($appid, $type, $openid)
    {

        $this->sendMsg($appid, [], $type, $openid);
    }

    public function sendMsg($appid, $tpl = [], $type = '', $openid = '', $order_info = [])
    {

        $officialAccount = Factory::officialAccount($this->config);

        //$user = $officialAccount->user->get($openid);

        $service = $this->service($appid);

        if (empty($tpl)) {

            switch ($service) {
                case 'shuzizhongguang':
                    $tpl = $this->tplMsg($openid, $order_info, $type);
                    break;
            }
        }

        if (!empty($tpl)) {
            $officialAccount->template_message->send($tpl);
        }
    }

    public function tplMsg($openid, $order_info = [], $type = '')
    {

        $tpl = [];
        switch ($type) {
            case 'server':
                // 服务器开通成功推送
                $tpl = [
                    'touser'      => $openid,
                    'template_id' => '9LkLae2379W1Fcam0gY560q1iA6HLxM3iz-560hRxMM',
                    'data'        => [
                        'first'            => '恭喜，你订购的服务器已经成功开通。',
                        'keyword1'    => $order_info['server_ip'],
                        'keyword2' => $order_info['server_name'],
                        'keyword3' => $order_info['password'],
                        'keyword4' => $order_info['port'],
                        'Remark'           => '如在使用中遇到任何问题可拨打24小时服务热线：029-86697887'
                    ]];
                break;
            case 'order_confirm':
                // 确认需求推送
                $tpl = [
                    'touser'      => $openid,
                    'template_id' => 'TUV40dzhtn8RYcHivHnjh_k8FlkDi1Oj3ZxH5Zrjwfk',
                    'url'         => 'http://oa.zgclouds.com/orders_confirm?order_id=' . $order_info['id'],
                    'data'        => [
                        'first'            => '您好，您有一条新的需求确认通知',
                        'keyword1'    => $order_info['order_code'],
                        'keyword2' => '待确认',
                        'Remark'           => '为不影响开发进度，请及时确认需求'
                    ]];
                break;
            case 'status':
                // 订单状态更新
                $tpl = [
                    'touser'      => $openid,
                    'template_id' => 'ULxj3fHGTL0Uq5BbQsuDoqrsHkg_IaOVZrsdVOFphIk',
                    'data'        => [
                        'first'    => '您的订单状态已更新，请查收',
                        'keyword1' => $order_info['order_code'],
                        'keyword2' => $order_info['product'] ?? '',
                        'keyword3' => $order_info['status'],
                        'keyword4' => date("Y-m-d"),
                        'remark'   => $order_info['remark'] ?? '',
                    ]];
                break;
            case 'checkout':
                // 订单更新验收提醒
                $tpl = [
                    'touser'      => $openid,
                    'template_id' => 'CNUaXxejDy5h3Y4heTnxe4Zks6UooaPSqtIu7SW-_zM',
                    'url'         => 'http://oa.zgclouds.com/orders_checkout?order_id=' . $order_info['id'],
                    'data'        => [
                        'first'    => '您有一个订单正在等待验收',
                        'keyword1' => $order_info['order_code'],
                        'keyword2' => date('Y-m-d'),
                        'remark'   => '请尽快完成验收，谢谢',
                    ]];
                break;
            case 'payment':
                // 确认收到款
                $tpl = [
                    'touser'      => $openid,
                    'template_id' => 'fU2jmK_FV62MEAIBAqvfteNkcI4gCaSUGijpDbRY0VI',
                    'data'        => [
                        'first'    => '尊敬的客户您好，我们已确认收到款项',
                        'keyword1' => $order_info['order_code'],
                        'keyword2' => $order_info['receipts'],
                        'keyword3' => $order_info['pay_time'],
                        'remark'   => '当前订单应收金额为'.$order_info['receivable'].'元，累计收款金额为'.$order_info['total'].'元，待支付金额为'.$order_info['arrears'].'元。感谢您对我们的支持!',
                    ]];
                break;
        }
        return $tpl;
    }

    public function kdmTplMsg($openid, $user, $type = '')
    {

        $tpl = [];
        switch ($type) {
            case 'subscribe':

                break;
        }
        return $tpl;

    }


    public function getTpl(){

        if(date('Ymd') !== '20200324'){
            return [];
        }

		return [
            'template_id' => 'cPgYcbOCciaC0-YX2p1VlJISpi8WnxmDp0_6YPsCaaU',
	        'url'         => 'http://wechat.yinhangren.cn/#/coursedetail/651/0/1',
	        'data'        => [
	           'first'    => ['value' => 'Hi，小伙伴们开课了~', 'color' => '#000000'],
	           'keyword1' => ['value' => '2020中国邮政储蓄银行春招丨公告解读+网申指导', 'color' => '#FF0000'],
	           'keyword2' => '2020年03月24日 20:00' . "\r\n" . '主讲人：胡滨老师',
	           'remark'   => ['value' => ' 戳我，立即进入直播间！', 'color' => '#1C86EE'],
	        ]
        ];
        //'touser' => $item->open_id,
        //'template_id' => 'i5lhg9cUtUVDYNIX_cRsEj8D4enh2AT8Cw_km7odTPg',
        //'url' => 'http://wechat.yinhangren.cn/#/coursedetail/197/0/0?20190618',
        //'data' => [
        //    'first' => '2020年央行|银保监招聘考试经济金融课精彩继续，千万不要错过哦！',
        //    'keyword1' => '【财经晚课】2020央行|银保监·硬核必杀技',
        //    'keyword2' => '今晚9点',
        //    'keyword3' => '公众号直播间',
        //    'remark' => ['value' => '名师出击，硬核必杀，让你上岸无忧~点击查看课程信息>>', 'color' => '#ff0000'],
        //],]);

        //'touser' => $item->open_id,
        //'template_id' => 'UDXjUtWY30QWo3xP72bv7CfNxdj5KASAREomLOClStM',
        //'url' => 'http://wechat.yinhangren.cn/#/coursedetail/199/0/0',
        //'data' => [
        //    'first' => '2019年中级经济师—预科导学班开课了！',
        //    'keyword1' => '重大变革下的新教材变化解读',
        //    'keyword2' => '银行人APP、服务号→在线学习',
        //    'keyword3' => '小莉老师',
        //    'keyword4' => '2019年7月3日  20：00',
        //    'remark' => ['value' => '点我，立即观看【最新大纲解读】>>', 'color' => '#ff0000'],
        //],]);

        //'touser'      => $item->open_id,
        //'template_id' => 'cPgYcbOCciaC0-YX2p1VlJISpi8WnxmDp0_6YPsCaaU',
        //'url'         => 'http://yinhangren.at.baijiayun.com/web/room/prepare?room_id=19083083325448',
        //'data'        => [
        //    'first'    => '央行银保专项班会',
        //    'keyword1' => '央行银保招考时间变化的应对措施',
        //    'keyword2' => '2019年08月31日 20:00' . "\r\n" . '主讲人： 小莉老师',
        //    'remark'   => ['value' => '参加码：6h7bet', 'color' => '#ff0000'],
        //]


        //'touser'      => $item->open_id,
        //'template_id' => 'cPgYcbOCciaC0-YX2p1VlJISpi8WnxmDp0_6YPsCaaU',
        //'url'         => 'https://pan.baidu.com/s/1xiE6A9QfhnNBC87lpGvV7Q?errno=0&errmsg=Auth%20Login%20Sucess&&bduss=&ssnerror=0&traceid=',
        //'data'        => [
        //    'first'    => ['value' => 'Hi~进面估分了！', 'color' => '#000000'],
        //    'keyword1' => ['value' => '2020银保监会笔试-进面估分', 'color' => '#FF0000'],
        //    'keyword2' => '2019年11月24日 18：30' . "\r\n" . '主讲人： 陈小莉，吕磊，赵川，奚新春，刘春友，冯晓刚',
        //    'remark'   => ['value' => ' 戳我，立即进入直播间！', 'color' => '#1C86EE'],
        //]

        //[
        //            'template_id' => 'gwUILqYt94yRsHG6IPG9GD77qnZPwtBxVXmNvW83jwA',
        //            'url'         => 'https://pan.baidu.com/s/1xiE6A9QfhnNBC87lpGvV7Q',
        //            'data'        => [
        //    'first'    => ['value' => 'Hi~对答案了！', 'color' => '#000000'],
        //    'keyword1' => ['value' => '2020银保监会财会岗答案', 'color' => '#FF0000'],
        //    'keyword2' => '赵川',
        //    'keyword3' => '全网发布',
        //    'keyword4' => '2019-11-24',
        //    'remark'   => ['value' => ' 戳我，立即下载！', 'color' => '#1C86EE'],
        //];
        // return [
        //     'template_id' => 'gwUILqYt94yRsHG6IPG9GD77qnZPwtBxVXmNvW83jwA',
        //     'url'         => 'https://pan.baidu.com/s/1xiE6A9QfhnNBC87lpGvV7Q',
        //     'data'        => [
        //         'first'    => ['value' => 'Hi~对答案了！', 'color' => '#000000'],
        //         'keyword1' => ['value' => '2020银保监会财会岗答案', 'color' => '#FF0000'],
        //         'keyword2' => '赵川',
        //         'keyword3' => '全网发布',
        //         'keyword4' => '2019-11-24',
        //         'remark'   => ['value' => ' 戳我，立即下载！', 'color' => '#1C86EE'],
        //     ]
        // ];
    }
}
