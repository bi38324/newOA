<?php

namespace App\Admin\Controllers;

use App\Http\Model\AdminUsers;
use App\Http\Model\Channel;
use App\Http\Model\Customer;
use App\Http\Model\CustomerContact;
use App\Http\Model\CustomerContactDemand;
use App\Http\Model\CustomerDemand;
use App\Http\Model\Industry;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '客户管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Customer());
        $admin = new Admin();
        $user = $admin->user();
        if($user->isRole('sales'))
        {
            $grid->model()->where('owner_user_id', '=', $user->id);
        }
        $grid->column('id', __('客户ID'));
        $grid->column('title', __('公司名称'));
        $grid->column('address', __('公司地址'));
        $grid->column('is_agent', __('是否代理'))->using([0 => '否', 1 => '是']);
        $grid->column('channel.title', __('客户来源'));
        $grid->column('industry.IndustryName', __('所属行业'));
        $grid->column('owner_user.name', __('所属销售'));
        //筛选
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->like('title', '客户名称');
            $filter->equal('owner_user_id', '所属销售')->select(AdminUsers::all()->pluck('name','id'));
        });
        $grid->disableRowSelector();
        $grid->actions(function ($actions) {

            // 去掉删除
            $actions->disableDelete();
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
        $show = new Show(Customer::findOrFail($id));
        $show->field('id', __('客户ID'));
        $show->field('title', __('公司名称'));
        $show->field('type', __('客户类型'))->using([0 => '个人', 1 => '企业']);
        $show->field('address', __('公司地址'));
        $show->field('is_agent', __('是否代理'))->using([0 => '否', 1 => '是']);
        $show->field('channel.title', __('客户来源'));
        $show->field('industry.IndustryName', __('所属行业'));
        $show->field('remark', __('备注'));
        $show->field('owner_user.name', __('所属销售'));

        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;

        $show->customer_demand('客户需求管理', function ($account) use ($id) {
            $account->resource('/admin/customer-demands');
            $account->column('id', 'ID');
            $account->column('customer.title', __('客户名称'));
            $account->column('demand', __('客户需求'));
            $account->column('customer_contact.contact', __('联系人'));
            $account->disableRowSelector();
            $account->disableColumnSelector();
            $account->disableExport();
            $account->disableFilter();
            $account->perPages([5, 10, 20, 30, 50,100]);
            $account->paginate(5);
        });

        $show->customer_contact('联系人管理', function ($account) use ($id) {
            $account->resource('/admin/customer-contacts');
            $account->column('id', 'ID');
            $account->column('name', '联系人姓名');
            $account->column('phone', '联系人电话');
            $account->column('is_first', __('是否为第一联系人'))->using([0 => '否', 1 => '是']);
            $account->column('headImgUrl', __('头像'))->image();
            $account->column('sex', __('性别'))->using([0 => '男', 1 => '女']);
            $account->disableRowSelector();
            $account->disableColumnSelector();
//            $account->disableCreateButton();
            $account->disableExport();
            $account->disableFilter();
            $account->perPages([5, 10, 20, 30, 50,100]);
            $account->paginate(5);
//            $account->actions(function($action) {
//                $action->disableView();
//                $action->disableDelete();
//            });
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
        $form = new Form(new Customer());

        $admin = new Admin();
        $user = $admin->user();

        $form->text('title', __('客户名称'))->required();
        $form->radio('type', __('客户类型'))->options([0 => '个人', 1 => '企业'])->required()->default(1);
        $form->text('address', __('公司地址'));
        $form->radio('is_agent', __('是否代理'))->options([0 => '否', 1 => '是']);
        $form->select('channel_id', __('客户来源'))->options(Channel::selectOptions());
        $form->select('industry_id', __('所属行业'))->options(Industry::selectOptions());
        $form->textarea('remark', __('备注'));
        $form->select('owner_user_id', __('所属销售'))->options(AdminUsers::all()->pluck('name','id'))->readOnly()->default($user->id);
        return $form;
    }

    // 删除
    public function destroy($id)
    {
        $result = (new Customer())->where('id', $id)->delete();
        if ($result)
        {
            $contact_demand_result = (new CustomerContactDemand())->where('customer_id', $id)->delete();
            $contact_result = (new CustomerContact())->where('customer_id', $id)->delete();
            $demand_result = (new CustomerDemand())->where('customer_id', $id)->delete();
        }
        return true;
    }
}
