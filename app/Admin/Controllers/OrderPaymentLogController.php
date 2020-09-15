<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\OpenPlatFrom\MsgController;
use App\Http\Model\AdminUsers;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerContactDemand;
use App\Http\Model\OrderPaymentLog;
use App\Http\Model\Orders;
use App\Http\Model\OrdersRenewLog;
use App\Http\Model\PayType;
use App\Http\Model\Product;
use App\Http\Services\OrdersService;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;

class OrderPaymentLogController extends AdminController
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
                $actions->disableView();
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
        $orders_renew_log_id = \request('renew_log_id');
        $orders_renew_log_info = (new OrdersRenewLog())->getById($orders_renew_log_id);
        $orders_payment_log_info = (new OrderPaymentLog())->getLastInfo($orders_renew_log_id);
        if ($orders_payment_log_info)
        {
            $old_recripts = $orders_payment_log_info->receipts;
        } else {
            $old_recripts = 0;
        }
        $form->text('orders_renew_log_id', __('续费ID'))->default($orders_renew_log_id)->readonly();
        $form->decimal('receivable', __('应收金额'))->default($orders_renew_log_info[0]['receivable'])->readonly();
        $form->decimal('old_receipts', __('上次收款金额'))->default($old_recripts)->readonly();
        $form->decimal('receipts', __('本次收款金额'))->required();
        $form->select('pay_type_id', __('支付方式'))->options(PayType::all()->pluck('title', 'id'))->required();
        $form->datetime('pay_time', __('支付时间'))->required();
        $form->radio('is_tax', __('是否含税'))->options([0 => '不含税', 1 => '含税'])->default(0)->required();
        $form->select('admin_user_id', __('入账人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);

        return $form;
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'receipts' => 'required',
            'pay_type_id' => 'required',
            'pay_time' => 'required',
        ]);
        if($validator->fails()) {
            return redirect(admin_url('/order-payment-log/create?renew_log_id='.$params['orders_renew_log_id']))->withErrors($validator);
        } else {
            $params['arrears'] = $params['receivable']-$params['old_receipts']-$params['receipts'];
            $is_tax = $params['is_tax'];
            unset($params['is_tax']);
            $result = (new OrderPaymentLog())->create($params);
            $orders_renew_log = (new OrdersRenewLog())->where('id', $params['orders_renew_log_id'])->firstOrFail();

            if ($result)
            {
                if ($orders_renew_log)
                {
                    $data['receipts'] = $params['old_receipts']+$params['receipts'];
                    $data['arrears'] = $params['arrears'];
                    $data['is_tax'] = $is_tax;
                    $res = $orders_renew_log->update($data);
                }
                $orders_info = (new Orders())->where('id', $orders_renew_log->orders_id)->firstOrFail();
                //通过订单ID查找需求ID，然后查找对应的联系人，然后判断联系人有没有绑定微信，如果有，发送消息提醒
                if ($orders_info)
                {
                    $orders['receipts'] = $params['old_receipts']+$params['receipts'];
                    $re = $orders_info->update($orders);
                    $customer_contact_demand = (new CustomerContactDemand())->getByDemand($orders->customer_demand_id);
                    if ($customer_contact_demand)
                    {
                        $contact = (new CustomerContact())->getById($customer_contact_demand->customer_contact_id);
                        if ($contact)
                        {
                            if ($contact->open_id)
                            {
                                // 确认收到款推送
                                $order_info = [
                                    'id' => $params['orders_id'],
                                    'order_code' => $orders->order_code,
                                    'receipts' => $params['receipts'],// 本次收款金额
                                    'total' => $params['old_receipts']+$params['receipts'],// 累计支付金额
                                    'receivable' => $params['receivable'],// 应收金额
                                    'pay_time' => $params['pay_time'],// 支付时间
                                    'arrears' => $params['arrears'],// 待支付金额
                                ];
                                (new MsgController())->sendMsg(env('WECHAT_OFFICIAL_ACCOUNT_APPID'), [], 'payment', $contact->open_id, $order_info);
                            }
                        }
                    }

                }
            }
            return redirect(admin_url('/orders/'.$orders_renew_log->orders_id));
        }
    }
}
