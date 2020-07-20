<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerDemand;
use \Illuminate\Http\Request;

class ApiController extends Controller
{
    public function getCustomerDemand(Request $request)
    {
        $recruit = $request->input('q');
        $array = array(["id" => 0, "text" => "请选择"]);
        $customer_demands = (new CustomerDemand())->getByCustomerId($recruit);
        foreach ($customer_demands as $key => $value)
        {
            array_push($array, [
                'id' => $value['id'],
                'text' => $value['demand']
            ]);
        }
        return $array;
    }
}
