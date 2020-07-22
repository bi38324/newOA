<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerDemand;
use App\Http\Model\Orders;
use App\Http\Model\OrdersStatus;
use App\Http\Model\ordersStatusLog;
use App\Http\Model\Product;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;

class OrdersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '订单管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Orders());
        $grid->model()->orderBy('updated_at', 'desc');
        $admin = new Admin();
        $user = $admin->user();
        if($user->isRole('sales'))
        {
            $grid->model()->where('admin_user_id', '=', $user->id);
        } elseif($user->isRole('commerce'))
        {
            $grid->model()->where('status', '!=', 4);
        }
        $grid->column('id', __('ID'));
        $grid->column('order_code', __('订单号'));
        $grid->column('customer_title', __('客户名称'));
        $grid->column('product.title', __('产品名称'));
        $grid->column('start_time', __('开始时间'));
        $grid->column('end_time', __('结束时间'));
        $grid->column('admin_user.name', __('所属销售'));
        if($user->isRole('finance') || $user->isRole('administrator'))
        {
            $grid->column('orders_status.finance_status', __('财务状态'))->editable('select', [0 => '待处理', 1 => '未收到款', 2 => '已收到款']);
        }
        if($user->isRole('check') || $user->isRole('administrator'))
        {
            $grid->column('orders_status.check_status', __('验收状态'))->editable('select', [0 => '待处理', 1 => '验收不合格', 2 => '验收通过']);
        }
        if($user->isRole('commerce') || $user->isRole('administrator'))
        {
            $grid->column('orders_status.commerce_status', __('开发状态'))->editable('select', [0 => '待处理', 1 => '资料不完整', 2 => '开发中', 3 => '申请技术协助', 4 => '开发完成']);
            $grid->column('file_url', __('附件地址'))->downloadable();
        }
        if($user->isRole('it') || $user->isRole('administrator'))
        {
            $grid->column('orders_status.it_status', __('技术状态'))->editable('select', [0 => '待处理', 1 => '处理中', 2 => '处理完成']);
        }
        $grid->column('status', __('订单状态'))->using([0 => '待开发', 1 => '开发中', 2 => '开发完成', 3 => '已交付', 4 => '已关闭']);

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->like('customer_title', '客户名称');
            $filter->equal('product_id', '产品名称')->select(Product::selectOptions());
            $filter->between('start_time', '开始时间')->datetime();
            $filter->between('end_time', '结束时间')->datetime();
            $filter->equal('admin_user_id', '所属销售')->select(AdminUsers::all()->pluck('name', 'id'));
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
        $show = new Show(Orders::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('order_code', __('订单号'));
        $show->field('customer_title', __('客户名称'));
        $show->field('customer_demand.demand', __('需求'));
        $show->field('product.title', __('产品名称'));
        $show->field('start_time', __('开始时间'));
        $show->field('end_time', __('结束时间'));
        $show->field('admin_user.name', __('所属销售'));
        $show->field('price', __('销售金额'));
        $show->field('receivable', __('应收金额'));
        $show->field('receipts', __('实收金额'));
        $show->field('sales_remark', __('销售备注'));
        $show->field('it_remark', __('技术备注'));
        $show->field('file_path', __('附件地址'));
        $show->field('status', __('订单状态'))->using([0 => '待开发', 1 => '开发中', 2 => '开发完成', 3 => '已交付', 4 => '已关闭']);
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });

        $show->orders_detail('订单详情', function ($account) use ($id) {
            $account->resource('/admin/orders-details');
            $account->column('id', 'ID');
            $account->column('product_params.title', '参数名称');
            $account->column('value', '参数值')->editable();
            $account->disableRowSelector();
            $account->disableColumnSelector();
            $account->disableExport();
            $account->disableFilter();
            $account->perPages([5, 10, 20, 30, 50,100]);
            $account->paginate(5);
            $account->disableActions();
        });

//        $show->orders_status('订单状态', function ($account) use ($id) {
//            $account->column('finance_status', '财务状态')->using([0 => '待处理', 1 => '未收到款', 2 => '已收到款']);
//            $account->column('finance_remark', '财务备注');
////            $account->column('finance_user_id', '财务审批人')->as(function ($content) {
////                dd($content);
////                return "<pre>{$content}</pre>";
////            });
//            $account->disableRowSelector();
//            $account->disableColumnSelector();
//            $account->disableCreateButton();
//            $account->disableExport();
//            $account->disableFilter();
//            $account->perPages([5, 10, 20, 30, 50,100]);
//            $account->paginate(5);
//            $account->disableActions();
//        });
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Orders());
        $admin = new Admin();
        $user = $admin->user();

        if($user->isRole('sales') || $user->isRole('commerce'))
        {
            $form->select('customer_id', __('客户名称'))->options(Customer::select('last_user_id', $user->id)->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand');
        } else {
            $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand');
        }

        $form->select('customer_demand_id', __('客户需求'))->options(CustomerDemand::all()->pluck('demand', 'id'))->required();
        $form->select('product_id', __('产品ID'))->options(Product::selectOptions())->required();
        $form->datetime('start_time', __('开始时间'))->default(date('Y-m-d H:i:s'));
        $form->datetime('end_time', __('结束时间'))->default(date('Y-m-d H:i:s'));
        $form->select('admin_user_id', __('所属销售'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
        $form->decimal('price', __('销售金额'));
        $form->decimal('receivable', __('应收金额'));
        $form->decimal('receipts', __('实收金额'));
        $form->textarea('sales_remark', __('销售备注'));
        $form->textarea('it_remark', __('技术备注'));
        $form->file('file_path', __('上传附件'));
        $form->radio('status', __('订单状态'))->options([0 => '待开发', 1 => '开发中', 2 => '开发完成', 3 => '已交付', 4 => '已关闭'])->default(0);

        return $form;
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'customer_id' => 'required',
            'customer_demand_id' => 'required'
        ]);
        $params['order_code'] = (new Orders())->createOrderNumb();
        if($validator->fails()) {
            return redirect(admin_url('/orders/create'))->withErrors($validator);
        } else {
            $customer = (new Customer())->getById($params['customer_id']);
            if ($customer)
            {
                $params['customer_title'] = $customer->title;
                $result = (new Orders())->create($params);
                if ($result)
                {
                    $orders_status['orders_id'] = $result->id;
                    $res = (new OrdersStatus())->create($orders_status);
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
//        $orders = (new Orders())->where('id', $id)->firstOrFail();
//        if(isset($parame['_editable']))
//        {
//            $param = explode('.', $parame['name']);
//            $parame[$param[1]] = $parame['value'];
//            unset($parame['name']);
//            unset($parame['value']);
//            unset($parame['pk']);
//            $ex_params = explode('_', $param[1]);
//            if ($ex_params[0] == 'finance')
//            {
//                $parame['finance_user_id'] = $user->id;
//                if ($parame['finance_status'] == 2)
//                {
//                    $p['status'] = 1;
//                    $orders_res = $orders->update($p);
//                }
//            }elseif ($ex_params[0] == 'commerce')
//            {
//                $parame['commerce_user_id'] = $user->id;
//            }elseif ($ex_params[0] == 'it')
//            {
//                $parame['it_user_id'] = $user->id;
//            }elseif ($ex_params[0] == 'check')
//            {
//                $parame['check_user_id'] = $user->id;
//                if ($parame['check_status'] == 2)
//                {
//                    $p['status'] = 2;
//                    $orders_res = $orders->update($p);
//                }
//            }
//            $orders_status = new OrdersStatus();
//            $orders_status_info = $orders_status->getByOrdersId($id);
//            $res = $orders_status_info->update($parame);
//            $parame['orders_id'] = $id;
//            $result = (new OrdersStatusLog())->create($parame);
//
//        } else {
//            $result = $orders->update($parame);
//            if($result) {
//                return redirect(admin_url('/orders'));
//            }
//        }
//    }
}
