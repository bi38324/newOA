<?php

/*
 * This file is part of the overtrue/laravel-wechat.
 *
 * (c) overtrue <i@overtrue.me>
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

return [
    /*
     * 默认配置，将会合并到各模块中
     */

    'app_id' => env('WECHAT_APP_ID', 'wxe0d31acd52903b58'),
    'app_secret' => env('WECHAT_APP_SECRET', 'e2dfc08a10b73daee649c0f0cbfddbbe'),

    'defaults' => [
        /*
         * 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
         */
        'response_type' => 'array',

        /*
         * 使用 Laravel 的缓存系统
         */
        'use_laravel_cache' => true,

        /*
         * 日志配置
         *
         * level: 日志级别，可选为：
         *                 debug/info/notice/warning/error/critical/alert/emergency
         * file：日志文件位置(绝对路径!!!)，要求可写权限
         */
        'log' => [
            'level' => env('WECHAT_LOG_LEVEL', 'debug'),
            'file' => env('WECHAT_LOG_FILE', storage_path('logs/wechat.log')),
        ],
    ],

    /*
     * 路由配置
     */
    'route' => [
        /*
         * 开放平台第三方平台路由配置
         */
        // 'open_platform' => [
        //     'uri' => 'serve',
        //     'action' => Overtrue\LaravelWeChat\Controllers\OpenPlatformController::class,
        //     'attributes' => [
        //         'prefix' => 'open-platform',
        //         'middleware' => null,
        //     ],
        // ],
    ],

    /*
     * 公众号
     */
    'official_account' => [
        'default' => [
            'app_id' => env('WECHAT_OFFICIAL_ACCOUNT_APPID', 'wxe0d31acd52903b58'),         // AppID
            'secret' => env('WECHAT_OFFICIAL_ACCOUNT_SECRET', 'e2dfc08a10b73daee649c0f0cbfddbbe'),    // AppSecret
            'token' => env('WECHAT_OFFICIAL_ACCOUNT_TOKEN', 'zhongguangshuzi'),           // Token
            'aes_key' => env('WECHAT_OFFICIAL_ACCOUNT_AES_KEY', '1tOmjWm9KJ5yXCkIStc2SIA671M9rz621assWA4vG7U'),                 // EncodingAESKey
            'log' => [
                'level' => env('WECHAT_LOG_LEVEL', 'debug'),
                'file' => env('WECHAT_LOG_FILE', storage_path('logs/wechat1.log')),
            ],
            /*
             * OAuth 配置
             *
             * scopes：公众平台（snsapi_userinfo / snsapi_base），开放平台：snsapi_login
             * callback：OAuth授权完成后的回调页地址(如果使用中间件，则随便填写。。。)
             */
            // 'oauth' => [
            //     'scopes'   => array_map('trim', explode(',', env('WECHAT_OFFICIAL_ACCOUNT_OAUTH_SCOPES', 'snsapi_userinfo'))),
            //     'callback' => env('WECHAT_OFFICIAL_ACCOUNT_OAUTH_CALLBACK', '/examples/oauth_callback.php'),
            // ],
        ],
    ],

    /*
//     * 开放平台第三方平台
//     */
//    'open_platform' => [
//        'default' => [
//            'app_id'  => env('WECHAT_OPEN_PLATFORM_APPID', ''),
//            'secret'  => env('WECHAT_OPEN_PLATFORM_SECRET', ''),
//            'token'   => env('WECHAT_OPEN_PLATFORM_TOKEN', ''),
//            'aes_key' => env('WECHAT_OPEN_PLATFORM_AES_KEY', ''),
//        ],
//    ],
//
//    /*
//     * 小程序
//     */
//    'mini_program' => [
//        'default' => [
//            'app_id'  => env('WECHAT_MINI_PROGRAM_APPID', ''),
//            'secret'  => env('WECHAT_MINI_PROGRAM_SECRET', ''),
//            'token'   => env('WECHAT_MINI_PROGRAM_TOKEN', ''),
//            'aes_key' => env('WECHAT_MINI_PROGRAM_AES_KEY', ''),
//        ],
//    ],

//    /*
//     * 微信支付
//     */
//    'payment' => [
//        'default' => [
//            'sandbox'            => env('WECHAT_PAYMENT_SANDBOX', false),
//            'app_id'             => env('WECHAT_PAYMENT_APPID', 'wxe0d31acd52903b58'),
//            'mch_id'             => env('WECHAT_PAYMENT_MCH_ID', '1471463602'),
//            'key'                => env('WECHAT_PAYMENT_KEY', 'yhr88888yhr88888yhr88888yhr88888'),
//            'cert_path'          => env('WECHAT_PAYMENT_CERT_PATH', 'path/to/cert/apiclient_cert.pem'),    // XXX: 绝对路径！！！！
//            'key_path'           => env('WECHAT_PAYMENT_KEY_PATH', 'path/to/cert/apiclient_key.pem'),      // XXX: 绝对路径！！！！
//            'notify_url'         => 'http://example.com/payments/wechat-notify',                           // 默认支付结果通知地址
//        ],
//        'small' => [
//            'sandbox'            => env('WECHAT_PAYMENT_SANDBOX', false),
//            'app_id'             => env('WECHAT_PAYMENT_APPID', 'wx4cbec8d337fa4ad3'),
//            'mch_id'             => env('WECHAT_PAYMENT_MCH_ID', '1471463602'),
//            'key'                => env('WECHAT_PAYMENT_KEY', 'yhr88888yhr88888yhr88888yhr88888'),
//            'cert_path'          => env('WECHAT_PAYMENT_CERT_PATH', 'path/to/cert/apiclient_cert.pem'),    // XXX: 绝对路径！！！！
//            'key_path'           => env('WECHAT_PAYMENT_KEY_PATH', 'path/to/cert/apiclient_key.pem'),      // XXX: 绝对路径！！！！
//            'notify_url'         => 'http://example.com/payments/wechat-notify',                           // 默认支付结果通知地址
//        ],
//        // ...
//    ],

//    /*
//     * 企业微信
//     */
//    'work' => [
//        'tuiguang' => [
//            'corp_id' => 'wwe0c6521fb41a057f',
//            'agent_id' => 1000006,
//            'secret'   => 'Bl-ogoL2bQztqAw_Fa_k91ghnc_Mo2P-oAQbeIVpXow',
//            //...
//        ],
//        'tongxunlu' => [
//            'corp_id'  => 'wwe0c6521fb41a057f',
//            'secret'   => 'Sz-m8OxeOhlWCUJG3A8CcpTNRBdWeaDq5d5V6BgmHOY',
//            "token"    => "DqPycTdfjYyYdUP4l",
//            "aes_key"  => "GXATqhVlUj4egtIzhWrcEjl8IzvirtgB2hY2Z9R5fZc"
//        ],
//        'fenxiao' => [
//            'corp_id'  => 'wwe0c6521fb41a057f',
//            'agent_id' => 1000007,
//            'secret'   => 'DsyvrK1WF0t0pDPfSAsC_sq9KtcYpEtwvcGVMR3m5so',
//        ],
//    ],
];
