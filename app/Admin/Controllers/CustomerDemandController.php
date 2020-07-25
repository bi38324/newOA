<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerContactDemand;
use App\Http\Model\CustomerDemand;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;

class CustomerDemandController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户需求';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerDemand());
        $admin = new Admin();
        $user = $admin->user();
        $grid->column('id', __('ID'));
        $grid->column('customer.title', __('客户名称'));
        $grid->column('demand', __('客户需求'));
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->equal('customer_id', '客户名称')->select(Customer::all()->pluck('title','id'));
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
        $show = new Show(CustomerDemand::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('customer.title', __('客户名称'));
        $show->field('demand', __('客户需求'));
        $show->field('customer_contact.contact', __('联系人'))->as(function (){
            return $this->customer_contact->contact->name;
        });
        $show->field('customer_contact.contact', __('联系人电话'))->as(function (){
            return $this->customer_contact->contact->phone;
        });
        $show->field('created_at', __('提交时间'));
        $show->field('updated_at', __('更新时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @param string $id
     * @return Form
     */
    protected function form($id = '')
    {
        $form = new Form(new CustomerDemand());
        $admin = new Admin();
        $user = $admin->user();
        $customer_id = \request('customer_id');
        if($customer_id || $id){
            $form->select('customer_id', __('客户ID'))->options(Customer::all()->pluck('title', 'id'))->default($customer_id)->readOnly();
        }else{
            if($user->isRole('administrator'))
            {
                $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand');
            } else {
                $form->select('customer_id', __('客户名称'))->options(Customer::select('*')->where('last_user_id', $user->id)->get()->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand');
            }
        }
        $form->textarea('demand', __('客户需求'))->required();
        $form->select('customer_contact.customer_contact_id', __('联系人'))->options(CustomerContact::select('*')->where('customer_id', $customer_id)->get()->pluck('name', 'id'))->required();
        return $form;
    }

    //修改页
    public function edit($id, Content $content)
    {
        return $content
            ->header($this->title)
            ->description('修改')
            ->body($this->form($id)->edit($id));
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'customer_id' => 'required',
            'demand' => 'required',
        ]);
        if($validator->fails()) {
            return redirect(admin_url('/customer-demands/create?customer_id='.$params['customer_id']))->withErrors($validator);
        } else {
            $customer_demand['customer_id'] = $params['customer_id'];
            $customer_demand['demand'] = $params['demand'];
            $demand_result = (new CustomerDemand())->create($customer_demand);
            if ($demand_result)
            {
                $customer_contact['customer_contact_id'] = $params['customer_contact']['customer_contact_id'];
                $customer_contact['customer_id'] = $params['customer_id'];
                $customer_contact['customer_demand_id'] = $demand_result->id;
                $contact_result = (new CustomerContactDemand())->create($customer_contact);
                return redirect(admin_url('/customers/'.$params['customer_id']));
            }
        }
    }

    // 删除
    public function destroy($id)
    {
        $demand_result = (new CustomerDemand())->where('id', $id)->delete();
        if ($demand_result)
        {
            $contact_result = (new CustomerContactDemand())->where('customer_demand_id', $id)->delete();
        }
        return true;
    }
}
