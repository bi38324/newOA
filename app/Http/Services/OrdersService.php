<?php
namespace App\Http\Services;

use App\Http\Model\AdminUsers;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerContactDemand;
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

    public function getAllOrders($customer_contact_id)
    {
        $order_list = [];
        // 先查找跟当前用户相关联的需求id
        $demand_id = (new CustomerContactDemand())->getByContactId($customer_contact_id);
        if ($demand_id){
            // 根据需求id查找对应的order
            $list = [];
            $confirm = [];
            $under_way = [];
            $finish = [];
            foreach ($demand_id as $key => $value)
            {
                $orders = (new Orders())->getByCustomerDemandId($value['id']);
                if ($orders)
                {
                    foreach ($orders as $order)
                    {
                        array_push($list,$order);
                    }
                }
                $orders_confirm = (new Orders())->getByCustomerDemandIdStatus($value['id'], 0);
                if ($orders_confirm)
                {
                    foreach ($orders_confirm as $order_confirm)
                    {
                        array_push($confirm,$order_confirm);
                    }
                }
                $orders_under_way = (new Orders())->getByCustomerDemandIdStatus($value['id'], 1);
                if ($orders_under_way)
                {
                    foreach ($orders_under_way as $orders_under_way_list)
                    {
                        array_push($under_way,$orders_under_way_list);
                    }
                }
                $orders_finish = (new Orders())->getByCustomerDemandIdStatus($value['id'], 2);
                if ($orders_finish)
                {
                    foreach ($orders_finish as $orders_finish_list)
                    {
                        array_push($finish,$orders_finish_list);
                    }
                }
            }
            $order_list['all'] = $list;
            $order_list['confirm'] = $confirm;
            $order_list['under_way'] = $under_way;
            $order_list['finish'] = $finish;

        } else {
            $order_list['all'] = [];
            $order_list['confirm'] = [];
            $order_list['under_way'] = [];
            $order_list['finish'] = [];
        }
        return $order_list;

    }

    public function getNavPid($product_id)
    {
        $list = [];
        $arr = (new Product())->getList();
        if ($arr)
        {
            foreach ($arr as $key => $value)
            {
                $list[$value['id']] = $value['PID'];
            }
        }
        $id = $product_id;
        while($list[$id]) {
            $id = $list[$id];
        }
        return $id;
    }
}
