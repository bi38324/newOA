<?php

namespace App\Admin\Controllers;

use App\Http\Model\Params;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ParamsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '参数管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Params());

        $grid->column('id', __('ID'));
        $grid->column('title', __('参数标题'));
        $grid->column('alias', __('参数别名'));
        $grid->column('type', __('参数类型'))->using([0 => 'text', 1 => 'textarea', 2 => 'select']);
        $grid->column('sort', __('排序'));
        $grid->column('is_required', __('是否为必填'))->using([0 => '否', 1 => '是']);
        $grid->column('remark', __('备注'));

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
        $show = new Show(Params::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('参数标题'));
        $show->field('alias', __('参数别名'));
        $show->field('type', __('参数类型'))->using([0 => 'text', 1 => 'textarea', 2 => 'select']);
        $show->field('type_params', __('参数选项'));
        $show->field('sort', __('排序'));
        $show->field('is_required', __('是否为必填'))->using([0 => '否', 1 => '是']);
        $show->field('remark', __('备注'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Params());

        $form->text('title', __('参数标题'));
        $form->text('alias', __('参数别名'));
        $form->radio('type', __('参数类型'))->options([0 => '文本', 1 => '长文本', 2 => '下拉框'])->required();
        $form->textarea('type_params', __('参数选项'))->help('当参数类型选择 下拉框 时，填写此项，其他不用填。选项内容用英文逗号进行隔开  例如：选项1,选项2,选项3');
        $form->number('sort', __('排序'))->default(1);
        $form->radio('is_required', __('是否必填'))->options([0 => '否', 1 => '是'])->default(1);
        $form->textarea('remark', __('备注'));

        return $form;
    }
}
