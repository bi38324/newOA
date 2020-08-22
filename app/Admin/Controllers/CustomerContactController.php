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

class CustomerContactController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户联系人管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerContact());
        $admin = new Admin();
        $user = $admin->user();
        if ($user->cannot('customer_manage')) {
            $grid->model()->where('last_user_id', '=', $user->id);
        }
        $grid->column('id', __('Id'));
        $grid->column('customer.title', __('客户名称'));
        $grid->column('name', __('联系人姓名'));
        $grid->column('phone', __('联系电话'));
        $grid->column('is_first', __('是否为第一联系人'))->using([0 => '否', 1 => '是']);
        $grid->column('headImgUrl', __('头像'))->image();
        $grid->column('sex', __('性别'))->using([0 => '男', 1 => '女']);

        $grid->actions(function ($actions) {

            // 去掉删除
            $actions->disableDelete();

            // 去掉编辑
            $actions->disableEdit();
        });

        $grid->disableRowSelector();

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
        $show = new Show(CustomerContact::findOrFail($id));

        $show->field('customer.title', __('客户名称'));
        $show->field('name', __('联系人姓名'));
        $show->field('phone', __('联系电话'));
        $show->field('is_first', __('是否为第一联系人'))->using([0 => '否', 1 => '是']);
        $show->field('headImgUrl', __('头像'))->image();
        $show->field('sex', __('性别'))->using([0 => '男', 1 => '女']);

        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });
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
        $form = new Form(new CustomerContact());
        $admin = new Admin();
        $user = $admin->user();
        $customer_id = \request('customer_id');
        if ($user->can('administrator') || $user->can('customer_manage')) {
            $user_id = '';
        } else {
            $user_id = $user->id;
        }
        if ($id || $customer_id)
        {
            $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->default($customer_id)->required()->readOnly();
        } else {
            $form->select('customer_id', __('客户名称'))->options(Customer::all()->pluck('title', 'id'))->required()->load('customer_demand_id', '/admin/api/getCustomerDemand?last_user_id='.$user_id);
        }
        $form->text('name', __('联系人姓名'))->required();
        $form->text('phone', __('联系电话'))->required();
        $form->radio('is_first', __('是否为第一联系人'))->options([0 => '否', 1 => '是'])->required();
        $form->radio('sex', __('性别'))->options([0 => '男', 1 => '女'])->required();
        $form->select('owner_user_id', __('所属销售'))->options(AdminUsers::all()->pluck('name','id'))->readOnly()->default($user->id);
//        if ($user->can('customer_manage'))
//        {
//            $form->select('last_user_id', __('跟进销售'))->options(AdminUsers::all()->pluck('name','id'))->default($user->id);
//        } else {
            $form->select('last_user_id', __('跟进销售'))->options(AdminUsers::all()->pluck('name','id'))->readOnly()->default($user->id);
//        }

        return $form;
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'customer_id' => 'required',
            'name' => 'required',
            'phone' => 'required',
            'is_first' => 'required',
            'sex' => 'required',
        ]);
        if($validator->fails()) {
            return redirect(admin_url('/customer-contacts/create?customer_id='.$params['customer_id']))->withErrors($validator);
        } else {
//            // 查询当前联系人是否已经存在
//            $customer_contact = (new CustomerContact())->getByName($params['customer_id'], $params['name'], $params['phone']);
//            if ($customer_contact)
//            {
//                // 判断近两个月有没有新增需求
//                $customer_contact->id;
//            }
            $demand_result = (new CustomerContact())->create($params);
            return redirect(admin_url('/customers/'.$params['customer_id']));
        }
    }

    public function update($id)
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'customer_id' => 'required',
            'name' => 'required',
            'phone' => 'required',
            'is_first' => 'required',
            'sex' => 'required',
        ]);
        if($validator->fails()) {
            return redirect(admin_url('/customer-contacts/update?customer_id='.$params['customer_id']))->withErrors($validator);
        } else {
            $contanct = (new CustomerContact())->where('id', $id)->firstOrFail();
            if ($contanct)
            {
                $res = $contanct->update($params);
            }
            return redirect(admin_url('/customers/'.$params['customer_id']));
        }
    }

    // 删除
    public function destroy($id)
    {
        $demand_result = (new CustomerContact())->where('id', $id)->delete();
        if ($demand_result)
        {
            $contact_result = (new CustomerContactDemand())->where('customer_contact_id', $id)->delete();
        }
        return true;
    }
}
