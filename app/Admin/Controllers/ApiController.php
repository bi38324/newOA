<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerDemand;
use \Illuminate\Http\Request;

class ApiController extends Controller
{
    /**
     * 获取相关需求
     * @param Request $request
     * @return array[]
     */
    public function getCustomerDemand(Request $request)
    {
        $recruit = $request->input('q');
        $last_user_id = $request->input('last_user_id');
        $array = array(["id" => 0, "text" => "请选择"]);
        $customer_demands = (new CustomerDemand())->getByCustomerId($recruit, $last_user_id);
        foreach ($customer_demands as $key => $value)
        {
            array_push($array, [
                'id' => $value['id'],
                'text' => $value['demand']
            ]);
        }
        return $array;
    }

    /**
     * 获取相关联系人
     * @param Request $request
     * @return array[]
     */
    public function getCustomerContact(Request $request)
    {
        $last_user_id = $request->input('last_user_id');
        $customer_id = $request->input('q');
        $array = array(["id" => 0, "text" => "请选择"]);
        $customer_contacts = (new CustomerContact())->getByCustomerId($customer_id, $last_user_id);
        foreach ($customer_contacts as $key => $value)
        {
            array_push($array, [
                'id' => $value['id'],
                'text' => $value['name']
            ]);
        }
        return $array;
    }
}
