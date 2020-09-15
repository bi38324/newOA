<?php

namespace Encore\Admin\Controllers;

use App\Http\Model\Department;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserController extends AdminController
{
    /**
     * {@inheritdoc}
     */
    protected function title()
    {
        return trans('admin.administrator');
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $userModel = config('admin.database.users_model');

        $grid = new Grid(new $userModel());

        $grid->column('id', 'ID')->sortable();
        $grid->column('username', trans('admin.username'));
        $grid->column('name', trans('员工姓名'));
        $grid->column('roles', trans('admin.roles'))->pluck('name')->label();
        $grid->column('department.title', trans('所属部门'));
        $grid->column('sex', trans('性别'))->using([0 => '男', 1 => '女']);
        $grid->column('birthday', trans('生日'));
        $grid->column('entry_time', trans('入职时间'));

        $grid->actions(function (Grid\Displayers\Actions $actions) {
            if ($actions->getKey() == 1) {
                $actions->disableDelete();
            }
        });
        $grid->disableRowSelector();
        $grid->tools(function (Grid\Tools $tools) {
            $tools->batch(function (Grid\Tools\BatchActions $actions) {
                $actions->disableDelete();
            });
        });
        $grid->disableExport();
        $grid->filter(function($filter){
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            // 在这里添加字段过滤器
            $filter->like('name', '员工姓名');
            $filter->equal('entry_time', '入职时间')->datetime(['format' => 'YYYY年MM月DD日']);
            $filter->like('birthday', '生日')->datetime(['format' => 'MM月']);
            $filter->equal('dept_id', '部门')->select(Department::selectOptions());

        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        $userModel = config('admin.database.users_model');

        $show = new Show($userModel::findOrFail($id));

        $show->field('id', 'ID');
        $show->field('username', trans('admin.username'));
        $show->field('name', trans('真实姓名'));
        $show->field('phone', trans('手机号'));
        $show->field('birthday', __('生日'));
        $show->field('sex', trans('性别'))->using([0 => '男', 1 => '女']);
        $show->field('entry_time', __('入职时间'));
        $show->field('is_job', __('在职状态'))->using([0 => '在职', 1 => '离职']);
        $show->field('roles', trans('admin.roles'))->as(function ($roles) {
            return $roles->pluck('name');
        })->label();
        $show->field('permissions', trans('admin.permissions'))->as(function ($permission) {
            return $permission->pluck('name');
        })->label();
        $show->field('quit_time', __('离职时间'));
        $show->field('avatar', trans('admin.avatar'))->image();
        $show->field('signed', trans('上传签名'))->image();
        $show->panel()
            ->tools(function ($tools) {
                $tools->disableEdit();
                $tools->disableDelete();
            });;
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    public function form()
    {
        $userModel = config('admin.database.users_model');
        $permissionModel = config('admin.database.permissions_model');
        $roleModel = config('admin.database.roles_model');

        $form = new Form(new $userModel());

        $userTable = config('admin.database.users_table');
        $connection = config('admin.database.connection');

        $form->display('id', 'ID');
        $form->text('name', trans('真实姓名'))->rules('required');
        $form->text('phone', trans('手机号'))->rules('required');
        $form->text('username', trans('admin.username'))
            ->creationRules(['required', "unique:{$connection}.{$userTable}"])
            ->updateRules(['required', "unique:{$connection}.{$userTable},username,{{id}}"]);

        $form->password('password', trans('admin.password'))->rules('required|confirmed');
        $form->password('password_confirmation', trans('admin.password_confirmation'))->rules('required')
            ->default(function ($form) {
                return $form->model()->password;
            });

        $form->ignore(['password_confirmation']);
        $form->datetime('entry_time', __('入职时间'))->format('YYYY年MM月DD日')->required();
        $form->select('dept_id', __('所属部门'))->options(Department::selectOptions(null, '请选择'))->required();

        $form->multipleSelect('roles', trans('admin.roles'))->options($roleModel::all()->pluck('name', 'id'));
        $form->multipleSelect('permissions', trans('admin.permissions'))->options($permissionModel::all()->pluck('name', 'id'));
        $form->radio('sex', trans('性别'))->options([0 => '男', 1 => '女']);

        $form->image('avatar', trans('admin.avatar'));
        $form->image('signed', trans('上传签名'));
        $form->datetime('birthday', __('生日'))->format('YYYY年MM月DD日');
        $form->radio('is_job', __('在职状态'))->options([0 => '在职', 1 => '离职']);
        $form->datetime('quit_time', __('离职时间'))->format('YYYY年MM月DD日');

        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = bcrypt($form->password);
            }
        });

        return $form;
    }
}
