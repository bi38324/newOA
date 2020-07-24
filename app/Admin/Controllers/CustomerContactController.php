<?php

namespace App\Admin\Controllers;

use App\Http\Model\Customer;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerDemand;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerContactController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户联系人管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerContact());
        $admin = new Admin();
        $user = $admin->user();
        if($user->isRole('sales'))
        {
            $grid->model()->whereHas('admin_user_id', '=', $user->id);
        } elseif($user->isRole('commerce'))
        {
            $grid->model()->where('status', '!=', 4);
        }
        $grid->column('id', __('Id'));
        $grid->column('customer.title', __('客户名称'));
        $grid->column('customer_demand.demand', __('客户需求'));
        $grid->column('name', __('联系人姓名'));
        $grid->column('phone', __('联系电话'));
        $grid->column('is_first', __('是否为第一联系人'))->using([0 => '否', 1 => '是']);
        $grid->column('headImgUrl', __('头像'))->image();
        $grid->column('sex', __('性别'))->using([0 => '男', 1 => '女']);

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
        $show = new Show(CustomerContact::findOrFail($id));

        $show->field('customer.title', __('客户名称'));
        $show->field('customer_demand.demand', __('客户需求'));
        $show->field('name', __('联系人姓名'));
        $show->field('phone', __('联系电话'));
        $show->field('is_first', __('是否为第一联系人'))->using([0 => '否', 1 => '是']);
        $show->field('headImgUrl', __('头像'))->image();
        $show->field('sex', __('性别'))->using([0 => '男', 1 => '女']);

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CustomerContact());
        $admin = new Admin();
        $user = $admin->user();
        if($user->isRole('administrator'))
        {
            $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand');
        } else {
            $form->select('customer_id', __('客户名称'))->options(Customer::select('last_user_id', $user->id)->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand');
        }
        $form->select('customer_demand_id', __('客户需求'))->options(CustomerDemand::all()->pluck('demand', 'id'))->required();
        $form->text('name', __('联系人姓名'))->required();
        $form->text('phone', __('联系电话'))->required();
        $form->radio('is_first', __('是否为第一联系人'))->options([0 => '否', 1 => '是'])->required();
        $form->radio('sex', __('性别'))->options([0 => '男', 1 => '女'])->required();

        return $form;
    }
}
