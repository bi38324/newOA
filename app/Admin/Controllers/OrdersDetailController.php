<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\OpenPlatFrom\MsgController;
use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerContactDemand;
use App\Http\Model\Orders;
use App\Http\Model\OrdersDetail;
use App\Http\Model\OrdersLog;
use App\Http\Model\Params;
use App\Http\Model\Product;
use App\Http\Model\ProductParams;
use App\Http\Services\OrdersService;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;

class OrdersDetailController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '订单详情';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new OrdersDetail());



        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(OrdersDetail::findOrFail($id));



        return $show;
    }

    //修改页
    public function edit($id, Content $content)
    {
        return $content
            ->header($this->title)
            ->description('修改')
            ->body($this->form($id)->edit($id));
    }

    /**
     * Make a form builder.
     *
     * @param string $id
     * @return Form
     */
    protected function form($id = '')
    {
        $orders_id = \request('orders_id');
        $admin = new Admin();
        $user = $admin->user();
        $form = new Form(new OrdersDetail());
        $product_params_list = [];
        if ($id)
        {
            $form->text('orders_id', '订单ID')->readonly();
            $form->select('params_id', '参数名称')->options(Params::all()->pluck('title', 'id'))->readOnly();
            $params_id = (new OrdersDetail())->where('id', $id)->firstOrFail();
            $params_info = (new Params())->getById($params_id['params_id']);
            if ($params_info[0]['type'] == 0)
            {
                $form->text('value', '参数值');
            } elseif ($params_info[0]['type'] == 1)
            {
                $form->textarea('value', '参数值');
            } elseif ($params_info[0]['type'] == 2)
            {
                $type_params = explode(',', $params_info[0]['type_params']);
                $options_list = array_combine(array_values($type_params), $type_params);
                $form->select('value', '参数值')->options($options_list);
            }
            $form->select('admin_user_id', __('修改人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);

        } else {
            if($orders_id){
                // 获取当前订单相关联的产品 参数。
                $orders_info = Orders::findOrFail($orders_id);
                // 再通过product_id 获取 product_params
                if ($orders_info)
                {
                    $product_params = (new ProductParams())->getByProductID($orders_info->product_id);
                    foreach ($product_params as $value)
                    {
                        $product_params_list[] = $value['params_id'];
                    }
                }
                $orders['id'] = $orders_id;
                $orders['title'] = $orders_info->customer_title;
                $params_list = (new Params())->getByIds($product_params_list);
                $form->html($this->settingTime($params_list, $orders),'');

            }
        }

        return $form;
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $arr = [];
        $admin = new Admin();
        $user = $admin->user();
        unset($params['customer_title']);
        $keys = array_keys($params);
        $values = array_values($params);
        foreach ($keys as $k => $v)
        {
            if ((int)$v)
            {
                $arr[$k]['orders_id'] = $params['orders_id'];
                $arr[$k]['params_id'] = $v;
                $arr[$k]['value'] = $values[$k];
            }
        }
        foreach ($arr as $item)
        {
            $result = (new OrdersDetail())->create($item);
            if ($result)
            {
                $order_log_data = [
                    'orders_id' => $item['orders_id'],
                    'params_id' => $item['params_id'],
                    'value' => $item['value'],
                    'admin_user_id' => $user->id,
                ];
                $res = (new OrdersLog())->create($order_log_data);
            }
        }
        //通过订单ID查找需求ID，然后查找对应的联系人，然后判断联系人有没有绑定微信，如果有，发送消息提醒
        $orders = (new Orders())->where('id', $params['orders_id'])->firstOrFail();
        if ($orders)
        {
            $customer_contact_demand = (new CustomerContactDemand())->getByDemand($orders->customer_demand_id);
            if ($customer_contact_demand)
            {
                $contact = (new CustomerContact())->getById($customer_contact_demand->customer_contact_id);
                if ($contact)
                {
                    if ($contact->open_id)
                    {
                        $type = '';
                        //如果当前订单的产品属于ITO运维服务这个大分类的产品，发送需求确认通知，如果是服务器则发送开通成功提醒。
                        $order = (new OrdersService())->getOrdersInfo($params['orders_id']);
                        // 查询当前产品所属的大分类
                        $product = (new OrdersService())->getNavPid($orders->product_id);
                        if ($product == 1)
                        {
                            // ITO运维服务
                            $order_info = [
                                'id' => $params['orders_id'],
                                'order_code' => $orders->order_code
                            ];
                            $type = 'order_confirm';
                            (new MsgController())->sendMsg(env('WECHAT_OFFICIAL_ACCOUNT_APPID'), [], $type, $contact->open_id, $order_info);
                        } elseif ($product == 4)
                        {
                            // 服务器主机
                            $order_info = [
                                'id' => $params['orders_id'],
                                'server_ip' => $order['detail']['服务器IP'],
                                'server_name' => $order['detail']['服务器用户名'],
                                'password' => $order['detail']['服务器密码'],
                                'port' => $order['detail']['远程端口'],
                            ];
                            $type = 'server';
                            (new MsgController())->sendMsg(env('WECHAT_OFFICIAL_ACCOUNT_APPID'), [], $type, $contact->open_id, $order_info);
                        }
                    }
                }
            }
        }
        return redirect(admin_url('/orders/'.$params['orders_id']));
    }

    // 修改保存
    public function update($id)
    {
        $parame = request()->all();
        $orders_details = (new OrdersDetail())->where('id', $id)->firstOrFail();
        $order_log_data = $parame;
        unset($parame['admin_user_id']);
        if ($orders_details)
        {
            $result = $orders_details->update($parame);
            if ($result)
            {
                $res = (new OrdersLog())->create($order_log_data);
            }
        }
        return redirect(admin_url('/orders/'.$parame['orders_id']));
    }

    protected function settingTime($params_list = [], $orders = []){
        return view('Admin.orders', ['params_list' => $params_list, 'orders' => $orders]);
    }
}
