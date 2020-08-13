<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\OrdersRenewLog;
use App\Http\Model\Product;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class OrdersRenewLogController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '订单续费管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new OrdersRenewLog());
        $admin = new Admin();
        $user = $admin->user();
        $grid->column('id', __('ID'));
        $grid->column('orders.order_code', __('订单号'));
        $grid->column('orders.customer_title', __('客户名称'));
        $grid->column('product.title', __('产品名称'));
        $grid->column('start_time', __('开通时间'));
        $grid->column('old_end_time', __('上次到期时间'));
        $grid->column('end_time', __('当前到期时间'));
        $grid->column('receivable', __('应收金额'));
        $grid->column('receipts', __('实收金额'));
        $grid->column('arrears', __('未收金额'));
        $grid->column('is_renew', __('是否续费'))->using([0 => '首次', 1 => '续费']);
        $grid->column('is_tax', __('是否含税'))->using([0 => '不含税', 1 => '含税']);
        $grid->column('admin_user.name', __('生成人'));

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->like('customer_title', '客户名称');
            $filter->equal('product_id', '产品名称')->select(Product::selectOptions());
            $filter->between('start_time', '开始时间')->datetime();
            $filter->between('end_time', '结束时间')->datetime();
            $filter->equal('admin_user_id', '所属销售')->select(AdminUsers::all()->pluck('name', 'id'));
        });

        // 去掉批量操作
        $grid->disableBatchActions();
        if ($user->cannot('administrator') || $user->cannot('fin')) {
            $grid->actions(function ($actions) {
                // 去掉删除
                $actions->disableDelete();
            });
            $grid->disableRowSelector();
        }
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
        $show = new Show(OrdersRenewLog::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('orders.order_code', __('订单号'));
        $show->field('orders.customer_title', __('客户名称'));
        $show->field('product.title', __('产品名称'));
        $show->field('start_time', __('开通时间'));
        $show->field('old_end_time', __('上次到期时间'));
        $show->field('end_time', __('当前到期时间'));
        $show->field('receivable', __('应收金额'));
        $show->field('receipts', __('实收金额'));
        $show->field('arrears', __('未收金额'));
        $show->field('is_renew', __('是否续费'))->using([0 => '首次', 1 => '续费']);
        $show->field('is_tax', __('是否含税'))->using([0 => '不含税', 1 => '含税']);
        $show->field('admin_user.name', __('生成人'));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new OrdersRenewLog());

        $form->text('orders.order_code', __('订单号'))->readonly();
        $form->text('orders.customer_title', __('客户名称'))->readonly();
        $form->text('product.title', __('产品名称'))->readonly();
        $form->datetime('start_time', __('开通时间'))->readonly();
        $form->datetime('old_end_time', __('上次到期时间'))->readonly();
        $form->datetime('end_time', __('当前到期时间'))->readonly();
        $form->decimal('receivable', __('应收金额'))->readonly();
        $form->decimal('receipts', __('实收金额'));
        $form->decimal('arrears', __('未收金额'));
        $form->radio('is_renew', __('是否续费'))->options([0 => '首次', 1 => '续费'])->readonly();
        $form->radio('is_tax', __('是否含税'))->options([0 => '不含税', 1 => '含税'])->readonly();
        $form->number('sort', __('排序'))->default(1);
        $form->radio('is_required', __('是否必填'))->options([0 => '否', 1 => '是'])->default(1);

        return $form;
    }

    public function update($id)
    {
        $parame = request()->all();
        $admin = new Admin();
        $user = $admin->user();
        $orders_renew_log = (new OrdersRenewLog())->where('id', $id)->firstOrFail();
        if ($orders_renew_log)
        {
            $result = $orders_renew_log->update($parame);
            if ($result)
            {

            }
        }
            if($result) {
                // 修改 orders_status
                $orders_status = new OrdersStatus();
                $orders_status_info = $orders_status->getByOrdersId($id);
                $res = $orders_status_info->update($status_params);
                $status_params['orders_id'] = $id;
                $status_log = (new OrdersStatusLog())->create($status_params);
                return redirect(admin_url('/orders'));
            }
    }
}
