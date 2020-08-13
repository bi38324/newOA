<?php

namespace App\Admin\Controllers;

use App\Http\Model\Enroll;
use App\Http\Model\EnrollLog;
use App\Http\Model\Params;
use App\Http\Model\Product;
use App\Http\Model\ProductParams;
use App\Http\Model\RecruitDetail;
use App\Http\Model\Teacher;
use App\Http\Model\TeacherClassPlace;
use App\Http\Model\TeacherMajor;
use App\Libs\Upload;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;

class ProductParamsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '产品参数';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProductParams());

        $grid->column('id', __('ID'));
        $grid->column('product.title', __('产品名称'));
        $grid->column('params.title', __('参数名称'));
        //筛选
        $grid->filter(function ($filter) {
            $filter->disableIdFilter();
            $filter->equal('product_id', '产品名称')->select(Product::selectOptions());
        });
        $grid->actions(function ($actions) {

            // 去掉编辑
            $actions->disableEdit();

            // 去掉查看
            $actions->disableView();
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
        $show = new Show(ProductParams::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('product.title', __('产品名称'));
        $show->field('params.title', __('产品名称'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProductParams());

        $form->select('product_id', __('产品名称'))->options(Product::selectOptions())->required();
        $form->multipleSelect('params_id', __('产品所含参数'))->options(Params::all()->pluck('title','id'))->required();

        return $form;
    }

    //新增保存
    public function store()
    {
        $params = request()->all();
        $validator = Validator::make($params, [
            'product_id' => 'required',
            'params_id' => 'required'
        ]);
        if($validator->fails()) {
            return redirect(admin_url('/product-params/create'))->withErrors($validator);
        } else {
            $params_ids = $params['params_id'];
            unset($params['params_id']);
            if ($params['product_id']) {
                foreach($params_ids as $key => $value)
                {
                    if( !empty($value))
                    {
                        $product_params['product_id'] = $params['product_id'];
                        $product_params['params_id'] = $value;
                        // 判断当前产品的这个参数是否存在
                        $res = (new ProductParams())->getByParams($product_params);
                        if ( empty($res))
                        {
                            $product_params_res =  (new ProductParams())->create($product_params);
                        }
                    }
                }
                return redirect(admin_url('/product-params'));
            } else {
                return redirect(admin_url('/product-params/create'));
            }
        }
    }
}
