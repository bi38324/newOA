<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\OpenPlatFrom\MsgController;
use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerContactDemand;
use App\Http\Model\CustomerDemand;
use App\Http\Model\Orders;
use App\Http\Model\OrdersRenewLog;
use App\Http\Model\OrdersStatus;
use App\Http\Model\ordersStatusLog;
use App\Http\Model\Product;
use App\Http\Services\OrdersService;
use App\Libs\Upload;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

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
        $admin = new Admin();
        $user = $admin->user();
        $grid->model()->orderBy('updated_at', 'desc');

        if($user->isRole('sales'))
        {
            $grid->model()->where('last_user_id', '=', $user->id);
        } elseif($user->isRole('commerce'))
        {
            $grid->model()->where(function ($query) {
                $query->whereHas('orders_status', function ($query) {
                    $query->where('finance_status', 2);
                });
            });
        } elseif($user->isRole('it'))
        {
            $grid->model()->where(function ($query) {
                $query->whereHas('orders_status', function ($query) {
                    $query->where('commerce_status', 3);
                });
            });
        } elseif($user->isRole('check'))
        {
            $grid->model()->where(function ($query) {
                $query->whereHas('orders_status', function ($query) {
                    $query->where('commerce_status', 4);
                });
            });
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
        }else {
            $grid->column('orders_status.commerce_status', __('开发状态'))->using([0 => '待处理', 1 => '资料不完整', 2 => '开发中', 3 => '申请技术协助', 4 => '开发完成']);
        }
        if($user->isRole('it') || $user->isRole('administrator'))
        {
            $grid->column('orders_status.it_status', __('技术状态'))->editable('select', [0 => '待处理', 1 => '处理中', 2 => '处理完成']);
        }
        $grid->column('status', __('订单状态'))->using([0 => '待开发', 1 => '开发中', 2 => '开发完成', 3 => '已交付', 4 => '已关闭']);

        if($user->isRole('commerce'))
        {
            $grid->column('file_url', __('附件地址'))->downloadable();
        } else {
            $grid->column('file_url', __('附件地址'))->link();
        }
        $grid->column('service_status', '服务状态')->display(function ($service_status) {
            $color = '';
            $title = '';
            switch ($service_status)
            {
                case 0:
                    $color = 'blue';
                    $title = '服务未开始';
                    break;
                case 1:
                    $color = 'green';
                    $title = '服务中';
                    break;
                case 2:
                    $color = 'red';
                    $title = '服务到期';
                    break;
            }
            return "<span style='color:$color'>$title</span>";
        });
        $grid->column('customer_confirm','客户确认单')->display(function () {
            return QrCode::size(100)->margin(0)->encoding('UTF-8')->generate('http://oa.zgclouds.com/orders_confirm?order_id='.$this->id);
        });

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
        $grid->disableRowSelector();
        $grid->actions(function ($actions) {
            $actions->disableDelete();

            $apiUrl = '/admin/orders-renew-log/create?orders_id='.$actions->row->id;
            $actions->append("<div class='mb-5'><a class='grid-row-pass' data-id='{$actions->row->id}' href='{$apiUrl}' title='续费'>续费</a></div>");
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

        $admin = new Admin();
        $user = $admin->user();
        $show->field('id', __('ID'));
        Admin::style('.box.box-solid.box-default {border: 0}');
        $show->field('order_code', __('订单号'));
        $show->field('customer_title', __('客户名称'));
        $show->field('customer_demand.demand', __('需求'));
        $show->field('product.title', __('产品名称'));
        $show->field('start_time', __('合同开始时间'));
        $show->field('end_time', __('合同结束时间'));
        $show->field('admin_user.name', __('所属销售'));
        $show->field('price', __('销售金额'));
        $show->field('receivable', __('应收金额'));
        $show->field('receipts', __('实收金额'));
        $show->field('sales_remark', __('销售备注'));
        $show->field('it_remark', __('技术备注'));
        $show->field('file_path', __('附件地址'))->as(function ($file_path) {
            return env('APP_URL').'upload/'.$file_path;
        })->link();
        $show->field('contract_path', __('合同地址'))->as(function ($contract_path) {
            return env('APP_URL').'upload/'.$contract_path;
        })->link();;
        $show->field('status', __('订单状态'))->using([0 => '待开发', 1 => '开发中', 2 => '开发完成', 3 => '已交付', 4 => '已关闭']);
        $show->field('service_status', __('服务状态'))->using([0 => '服务未开始', 1 => '服务中', 2 => '服务到期']);
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
//            $account->disableActions();
            $account->actions(function ($actions) {
                // 去掉删除
                $actions->disableDelete();
                $actions->disableView();
            });
        });

        if ($user->can('administrator') || $user->can('finance')) {
            $show->orders_renew('订单续费管理', function ($account) use ($id) {
                $account->resource('/admin/orders-renew-log');
                $account->model()->orderBy('created_at', 'desc');
                $account->column('id', 'ID');
                $account->column('orders.order_code', __('订单号'));
                $account->column('orders.customer_title', __('客户名称'));
                $account->column('product.title', __('产品名称'));
                $account->column('start_time', __('开通时间'));
                $account->column('old_end_time', __('上次到期时间'));
                $account->column('end_time', __('当前到期时间'));
                $account->column('receivable', __('应收金额'));
                $account->column('receipts', __('实收金额'));
                $account->column('arrears', __('未收金额'));
                $account->column('is_renew', __('是否续费'))->using([0 => '首次', 1 => '续费']);
                $account->column('is_tax', __('是否含税'))->using([0 => '不含税', 1 => '含税']);
                $account->column('admin_user.name', __('生成人'));
                $account->disableCreateButton();
                $account->disableRowSelector();
                $account->disableColumnSelector();
                $account->disableExport();
                $account->disableFilter();
                $account->perPages([5, 10, 20, 30, 50,100]);
                $account->paginate(5);
                $account->actions(function ($actions) {
                    // 去掉删除
                    $actions->disableDelete();
                    $actions->disableEdit();
                    $apiUrl = '/admin/order-payment-log/create?renew_log_id='.$actions->row->id;
                    $actions->append("<div class='mb-5'><a class='grid-row-pass' data-id='{$actions->row->id}' href='{$apiUrl}' title='入账'>入账</a></div>");
                });
            });
        }

        if ($user->can('administrator') || $user->isRole('commerce')) {
            $show->orders_devOps('代运维信息表', function ($devOps) use ($id) {
                $devOps->resource('/admin/orders-devOps');
                $devOps->model()->orderBy('created_at', 'desc');
                $devOps->column('id', 'ID');
                $devOps->column('orders.order_code', __('订单号'));
                $devOps->column('orders.customer_title', __('客户名称'));
                $devOps->column('domain', __('域名管理权限'));
                $devOps->column('host', __('主机管理权限'));
                $devOps->column('website', __('网站后台管理权限'));
                $devOps->column('admin_user.name', __('生成人'));
                $devOps->disableRowSelector();
                $devOps->disableColumnSelector();
                $devOps->disableExport();
                $devOps->disableFilter();
                $devOps->perPages([5, 10, 20, 30, 50,100]);
                $devOps->paginate(5);
                $devOps->actions(function ($actions) {
                    // 去掉删除
                    $actions->disableDelete();
                    $actions->disableView();
                });
            });

            $show->orders_server_report('服务报告管理', function ($devOps) use ($id) {
                $devOps->resource('/admin/orders-server-report');
                $devOps->model()->orderBy('created_at', 'desc');
                $devOps->column('id', 'ID');
                $devOps->column('orders.order_code', __('订单号'));
                $devOps->column('orders.customer_title', __('客户名称'));
                $devOps->column('report_url', __('服务报告地址'))->display(function ($report_url) {
                    return env('APP_URL').'upload/'.$report_url;
                })->link();
//                $devOps->column('report_path', __('服务报告地址'))->as(function ($report_path) {
//                    return env('APP_URL').'upload/'.$report_path;
//                })->link();
                $devOps->column('admin_user.name', __('提交'));
                $devOps->disableRowSelector();
                $devOps->disableColumnSelector();
                $devOps->disableExport();
                $devOps->disableFilter();
                $devOps->perPages([5, 10, 20, 30, 50,100]);
                $devOps->paginate(5);
                $devOps->actions(function ($actions) {
                    // 去掉删除
                    $actions->disableDelete();
                    $actions->disableView();
                });
            });
        }
        return $show;
    }

    //修改页
    public function edit($id, Content $content)
    {
        return $content
            ->header($this->title)
            ->description('修改')
            ->body($this->form($id)->edit($id));
    }

    /**
     * Make a form builder.
     *
     * @param string $id
     * @return Form
     */
    protected function form($id = '')
    {
        $form = new Form(new Orders());
        $admin = new Admin();
        $user = $admin->user();
        if ($user->cannot('customer_manage')) {
            $user_id = $user->id;
        } else {
            $user_id = '';
        }
        if ($id)
        {
            $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand?last_user_id='.$user_id)->readOnly();
            $form->select('customer_demand_id', __('客户需求'))->options(CustomerDemand::all()->pluck('demand', 'id'))->required()->readOnly();
            $form->select('product_id', __('产品ID'))->options(Product::selectOptions())->required()->readOnly();
            $form->datetime('start_time', __('合同开始时间'))->default(date('Y-m-d H:i:s'))->readonly();
        } else {
            $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand?last_user_id='.$user_id);
            $form->select('customer_demand_id', __('客户需求'))->options(CustomerDemand::all()->pluck('demand', 'id'))->required();
            $form->select('product_id', __('产品ID'))->options(Product::selectOptions())->required();
            $form->datetime('start_time', __('合同开始时间'))->default(date('Y-m-d H:i:s'));
        }
        $form->datetime('end_time', __('合同结束时间'))->default(date('Y-m-d H:i:s'));

        $form->select('admin_user_id', __('所属销售'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
        $form->textarea('sales_remark', __('销售备注'));

        $form->decimal('price', __('销售金额'))->required();
        $form->decimal('receivable', __('应收金额'))->required();
        $form->decimal('receipts', __('实收金额'));

        $form->file('file_path', __('上传需求确认单'))->required();
        $form->file('contract_path', __('合同上传'))->required();
//        $form->file('file_path', __('上传附件'));
//        $form->file('contract_path', __('合同上传'));
        $form->radio('status', __('订单状态'))->options([0 => '待开发', 1 => '开发中', 2 => '开发完成', 3 => '已交付', 4 => '已关闭'])->default(0);
        $form->radio('service_status', __('服务状态'))->options([0 => '服务未开始', 1 => '服务中', 2 => '服务到期'])->default(1);

        if ($id)
        {
            if($user->isRole('commerce'))
            {
                $form->select('orders_status.commerce_status', __('商务部状态'))->options([0 => '待处理', 1 => '资料不完整', 2 => '开发中', 3 => '申请技术协助', 4 => '开发完成']);
                $form->textarea('orders_status.commerce_remark', __('商务部备注'));
//                $form->UEditor('content');
                $form->select('orders_status.commerce_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
            } elseif($user->isRole('finance'))
            {
                $form->select('orders_status.finance_status', __('财务状态'))->options([0 => '待处理', 1 => '未收到款', 2 => '已收到款']);
                $form->textarea('orders_status.finance_remark', __('财务备注'));
                $form->select('orders_status.finance_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
            } elseif($user->isRole('it'))
            {
                $form->select('orders_status.it_status', __('技术状态'))->options([0 => '待处理', 1 => '处理中', 2 => '处理完成']);
                $form->textarea('orders_status.it_remark', __('技术备注'));
                $form->select('orders_status.it_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
            } elseif($user->isRole('check')){
                $form->select('orders_status.check_status', __('验收状态'))->options([0 => '待处理', 1 => '不合格', 2 => '验收通过']);
                $form->textarea('orders_status.check_remark', __('验收备注'));
                $form->select('orders_status.check_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
            }else {
                $form->textarea('orders_status.sales_remark', __('销售备注'));
                $form->select('orders_status.commerce_status', __('商务部状态'))->options([0 => '待处理', 1 => '资料不完整', 2 => '开发中', 3 => '申请技术协助', 4 => '开发完成']);
                $form->textarea('orders_status.commerce_remark', __('商务部备注'));
                $form->select('orders_status.commerce_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
                $form->select('orders_status.finance_status', __('财务状态'))->options([0 => '待处理', 1 => '未收到款', 2 => '已收到款']);
                $form->textarea('orders_status.finance_remark', __('财务备注'));
                $form->select('orders_status.finance_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
                $form->select('orders_status.it_status', __('技术状态'))->options([0 => '待处理', 1 => '处理中', 2 => '处理完成']);
                $form->textarea('orders_status.it_remark', __('技术备注'));
                $form->select('orders_status.it_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
                $form->select('orders_status.check_status', __('验收状态'))->options([0 => '待处理', 1 => '不合格', 2 => '验收通过']);
                $form->textarea('orders_status.check_remark', __('验收备注'));
                $form->select('orders_status.check_user_id', __('操作人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);
            }
        }

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
        $file = request()->file('file_path');
        $contract_path = request()->file('contract_path');
        if ($file)
        {
            $params['file_path'] = $file;
        }
        if ($contract_path)
        {
            $params['contract_path'] = $contract_path;
        }
        $params['order_code'] = (new Orders())->createOrderNumb();
        if($validator->fails()) {
            return redirect(admin_url('/orders/create'))->withErrors($validator);
        } else {
            $customer = (new Customer())->getById($params['customer_id']);
            if ($customer)
            {
                if(!empty($file))  {
                    $file_path = (new Upload())->upload($file);
                    $params['file_path'] = $file_path;
                }
                if(!empty($contract_path))  {
                    $contract_paths = (new Upload())->upload($contract_path);
                    $params['contract_path'] = $contract_paths;
                }
                $params['customer_title'] = $customer->title;
                $params['last_user_id'] = $params['admin_user_id'];
                $result = (new Orders())->create($params);
                if ($result)
                {
                    $orders_status['orders_id'] = $result->id;
                    $res = (new OrdersStatus())->create($orders_status);
                    // 首次加到续费管理中
                    $renew_data = [
                        'orders_id' => $result->id,
                        'product_id' => $params['product_id'],
                        'start_time' => $params['start_time'],
                        'old_end_time' => $params['start_time'],
                        'end_time' => $params['end_time'],
                        'receivable' => $params['receivable'],
                        'receipts' => $params['receipts'],
                        'arrears' => $params['receivable']-$params['receipts'],
                        'is_renew' => 0,
                        'is_tax' => 0,
                        'owner_user_id' => $params['admin_user_id'],
                    ];
                    $re = (new OrdersRenewLog())->create($renew_data);
                    return redirect(admin_url('/orders/'.$result->id));
                }
            }
            return redirect(admin_url('/orders'));
        }
    }

    public function update($id)
    {
        $parame = request()->all();
        $admin = new Admin();
        $user = $admin->user();
        $orders = (new Orders())->where('id', $id)->firstOrFail();
        $file = request()->file('file_path');
        if ($file)
        {
            $params['file_path'] = $file;
        }
        $order_info = [
            'id' => $id,
            'order_code' => $orders->order_code,
        ];
        if ($orders) {
            $status = '待验收';
            $product = (new Product())->getById($orders->product_id);
            if ($product)
            {
                $order_info['product'] = $product->title;
            } else {
                $order_info['product'] = '';
            }
            if (isset($parame['_editable'])) {
                $param = explode('.', $parame['name']);
                $parame[$param[1]] = $parame['value'];
                unset($parame['name']);
                unset($parame['value']);
                unset($parame['pk']);
                $ex_params = explode('_', $param[1]);
                if ($ex_params[0] == 'finance') {
                    $parame['finance_user_id'] = $user->id;
                    if ($parame['finance_status'] == 2) {
                        $p['status'] = 1;
                        $orders_res = $orders->update($p);
//                        $status = '财务已收到款，等待开发';
//                    } else {
//                        $status = '财务未收到款';
                    }
                } elseif ($ex_params[0] == 'commerce') {
                    $parame['commerce_user_id'] = $user->id;
                    if ($parame['commerce_status'] == 2) {
                        $p['status'] = 1;
                        $orders_res = $orders->update($p);
                    }
                    switch($parame['commerce_status'])
                    {
                        case 1:
                            $status = '资料不完整';
                            break;
                        case 4:
                            $status = '开发完成，待验收';
                            break;
                        default:
                            $status = "技术开发中";
                            break;
                    }
                    $order_info['status'] = $status;
                    //通过需求ID查找对应的联系人，然后判断联系人有没有绑定微信，如果有，发送消息提醒
                    $customer_contact_demand = (new CustomerContactDemand())->getByDemand($orders->customer_demand_id);
                    if ($customer_contact_demand)
                    {
                        $contact = (new CustomerContact())->getById($customer_contact_demand->customer_contact_id);
                        if ($contact)
                        {
                            if ($contact->open_id)
                            {
                                (new MsgController())->sendMsg(env('WECHAT_OFFICIAL_ACCOUNT_APPID'), [], 'status', $contact->open_id, $order_info);
                            }
                        }
                    }
                } elseif ($ex_params[0] == 'it') {
                    $parame['it_user_id'] = $user->id;
                } elseif ($ex_params[0] == 'check') {
                    $parame['check_user_id'] = $user->id;
                    if ($parame['check_status'] == 2) {
                        $p['status'] = 2;
                        $orders_res = $orders->update($p);
                    }
                }

                $orders_status = new OrdersStatus();
                $orders_status_info = $orders_status->getByOrdersId($id);
                $res = $orders_status_info->update($parame);

                $parame['orders_id'] = $id;
                $result = (new OrdersStatusLog())->create($parame);
                if ($result) {
                    return response()->json(['status' => true, 'message' => '成功']);
                }
            } else {
                $order_params = [
                    "customer_id" => $parame['customer_id'],
                    "customer_demand_id" => $parame['customer_demand_id'],
                    "product_id" => $parame['product_id'],
                    "start_time" => $parame['start_time'],
                    "end_time" => $parame['end_time'],
                    "admin_user_id" => $parame['admin_user_id'],
                    "price" => $parame['price'],
                    "receivable" => $parame['receivable'],
                    "receipts" => $parame['receipts'],
                    "sales_remark" => $parame['orders_status']['sales_remark'],
                    "it_remark" => $parame['orders_status']['it_remark'] ?? null,
                ];
                if (!empty($file)) {
                    $file_path = (new Upload())->upload($file);
                    $order_params['file_path'] = $file_path;
                }
                $status_params = [
                    "finance_status" => $parame['orders_status']['finance_status'] ?? null,
                    "finance_remark" => $parame['orders_status']['finance_remark'] ?? null,
                    "finance_user_id" => $parame['orders_status']['finance_user_id'] ?? null,
                    "commerce_status" => $parame['orders_status']['commerce_status'] ?? null,
                    "commerce_remark" => $parame['orders_status']['commerce_remark'] ?? null,
                    "commerce_user_id" => $parame['orders_status']['commerce_user_id'] ?? null,
                    "it_status" => $parame['orders_status']['it_status'] ?? null,
                    "it_remark" => $parame['orders_status']['it_remark'] ?? null,
                    "it_user_id" => $parame['orders_status']['it_user_id'] ?? null,
                    "check_status" => $parame['orders_status']['check_status'] ?? null,
                    "check_remark" => $parame['orders_status']['check_remark'] ?? null,
                    "check_user_id" => $parame['orders_status']['check_user_id'] ?? null,
                ];
                if ($status_params['commerce_status'])
                {
                    switch($parame['commerce_status'])
                    {
                        case 1:
                            $status = '资料不完整';
                            break;
                        case 4:
                            $status = '开发完成，待验收';
                            break;
                        default:
                            $status = '技术开发中';
                            break;
                    }
                    $order_info['status'] = $status;
                    $order_info['remark'] = $parame['commerce_remark'];
                }

                if ($status_params['commerce_status'] && $status_params['commerce_status'] == 2) {
                    $order_params['status'] = 1;
                } elseif ($status_params['check_status'] && $status_params['check_status'] == 2) {
                    $order_params['status'] = 2;
                } else {
                    $order_params['status'] = $parame['status'];
                }
                $result = $orders->update($order_params);
                if ($result) {
                    //通过需求ID查找对应的联系人，然后判断联系人有没有绑定微信，如果有，发送消息提醒
                    $customer_contact_demand = (new CustomerContactDemand())->getByDemand($order_params['customer_demand_id']);
                    if ($customer_contact_demand)
                    {
                        $contact = (new CustomerContact())->getById($customer_contact_demand->customer_contact_id);
                        if ($contact)
                        {
                            if ($contact->open_id)
                            {
                                (new MsgController())->sendMsg(env('WECHAT_OFFICIAL_ACCOUNT_APPID'), [], 'status', $contact->open_id, $order_info);
                            }
                        }
                    }
                    // 修改 orders_status
                    $orders_status = new OrdersStatus();
                    $orders_status_info = $orders_status->getByOrdersId($id);
                    if ($orders_status_info) {
                        $res = $orders_status_info->update($status_params);
                    }
                    $status_params['orders_id'] = $id;
                    $status_log = (new OrdersStatusLog())->create($status_params);
                    return redirect(admin_url('/orders'));
                }
            }

        }
    }
}
