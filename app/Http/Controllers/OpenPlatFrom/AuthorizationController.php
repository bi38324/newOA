<?php

namespace App\Http\Controllers\OpenPlatFrom;

use EasyWeChat\Factory;


class AuthorizationController extends Controller
{
    /**
     * 查看
     */
    public function index()
    {
        $openPlatform = Factory::openPlatform($this->config);
        $callbackUrl = env('API_URL').'/openplatform/callback';

        $url = $openPlatform->getPreAuthorizationUrl($callbackUrl);
        echo('<a href='.$url.'>授权</a>');
    }

    public function callback(){

        $openPlatform = Factory::openPlatform($this->config);

        dump($openPlatform->handleAuthorize($authCode = null));
    }

}
