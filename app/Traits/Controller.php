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

        if($appId == 'wx6a5c437327cd5bee'){
            // 时代顾邦教育
            return 'shuzizhongguang';
        }
    }

    // 开放平台
    public function getOpenPlatFormConfig(){

        return [
            'app_id' => env('WECHAT_OFFICIAL_ACCOUNT_APPID', 'wx6a5c437327cd5bee'),         // AppID
            'secret' => env('WECHAT_OFFICIAL_ACCOUNT_SECRET', '56550508bcbecd7beadd22a47847cd46'),    // AppSecret
            'token' => env('WECHAT_OFFICIAL_ACCOUNT_TOKEN', 'shuzizhongguang'),           // Token
            'aes_key' => env('WECHAT_OFFICIAL_ACCOUNT_AES_KEY', '1tOmjWm9KJ5yXCkIStc2SIA671M9rz621assWA4vG7U'),                 // EncodingAESKey
            'log' => [
                'level' => env('WECHAT_LOG_LEVEL', 'debug'),
                'file' => env('WECHAT_LOG_FILE', storage_path('logs/wechat1.log')),
            ],
        ];
    }
}
