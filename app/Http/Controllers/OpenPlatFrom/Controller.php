<?php

namespace App\Http\Controllers\OpenPlatFrom;
use App\Http\Controllers\Controller as BaseController;
use App\Traits\Controller as TraitsController;

class Controller extends BaseController
{

    use TraitsController;

    public $config = [];

    public function __construct()
    {
        $this->config = $this->getOpenPlatFormConfig();
    }
}
