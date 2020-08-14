<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\Orders;
use App\Http\Model\OrdersDetail;
use App\Http\Model\OrdersLog;
use App\Http\Model\Params;
use App\Http\Model\Product;
use App\Http\Model\ProductParams;
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
                    'params_id' => $item['orders_id'],
                    'value' => $item['orders_id'],
                    'admin_user_id' => $user->id,
                ];
                $res = (new OrdersLog())->create($order_log_data);
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
        return view('admin.orders', ['params_list' => $params_list, 'orders' => $orders]);
    }
}
