<?php

namespace App\Admin\Controllers;

use App\Http\Model\Customer;
use App\Http\Model\Orders;
use App\Http\Model\OrdersDetail;
use App\Http\Model\Params;
use App\Http\Model\Product;
use App\Http\Model\ProductParams;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
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

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $orders_id = \request('orders_id');

        $form = new Form(new OrdersDetail());
        $product_params_list = [];
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
        return $form;
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $arr = [];
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
        }
        return redirect(admin_url('/orders/'.$params['orders_id']));
    }

//    // 修改保存
//    public function update()
//    {
//        $parame = request()->all();
//        $data = [];
//        $parame[$parame['name']] = $parame['value'];
//        unset($parame['name']);
//        unset($parame['value']);
//        unset($parame['pk']);
//        $yhr_directSeeding = (new YinhangrenDirectSeeding())->where('id', $id)->firstOrFail();
//        $result = $yhr_directSeeding->update($parame);
//        if ($result)
//        {
//            // 同步修改服务号
//            $subject = new Subject();
//            $subject_info = $subject->getSubjectInfoByYSubjectId($id,0);
//            if (array_key_exists('is_show', $parame))
//            {
//                $data['is_show'] = !$parame['is_show'];
//            } elseif (array_key_exists('state', $parame))
//            {
//                $data['status'] = $parame['state'];
//            }
//            $res = $subject_info->update($data);
//        }
//        return redirect(admin_url('/orders/'.$params['orders_id']));
//    }

    protected function settingTime($params_list = [], $orders = []){
        return view('admin.orders', ['params_list' => $params_list, 'orders' => $orders]);
    }
}
