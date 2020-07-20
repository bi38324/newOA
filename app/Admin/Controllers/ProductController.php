<?php

namespace App\Admin\Controllers;

use App\Http\Model\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Layout\Content;
use Encore\Admin\Tree;

class ProductController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '产品管理';

    public function index(Content $content)
    {
        return $content
            ->title($this->title)
            ->body($this->tree());
    }

    protected function tree()
    {
        return Product::tree(function (Tree $tree) {
            $tree->branch(function ($branch) {
                return "{$branch['title']}";
            });

            $tree->disableSave();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form( new Product());

        $form->select('PID', '父级菜单')->options(Product::selectOptions())->help('只支持两级菜单；超过两级 将不显示');
        $form->text('title', '产品名称')->rules('required|max:21')->required();
        $form->number('sort', '排序')->rules('numeric|min:1')->help('正序;数字越小越靠前')->default(1);

        $form->tools(function ($actions){
            $actions->disableView();
            $actions->disableDelete();
        });
        return $form;
    }
}
