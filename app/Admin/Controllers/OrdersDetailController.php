<?php

namespace App\Admin\Controllers;

use App\Http\Model\Orders;
use App\Http\Model\OrdersDetail;
use App\Http\Model\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

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
        if($orders_id){
            // 获取当前订单相关联的产品 参数。
            $product_id = Orders::findOrFail($orders_id);
            $sort = Product::where('direct_chapter_id', $orders_id)
                ->orderBy('sort', 'desc')
                ->first();
            $sort = $sort->sort??0;
            $form->text('direct_chapter_id', __('课程id'))->value($recording->id)->readonly();
            $form->text('recoding.name', __('直播大课课程名称'))->value($recording->name)->readonly();
            $form->number('sort', __('排序'))->default($sort+1)->required();
            $recordingChapterId = $orders_id;
        }else{
            $form->text('direct_chapter_id', __('课程id'))->readonly();
            $form->text('recoding.name', __('直播大课课程名称'))->readonly();
            $form->number('sort', __('排序'))->default(0)->required();
            $id = \request()->route()->parameters();
            $recording_chapter = YinhangrenDirectChapterCurriculum::where('id', $id['chaptercurriculum'])->first();
            $recordingChapterId = $recording_chapter->direct_chapter_id;
        }

        return $form;
    }
}
