<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Customer;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerContactDemand;
use App\Http\Model\CustomerDemand;
use App\Http\Model\Orders;
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
        if ($user->cannot('customer_manage')) {
            $grid->model()->where('last_user_id', '=', $user->id);
        }
        $grid->column('id', __('ID'));
        $grid->column('customer.title', __('客户名称'));
        $grid->column('demand', __('客户需求'));
        $grid->column('owner_user.name', __('所属销售'));
        $grid->column('last_user.name', __('跟进销售'));
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->equal('customer_id', '客户名称')->select(Customer::all()->pluck('title','id'));
            $filter->equal('owner_user_id', '所属销售')->select(AdminUsers::all()->pluck('name','id'));
            $filter->equal('last_user_id', '跟进销售')->select(AdminUsers::all()->pluck('name','id'));
        });
        if ($user->cannot('customer_manage')) {
            $grid->actions(function ($actions) {

                // 去掉删除
                $actions->disableDelete();

                // 去掉编辑
                $actions->disableEdit();
            });
            $grid->disableRowSelector();
        } else {
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
        $show = new Show(CustomerDemand::findOrFail($id));
        $admin = new Admin();
        $user = $admin->user();
        $show->field('id', __('ID'));
        $show->field('customer.title', __('客户名称'));
        $show->field('demand', __('客户需求'));
        $show->field('customer_name', __('联系人'))->as(function (){
            $customer_name = "";
            $customer_contact = (new CustomerContact())->getById($this->customer_contact->customer_contact_id);
            if ($customer_contact)
            {
                $customer_name = $customer_contact->name;
            }
            return $customer_name;
        });
        $show->field('customer_phone', __('联系电话'))->as(function (){
            $customer_phone = "";
            $customer_contact = (new CustomerContact())->getById($this->customer_contact->customer_contact_id);
            if ($customer_contact)
            {
                $customer_phone = $customer_contact->phone;
            }
            return $customer_phone;
        });
        $show->field('owner_user.name', __('所属销售'));
        $show->field('last_user.name', __('跟进销售'));
        $show->field('created_at', __('提交时间'));
        $show->field('updated_at', __('更新时间'));
        if ($user->cannot('administrator') || $user->cannot('customer_manage')) {
            $show->panel()
                ->tools(function ($tools) {
                    $tools->disableList();
                });;
        }
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
        $customer_id = '';
        if ($user->cannot('customer_manage')) {
            $user_id = $user->id;
        } else {
            $user_id = '';
        }
        if($id){
            $customer_demand_info = (new CustomerDemand())->getById($id);
            $customer_id = $customer_demand_info[0]['customer_id'];
            $form->select('customer_id', __('客户ID'))->options(Customer::all()->pluck('title', 'id'))->default($customer_id)->readOnly();

        }else{
            $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->required()->load('customer_contact.customer_contact_id', '/admin/api/getCustomerContact?last_user_id='.$user_id);
        }
        if ($user->cannot('customer_manage')) {
            $form->select('customer_contact.customer_contact_id', __('联系人'))->options(CustomerContact::select('*')->where('customer_id', $customer_id)->where('last_user_id', $user_id)->get()->pluck('name', 'id'))->required();
        } else {
            $form->select('customer_contact.customer_contact_id', __('联系人'))->options(CustomerContact::select('*')->where('customer_id', $customer_id)->get()->pluck('name', 'id'))->required();
        }
        $form->textarea('demand', __('客户需求'))->required();

        $form->select('owner_user_id', __('所属销售'))->options(AdminUsers::all()->pluck('name','id'))->readOnly()->default($user->id);

        if($user->cannot('customer_manage'))
        {
            $form->select('last_user_id', __('跟进销售'))->options(AdminUsers::all()->pluck('name','id'))->readOnly()->default($user->id);
        } else {
            $form->select('last_user_id', __('跟进销售'))->options(AdminUsers::all()->pluck('name','id'))->default($user->id);

        }

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
            $customer_demand['owner_user_id'] = $params['owner_user_id'];
            $customer_demand['last_user_id'] = $params['last_user_id'];
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

    //修改保存
    public function update($id)
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'customer_id' => 'required',
            'demand' => 'required',
        ]);
        if($validator->fails()) {
            return redirect(admin_url('/customer-demands/create?customer_id='.$params['customer_id']))->withErrors($validator);
        } else {
            $demand = (new CustomerDemand())->where('id', $id)->firstOrFail();
            if ($demand)
            {
                $customer_demand['customer_id'] = $params['customer_id'];
                $customer_demand['demand'] = $params['demand'];
                $customer_demand['owner_user_id'] = $params['owner_user_id'];
                $customer_demand['last_user_id'] = $params['last_user_id'];
                $result = $demand->update($customer_demand);
                if ($result)
                {
                    // 修改联系人管理中的最近跟进人
                    $contact_id = (new CustomerContactDemand())->getByDemand($id);
                    if ($contact_id)
                    {
                        $customer_contact['customer_contact_id'] = $params['customer_contact']['customer_contact_id'];
                        $customer_contact['customer_id'] = $params['customer_id'];
                        $customer_contact['customer_demand_id'] = $id;
                        $re = $contact_id->update($customer_contact);
                        if ($re)
                        {
                            $contact = (new CustomerContact())->getById($contact_id['customer_contact_id']);
                            if ($contact)
                            {
                                $res = $contact->update(['last_user_id' => $params['last_user_id']]);
                            }
                            // 修改对应订单的最近跟进人
                            $order_list = (new Orders())->getByCustomerDemandId($id);
                            $ids = [];
                            if ($order_list)
                            {
                                foreach ($order_list as $value)
                                {
                                    $ids[] = $value['id'];
                                }
                                $orders_res = (new Orders())->updateByIds($ids, 'last_user_id', $params['last_user_id']);
                            }
                        }
                    }
                }
            }
            return redirect(admin_url('/customers/'.$params['customer_id']));
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
