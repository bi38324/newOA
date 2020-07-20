<?php

namespace App\Admin\Controllers;

use App\Http\Model\CustomerContact;
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

        $grid->column('id', __('Id'));
        $grid->column('customer_id', __('Customer id'));
        $grid->column('customer_demand_id', __('Customer demand id'));
        $grid->column('name', __('Name'));
        $grid->column('phone', __('Phone'));
        $grid->column('is_first', __('Is first'));
        $grid->column('open_id', __('Open id'));
        $grid->column('headImgUrl', __('HeadImgUrl'));
        $grid->column('sex', __('Sex'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('deleted_at', __('Deleted at'));

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

        $show->field('id', __('Id'));
        $show->field('customer_id', __('Customer id'));
        $show->field('customer_demand_id', __('Customer demand id'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('is_first', __('Is first'));
        $show->field('open_id', __('Open id'));
        $show->field('headImgUrl', __('HeadImgUrl'));
        $show->field('sex', __('Sex'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('deleted_at', __('Deleted at'));

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

        $form->number('customer_id', __('Customer id'));
        $form->number('customer_demand_id', __('Customer demand id'));
        $form->text('name', __('Name'));
        $form->mobile('phone', __('Phone'));
        $form->switch('is_first', __('Is first'));
        $form->text('open_id', __('Open id'));
        $form->text('headImgUrl', __('HeadImgUrl'));
        $form->switch('sex', __('Sex'));

        return $form;
    }
}
