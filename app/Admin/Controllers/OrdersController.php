<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerDemand;
use App\Http\Model\Orders;
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
        $grid->column('price', __('销售金额'));
        $grid->column('receivable', __('应收金额'));
        $grid->column('receipts', __('实收金额'));
        $grid->column('sales_remark', __('销售备注'));
        $grid->column('it_remark', __('技术备注'));
        $grid->column('file_path', __('附件地址'));
        $grid->column('status', __('订单状态'))->using([0 => '待开发', 1 => '开发中', 2 => '开发完成', 3 => '已交付', 4 => '已关闭']);

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
        $show->field('created_at', __('提交时间'));
        $show->field('updated_at', __('更新时间'));
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });

        $show->orders_detail('订单详情', function ($account) use ($id) {
            $account->resource('/admin/orders-details');
            $account->column('id', 'ID');
            $account->column('product_params.title', '参数名称');
            $account->column('value', '参数值');
            $account->disableRowSelector();
            $account->disableColumnSelector();
            $account->disableExport();
            $account->disableFilter();
            $account->perPages([5, 10, 20, 30, 50,100]);
            $account->paginate(5);
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
//        $form->html($this->settingTime($default_info['times_setting']??''),'');

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
            }
            return redirect(admin_url('/orders'));
        }
    }

//    protected function settingTime($setting = []){
//        $this->settingScript();
//        $setting = [];
//        $customer_id = Admin::script($this->script());
//        dd($customer_id);
//
//        return view('admin.orders', compact('详情'));
//    }
//    protected function settingScript()
//    {
//        $script = <<<'EOT'
//$('.').iCheck({checkboxClass:'icheckbox_minimal-blue'});
//EOT;
//
//        Admin::script($script);
//    }
//
//    protected function script()
//    {
//
//        return <<<SCRIPT
//$(document).ready(function() {
//
//         $('select[name="customer_id"]').on('change',function(){
//         return $(this).val();
//         });
//     });
//SCRIPT;
//
//    }

}
