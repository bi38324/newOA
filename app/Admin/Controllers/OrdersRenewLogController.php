<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Orders;
use App\Http\Model\OrdersRenewLog;
use App\Http\Model\Product;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;

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
        $grid->disableCreateButton();
//        if ($user->cannot('administrator') || $user->cannot('fin')) {
//            $grid->actions(function ($actions) {
//                // 去掉删除
//                $actions->disableDelete();
//            });
//            $grid->disableRowSelector();
//        }
        $grid->actions(function ($actions) {
            // 去掉删除
            $actions->disableDelete();
            $actions->disableEdit();
            $actions->disableView();
            $apiUrl = '/admin/order-payment-log/create?renew_log_id='.$actions->row->id;
            $actions->append("<div class='mb-5'><a class='grid-row-pass' data-id='{$actions->row->id}' href='{$apiUrl}' title='入账'>入账</a></div>");
        });
        $grid->disableRowSelector();
//        $grid->disableActions();
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

        $show->orders_payment('订单缴费记录', function ($account) use ($id) {
            $account->resource('/admin/orders-payment-log');
            $account->column('id', 'ID');
            $account->column('receivable', __('应收金额'));
            $account->column('old_receipts', __('上次收款金额'));
            $account->column('receipts', __('本次收款金额'));
            $account->column('arrears', __('未收金额'));
            $account->column('pay_type.title', __('支付方式'));
            $account->column('pay_time', __('支付时间'));
            $account->column('admin_user.name', __('操作人'));
            $account->disableCreateButton();
            $account->disableRowSelector();
            $account->disableColumnSelector();
            $account->disableExport();
            $account->disableFilter();
            $account->perPages([5, 10, 20, 30, 50,100]);
            $account->paginate(5);
            $account->disableActions();
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
        $admin = new Admin();
        $user = $admin->user();
        $orders_id = \request('orders_id');
        $orders_info = (new Orders())->getById($orders_id);
        $form->text('orders_id', __('订单ID'))->default($orders_id)->readonly();
        $form->text('orders_code', __('订单号'))->default($orders_info[0]['order_code'])->readonly();
        $form->select('product_id', __('产品名称'))->options(Product::selectOptions())->default($orders_info[0]['product_id'])->readonly();
        $form->datetime('start_time', __('开通时间'))->default($orders_info[0]['start_time'])->readonly();
        $form->datetime('old_end_time', __('上次到期时间'))->default($orders_info[0]['end_time'])->readonly();
        $form->datetime('end_time', __('当前到期时间'))->required();
        $form->decimal('receivable', __('应收金额'))->default($orders_info[0]['receivable'])->readonly();
        $form->decimal('receipts', __('实收金额'));
        $form->decimal('arrears', __('未收金额'));
        $form->radio('is_renew', __('是否续费'))->options([0 => '首次', 1 => '续费'])->default(1);
        $form->radio('is_tax', __('是否含税'))->options([0 => '不含税', 1 => '含税'])->default(0);
        $form->select('owner_user_id', __('提交人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);

        return $form;
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'end_time' => 'required',
        ]);
        unset($params['orders_code']);
        if($validator->fails()) {
            return redirect(admin_url('/orders-renew-log/create?orders_id='.$params['orders_id']))->withErrors($validator);
        } else {
            $result = (new OrdersRenewLog())->create($params);
            if ($result)
            {
                $orders = (new Orders())->where('id', $params['orders_id'])->firstOrFail();

                if ($orders)
                {
                    $data['end_time'] = $params['end_time'];
                    if ($orders->service_status == 2)
                    {
                        // 服务已到期
                        $data['service_status'] = 1;
                    }
                    $res = $orders->update($data);
                }
            }
            return redirect(admin_url('/orders'));
        }
    }

//    public function update($id)
//    {
//        $parame = request()->all();
//        $admin = new Admin();
//        $user = $admin->user();
//        $orders_renew_log = (new OrdersRenewLog())->where('id', $id)->firstOrFail();
//        if ($orders_renew_log)
//        {
//            $result = $orders_renew_log->update($parame);
//            if ($result)
//            {
//
//            }
//        }
//            if($result) {
//                // 修改 orders_status
//                $orders_status = new OrdersStatus();
//                $orders_status_info = $orders_status->getByOrdersId($id);
//                $res = $orders_status_info->update($status_params);
//                $status_params['orders_id'] = $id;
//                $status_log = (new OrdersStatusLog())->create($status_params);
//                return redirect(admin_url('/orders'));
//            }
//    }
}
