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
}
