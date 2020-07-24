<?php
/**
 * Created by PhpStorm.
 * User: jason zhang
 * Date: 2019-05-14
 * Time: 14:21
 */

namespace App\Http\Services;
use Request;

class BaseService
{
    public $model = null;

    public function getAll($field = [], $orderBy = 'id', $asc = true){

        if(!empty($field)){
            return $this->model->select($field)->orderBy($orderBy, $asc?'asc':'desc')->get();
        }

        return $this->model->orderBy($orderBy, $asc?'asc':'desc')->get();
    }

    public function getById($id){

        return $this->model->where('id', $id)->first();
    }

    public function getInfoByFiled($val, $filed = 'id'){

        if($filed == 'id'){
            return $this->getById($filed);
        }else{
            return $this->model->where($filed, $val)->first();
        }
    }

    public function list(){
        return $this->model->orderBy('created_at', 'desc')->paginate(30);
    }
}