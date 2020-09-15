<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Orders;
use App\Http\Model\OrdersDevOps;
use App\Http\Model\Product;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class OrdersDevOpsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '代运维信息表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new OrdersDevOps());



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
        $show = new Show(OrdersDevOps::findOrFail($id));



        return $show;
    }
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new OrdersDevOps());
        $admin = new Admin();
        $user = $admin->user();
        $orders_id = \request('orders_id');
        $orders_info = (new Orders())->getById($orders_id);
        $form->text('orders_id', __('订单ID'))->default($orders_id)->readonly();
        $form->text('orders_code', __('订单号'))->default($orders_info[0]['order_code'])->readonly();
        $form->textarea('domain', __('域名管理权限'));
        $form->textarea('host', __('主机管理权限'));
        $form->textarea('website', __('网站后台管理权限'));
        $form->select('admin_user_id', __('提交人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);

        return $form;
    }

    public function store()
    {
        $params = request()->all();
        unset($params['orders_code']);
        $file = request()->file('file_path');
        if ($file)
        {

        }
        $result = (new OrdersDevOps())->create($params);
        return redirect(admin_url('/orders/'.$params['orders_id']));
    }

    public function update($id)
    {
        $params = request()->all();
        unset($params['orders_code']);
        $orders_devops = (new OrdersDevOps())->where('id', $id)->findOrFail();
        if ($orders_devops)
        {
            $result = $orders_devops->update($params);
        }
        return redirect(admin_url('/orders/'.$id));
    }
}
