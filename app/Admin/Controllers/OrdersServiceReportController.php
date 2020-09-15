<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Orders;
use App\Http\Model\OrdersServiceReport;
use App\Libs\Upload;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class OrdersServiceReportController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '代运维信息表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new OrdersServiceReport());



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
        $show = new Show(OrdersServiceReport::findOrFail($id));



        return $show;
    }

    public function edit($id, content $content)
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
        $form = new Form(new OrdersServiceReport());
        $admin = new Admin();
        $user = $admin->user();
        if ($id)
        {
            $form->text('orders_id', __('订单ID'))->readonly();
            $orders_report = (new OrdersServiceReport())->getById($id);
            if ($orders_report)
            {
                $orders = (new Orders())->getById($orders_report->orders_id);
                if ($orders)
                {
                    $order_code = $orders[0]['order_code'];
                } else {
                    $order_code = '';
                }
            } else {
                $order_code = '';
            }
            $form->text('orders_code', __('订单号'))->default($order_code)->readonly();
        } else {
            $orders_id = \request('orders_id');
            $orders_info = (new Orders())->getById($orders_id);
            $form->text('orders_id', __('订单ID'))->default($orders_id)->readonly();
            $form->text('orders_code', __('订单号'))->default($orders_info[0]['order_code'])->readonly();
        }
        $form->file('report_url', __('上传服务报告'));
        $form->select('admin_user_id', __('提交人'))->options(AdminUsers::all()->pluck('name', 'id'))->readOnly()->default($user->id);

        return $form;
    }

    public function store()
    {
        $params = request()->all();
        unset($params['orders_code']);
        $file = request()->file('report_url');
        if(!empty($file))  {
            $file_path = (new Upload())->upload($file);
            $params['report_url'] = $file_path;
        }
        $result = (new OrdersServiceReport())->create($params);
        return redirect(admin_url('/orders/'.$params['orders_id']));
    }

    public function update($id)
    {
        $params = request()->all();
        unset($params['orders_code']);
        $orders_report = (new OrdersServiceReport())->where('id', $id)->findOrFail();
        if ($orders_report)
        {
            $file = request()->file('report_url');
            if(!empty($file))  {
                $file_path = (new Upload())->upload($file);
                $params['report_url'] = $file_path;
            }
            $result = $orders_report->update($params);
        }
        return redirect(admin_url('/orders/'.$id));
    }
}
