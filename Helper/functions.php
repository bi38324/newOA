<?php

 function httpRequest($url, $params = [],  $isPost= false, $returnFormat = 'json')
{
    try {

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);

        if ($isPost) {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        }
        $output = curl_exec($ch);
        curl_close($ch);

        if ($returnFormat == 'json') {
            return json_decode($output, true);
        }
        return $output;
    }catch (Exception $exception){

        //dump($exception->getMessage());
        return $exception->getMessage();
        //return false;
    }
}



// 获取随机字符串
function get_rand_str($length = 6){

    $str = null;
    $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $max = strlen($strPol)-1;

    for($i=0;$i<$length;$i++){
        $str .= $strPol[rand(0,$max)];
    }

    return $str;
}

// 获取访问IP
function get_ip(){
    $ip = '';

    if(getenv('HTTP_CLIENT_IP')) {
        $ip = getenv('HTTP_CLIENT_IP');
    } elseif(getenv('HTTP_X_FORWARDED_FOR')) {
        $ip = getenv('HTTP_X_FORWARDED_FOR');
    } elseif(getenv('REMOTE_ADDR')) {
        $ip = getenv('REMOTE_ADDR');
    } else {
        $ip = $_SERVER['REMOTE_ADDR']??'';
    }
    return $ip;
}

function is_cli(){

     return PHP_SAPI == 'cli';
}

function is_win(){
     return strpos(PHP_OS, 'WIN') !== false;
}


function checkMobile($phone){

    return !preg_match("/^1[3456789]{1}\d{9}$/",$phone);
}

function diffTimeDay($start, $end){

    $start = strtotime($start);

    $second = strtotime($end) - $start;

    //$str = "0天0小时0分钟0秒";

    $day = $hr = $min = $sec = 0;
    if($second > 0){
        $day = floor($second/3600/24);
        $hr = floor($second/3600%24);
        $min = floor($second/60%60);
        $sec = floor($second%60);
        //$str = $day."天".$hr."小时".$min."分钟".$sec."秒";
    }
    return ['day' => $day, 'hr' => $hr, 'min' =>$min, 'sec' => $sec];
}

function diffTimeStamp($start, $end)
{

    $start = strtotime($start);

    $second = strtotime($end) - $start;
    return $second;
}
function isPhone($phone){

    return preg_match("/^1[3456789]{1}\d{9}$/",$phone);
}

function validatorPwd($pwd){

    return preg_match("/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/",$pwd);
}

function isRealName($name){

    return preg_match("/^[\x{4e00}-\x{9fa5}]+$/u",$name);
     //return preg_match('/^[\u4E00-\u9FA5]+(·[\u4E00-\u9FA5]+)*$/', $name);
}
