<?php

namespace App\Admin\Controllers;

use App\Http\Model\Channel;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Tree;

class ChannelController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户渠道管理';

    public function index(Content $content)
    {
        return $content
            ->title($this->title)
            ->body($this->tree());
    }

    protected function tree()
    {
        return Channel::tree(function (Tree $tree) {
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
        $form = new Form( new Channel());

        $form->select('PID', '父级菜单')->options(Channel::selectOptions())->help('只支持两级菜单；超过两级 将不显示');
        $form->text('title', '渠道名称')->rules('required|max:21')->required();
        $form->number('sort', '排序')->rules('numeric|min:1')->help('正序;数字越小越靠前')->default(1);

        $form->tools(function ($actions){
            $actions->disableView();
            $actions->disableDelete();
        });
//
//        $form->footer(function ($footer) {
//            //去掉`查看`checkbox
//            $footer->disableViewCheck();
//            //去掉`继续编辑`checkbox
//            $footer->disableEditingCheck();
//            //去掉`继续创建`checkbox
//            $footer->disableCreatingCheck();
//        });
        return $form;
    }
}
