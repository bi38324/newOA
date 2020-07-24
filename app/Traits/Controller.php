<?php

namespace App\Traits;

use Dingo\Api\Routing\Helpers;
use Illuminate\Pagination\AbstractPaginator;
use Route;

trait Controller
{
    //use Helpers;
    use Responses;

    public function service($appId){

        if($appId == 'wxe0d31acd52903b58'){
            // 时代顾邦教育
            return 'sdgbjy';

        }elseif($appId == 'wxf220a77865160014'){
            // 考点喵
            return 'kdm';
        }
    }

    // 开放平台授权refresh token
    public function getRefreshToken($appId){

        $refreshToken = '';
        $service = $this->service($appId);
        switch ($service){
            case 'sdgbjy':
                $refreshToken = 'refreshtoken@@@k1DEg1FpABk0Vwm4Rj7FEXRcQ3wq8fMVfUjy2AQMdbQ';
                break;
            case'kdm':
                $refreshToken = 'refreshtoken@@@ufNXwyczFzpvKHiej3TcrjFOu7I_wymq_8pA1zg2CM4';
                break;
        }
        return $refreshToken;
    }

    // 开放平台
    public function getOpenPlatFormConfig(){

        return [
            'app_id'  => 'wx31c77e73a59da913',
            'secret'  => '626895a85081a572aa359a35b15cca6b',
            'token'   => 'gubangedu',
            'aes_key' => '5myY8KguA4CNAHpV20NUFd5XTAri5sKsxbAsRNRB9RI',
            'log'     => [
                'level' => 'debug',
                'file'  => storage_path('logs/openplatform/wechat.'.date('Y-m-d').'.log'),
            ],
        ];
    }

    // 企业微信
    public function getCorpConfig(){

        return [
            'corp_id' => 'wwe0c6521fb41a057f',
            'secret' => 'Sz-m8OxeOhlWCUJG3A8CcpTNRBdWeaDq5d5V6BgmHOY',
            'response_type' => 'array',
            'log' => [
                'level' => 'debug',
                'file'  => storage_path('logs/corp/wechat.'.date('Y-m-d').'.log'),
            ],
        ];
    }

    // 企业微信自建程序配置
    public function getAgentConfig($agentId = 0){

        $config = [];
        switch ($agentId){
            case '1000007':
                $config = [
                    'corp_id' => 'wwe0c6521fb41a057f',
                    'agent_id' => 1000007,
                    'secret'   => 'DsyvrK1WF0t0pDPfSAsC_sq9KtcYpEtwvcGVMR3m5so',
                ];
                break;
            case '1000008':
                $config = [
                    'corp_id' => 'wwe0c6521fb41a057f',
                    'agent_id' => 1000008,
                    'secret'   => '0zoP7jsnKR39R8nmAHMRCt_MVr4L6rp46tgW2cTUPf8',
                ];
                break;
            default:
                $config = [
                    'corp_id' => 'wwe0c6521fb41a057f',
                    'agent_id' => 1000006,
                    'secret'   => 'Bl-ogoL2bQztqAw_Fa_k91ghnc_Mo2P-oAQbeIVpXow',
                ];
                break;

        }
        return $config;
    }

    // 企业微信通讯录配置
    public function getAddressBookConfig(){
        return [
            'token' => 'DqPycTdfjYyYdUP4l',
            'aes_key' => 'GXATqhVlUj4egtIzhWrcEjl8IzvirtgB2hY2Z9R5fZc',
        ];
    }
}
