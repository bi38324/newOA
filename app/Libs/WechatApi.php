<?php
namespace App\Libs;

class WechatApi
{

    //分享token获取
    const CLIENT_ACCESS_TOKEN_URL = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential';
    //分享ticket获取
    const  TICKET_URL = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=%s&type=jsapi';

    // 授权access token
    const ACCESS_TOKEN_URL = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code';
    // 用户授权信息
    const USER_INFO_URL = 'https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN';

    // 小程序 access token
    const MINI_PROGRAM_TOKEN = 'https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code';

    const MINI_APP_ID = 'wx4cbec8d337fa4ad3';
    const MINI_APP_SECRET = '3d392186bf54534466e37dba8493c78e';

    private  $appId;
    private  $app_secret;

    public function __construct()
    {
        $this->appId  = config('wechat.app_id') ?? '';
        $this->app_secret = config('wechat.app_secret') ?? '';
    }

    /**
     * 微信分享token
     * @return bool|mixed|string
     */
    protected function getToolsAccessToken(){

        $url      = self::CLIENT_ACCESS_TOKEN_URL.'&appid=' .$this->appId . '&secret=' . $this->app_secret;
        $response = httpRequest($url);
        if (!array_key_exists('errcode', $response)) {
            return $response['access_token'];
        }

        return null;
    }

    public  function getShareData($shareUrl = ''){

        // 获取 access_token
        $access_token = $this->getToolsAccessToken();
        // 获取 ticket

        $url       = sprintf(self::TICKET_URL, $access_token);

        $response  = httpRequest($url);

        if(array_key_exists('errcode', $response)){
            return [];
        }

        $timestamp = time();
        $param_url = urldecode($shareUrl);
        $noncestr  = get_rand_str(16);
        $params    = [
            'noncestr'     => $noncestr,
            'jsapi_ticket' => $response['ticket'],
            'timestamp'    => $timestamp,
            'url'          => $param_url
        ];
        // 获取签名
        ksort($params);//将参数按key进行排序
        $str = '';
        foreach ($params as $key => $value) {
            $str .= $key . '=' . $value . '&';
        }
        $sign = sha1(rtrim($str, "&"), false);
        return [
            'timetamp' => $timestamp,
            'noncestr' => $noncestr,
            'signstr'  => $sign,
            'app_id'   => $this->appId
        ];
    }

    protected function getAccessToken($code){

        $return = [];
        $url       = sprintf(self::ACCESS_TOKEN_URL, $this->appId, $this->app_secret, $code);
        $response  = httpRequest($url);
        if (array_key_exists('errcode', $response)) {
            return $return;
        }
        return $response;
    }

    // 获取用户详细信息
    public function getWechatInfo($code){

        //$wechatData['openid']    = 'o2Ig4wMQJQpS3Ca57hnaTHdyFl1M';
        //$wechatData['nickname']   = 'test';
        //$wechatData['sex']        = 1;
        //$wechatData['province']   = '陕西';
        //$wechatData['city']       = '西安';
        //$wechatData['country']    = '22';
        //$wechatData['headimgurl'] = 'http://pic32.nipic.com/20130823/13339320_183302468194_2.jpg';
        //$wechatData['unionid']   = '';
        //return $wechatData;

        $accessTokenInfo = $this->getAccessToken($code);

        $return = [];
        if(!empty($accessTokenInfo)){
            $accessToken = $accessTokenInfo['access_token'];
            $openid = $accessTokenInfo['openid'];
            $url = sprintf(self::USER_INFO_URL, $accessToken, $openid);
            $response = httpRequest($url);

            if (array_key_exists('errcode', $response)) {
                return $return;
            }
            $return = $response;
        }
        return $return;
    }

    public function miniProgram($code){

        $url       = sprintf(self::MINI_PROGRAM_TOKEN, self::MINI_APP_ID, self::MINI_APP_SECRET, $code);
        $response  = httpRequest($url);

        if (array_key_exists('errcode', $response)) {
            return [];
        }
        return $response;

    }
}