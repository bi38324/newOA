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

    public function sendMsg($appid, $tpl = [], $type = '', $openid = '')
    {

        $openPlatform = Factory::openPlatform($this->config);

        $officialAccount = $openPlatform->officialAccount($appid);
        //$user = $officialAccount->user->get($openid);

        $service = $this->service($appid);

        if (empty($tpl)) {

            switch ($service) {
                case 'shuzizhongguang':
                    $tpl = $this->tplMsg($openid, $type);
                    break;
            }
        }

        if (!empty($tpl)) {
            $officialAccount->template_message->send($tpl);
        }
    }

    public function tplMsg($openid, $type = '')
    {

        $tpl = [];
        switch ($type) {
            case 'order_confirm':
                $tpl = [
                    'touser'      => $openid,
                    'template_id' => 'TUV40dzhtn8RYcHivHnjh_k8FlkDi1Oj3ZxH5Zrjwfk',
                    'url'         => 'http://oa.zgclouds.com/orders_confirm?order_id=12',
                    'data'        => [
                        'first'    => '央行银保专项班会',
                        'keyword1' => '央行银保招考时间变化的应对措施',
                        'keyword2' => '2019年08月31日 20:00' . "\r\n" . '主讲人： 小莉老师',
                        'remark'   => ['value' => '参加码：6h7bet', 'color' => '#ff0000'],
                    ]
                ];
                break;
            case 'download':
                // 课件下载
                //$tpl = [
                //    'touser'      => $openid,
                //    'template_id' => 'gwUILqYt94yRsHG6IPG9GD77qnZPwtBxVXmNvW83jwA',
                //    'data'        => [
                //        'first'    => '您好，央行银保监新大纲发布会结束啦，赶快联系客服领取课件！',
                //        'keyword1' => '《央行银保监新大纲》',
                //        'keyword2' => '小莉老师',
                //        'keyword3' => '联系在线客服领取',
                //        'keyword4' => '2019年6月1日',
                //        'remark'   => '在公众号下方留言即可，客服小姐姐还在线等着呢~',
                //    ]];
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
