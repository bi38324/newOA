<?php
namespace App\Http\Services;

use App\Http\Model\AdminUsers;
use App\Http\Model\CustomerContact;
use App\Http\Model\Orders;
use App\Http\Model\OrdersDetail;
use App\Http\Model\OrdersStatus;
use App\Http\Model\Params;
use App\Http\Model\Product;
use Encore\Admin\Admin;

class OrdersService extends BaseService
{
    public function __construct()
    {
        $this->model = new CustomerContact();
    }

    public function getUserPhone($user){

        $staff = $this->getInfoByFiled($user['UserId'], 'userid');
        $phone = $staff->phone;
        return $phone;
    }

    public function getOrdersInfo($order_id)
    {
        $order = [];
        $order_info = (new Orders())->getById($order_id);
        $orders_detail = (new OrdersDetail())->getByOrdersId($order_id);
        if ($order_info)
        {
            $last_user_info = (new AdminUsers())->getById($order_info[0]['last_user_id']);
            if ($last_user_info)
            {
                $order_info[0]['last_user'] = $last_user_info->name;
            } else {
                $order_info[0]['last_user'] = '';
            }
            $product = (new Product())->getById($order_info[0]['product_id']);
            if ($product)
            {
                $order_info[0]['product_title'] = $product->title;
            } else {
                $order_info[0]['product_title'] = '';
            }
            $customer_status = (new OrdersStatus())->getByOrdersId($order_id);
            if ($customer_status)
            {
                $order_info[0]['customer_status'] = $customer_status->customer_status;
            } else {
                $order_info[0]['customer_status'] = '';
            }
            $order['info'] = $order_info[0];
            foreach ($orders_detail as $key => $value)
            {
                $params = (new Params())->getById($value['params_id']);
                if ($params)
                {
                    $order['detail'][$params[0]['title']] = $value['value'];
                }
            }
        } else {
            $order['info'] = [];
            $order['detail'] = [];
        }
        return $order;
    }

}
