<?php

namespace App\Admin\Controllers;

use App\Http\Model\PayType;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PayTypeController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '收款方式管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PayType());
        $grid->column('id', __('ID'));
        $grid->column('title', __('收款方式'));
        $grid->column('number', __('收款账号'));
        //筛选
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
        });
        $grid->disableRowSelector();

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
        $show = new Show(PayType::findOrFail($id));
        $show->field('id', __('ID'));
        $show->field('title', __('收款方式'));
        $show->field('number', __('收款账号'));

        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PayType());
        $form->text('title', __('收款方式'))->required();
        $form->text('number', __('收款账号'))->required();
        return $form;
    }
}
