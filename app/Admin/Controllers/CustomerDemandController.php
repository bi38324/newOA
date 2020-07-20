<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerDemand;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerDemandController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户需求';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerDemand());
        $admin = new Admin();
        $user = $admin->user();
        $grid->column('id', __('ID'));
        $grid->column('customer.title', __('客户名称'));
        $grid->column('demand', __('客户需求'));
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->equal('customer_id', '客户名称')->select(Customer::all()->pluck('title','id'));
        });
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
        $show = new Show(CustomerDemand::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('customer.title', __('客户名称'));
        $show->field('demand', __('客户需求'));
        $show->field('created_at', __('提交时间'));
        $show->field('updated_at', __('更新时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CustomerDemand());

        $form->select('customer_id', __('客户ID'))->options(Customer::all()->pluck('title', 'id'));
        $form->textarea('demand', __('客户需求'));

        return $form;
    }
}
