<?php
namespace App\Http\Controllers\Api;

use App\Traits\Requests;
use App\Traits\Responses;
use App\Http\Controllers\Controller as BaseController;
use Illuminate\Http\Request;

class Controller extends BaseController
{
    use Requests;
    use Responses;

    protected $collection;
    protected $resource;
    /**
     * curl 调用接口
     * @param $url
     * @param string $type
     * @param string $res
     * @param string $arr
     * @return mixed
     */
    public function getUrl($url, $type='get', $res='json', $arr='')
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        if ($type == 'post') {
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $arr);
        }
        $output = curl_exec($ch);
        curl_close($ch);
        if ($res == 'json') {
            return json_decode($output, true);
        }
    }

    /**
     * 根据二维数组某个字段的值查找数组
     * @param $array
     * @param $index
     * @param $value
     * @return mixed
     */
    public function filter_by_value ($array, $index, $value){
        if(is_array($array) && count($array)>0)
        {
            foreach(array_keys($array) as $key){
                $temp[$key] = $array[$key][$index];
                if ($temp[$key] == $value){
                    $newarray[$key] = $array[$key];
                }
            }
        }
        return $newarray;
    }
}
