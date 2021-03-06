<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('公司名称');
            $table->tinyInteger('type')->comment('客户类型 0：个人 1：企业')->default(0);
            $table->string('address')->comment('公司地址')->nullable();
            $table->tinyInteger('is_agent')->comment('是否代理 0：否 1：是')->default(0);
            $table->integer('channel_id')->comment('客户来源')->nullable();
            $table->integer('industry_id')->comment('所属行业ID')->nullable();
            $table->string('website')->comment('网址')->nullable();
            $table->longText('remark')->comment('备注')->nullable();
            $table->integer('owner_user_id')->comment('所属销售')->nullable(false)->default(1);
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `customer` comment '客户管理表'");

        Schema::create('customer_demand', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('customer_id')->comment('客户ID');
            $table->longText('demand')->comment('客户需求');
            $table->integer('owner_user_id')->comment('所属销售')->nullable(false)->default(1);
            $table->integer('last_user_id')->comment('最近跟进销售')->nullable(false)->default(1);
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `customer_demand` comment '客户需求表'");

        Schema::create('customer_contact', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('customer_id')->comment('客户ID');
            $table->string('name')->comment('联系人名称');
            $table->string('phone')->comment('联系电话');
            $table->tinyInteger('is_first')->comment('是否是第一联系人 0：否 1：是')->default(0);
            $table->string('open_id')->comment('微信openId')->nullable();
            $table->string('headImgUrl')->comment('头像')->nullable();
            $table->tinyInteger('sex')->comment('性别');
            $table->integer('owner_user_id')->comment('所属销售')->nullable(false)->default(1);
            $table->integer('last_user_id')->comment('最近跟进销售')->nullable(false)->default(1);
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `customer_contact` comment '客户联系人表'");

        Schema::create('customer_contact_demand', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('customer_id')->comment('客户ID');
            $table->integer('customer_demand_id')->comment('需求ID');
            $table->integer('customer_contact_id')->comment('联系人ID');
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `customer_contact_demand` comment '客户联系人需求关联中间表'");

        Schema::create('card_template', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('模板标题');
            $table->string('img_path')->comment('模板图片地址');
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `card_template` comment '名片模板表'");

        Schema::create('customer_contact_card', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('customer_contact_id')->comment('联系人ID');
            $table->integer('card_template_id')->comment('名片模板ID');
            $table->string('img_path')->comment('背景图地址');
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `customer_contact_card` comment '联系人名片表'");

        Schema::create('channel', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('渠道标题');
            $table->integer('PID')->comment('父级ID')->default(0);
            $table->integer('sort')->comment('排序')->default(1);
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `channel` comment '渠道管理'");

        Schema::create('department', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('部门名称');
            $table->integer('PID')->comment('父级ID')->default(0);
            $table->integer('sort')->comment('排序')->default(1);
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `department` comment '部门管理'");

        Schema::create('product', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment( '产品名称');
            $table->integer('PID')->comment('父级ID')->default(0);
            $table->integer('sort')->comment('排序')->default(1);
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `product` comment '产品管理'");

        Schema::create('product_params', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('product_id')->comment('产品ID');
            $table->integer('params_id')->comment('产品参数ID');
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `product_params` comment '产品参数管理'");

        Schema::create('params', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('参数标题');
            $table->string('alias')->comment('参数别名（英文字母）');
            $table->tinyInteger('type')->comment('参数类型 0：text 1：textarea 2：select');
            $table->longText('type_params')->comment('当type = 2 时，填写select的内容，以英文逗号分隔')->nullable();
            $table->integer('sort')->comment('排序')->default(1);
            $table->tinyInteger('is_required')->comment('是否必填 0：否 1：是')->default(1);
            $table->string('remark')->comment('备注')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `params` comment '参数管理'");

        Schema::create('orders', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('order_code')->comment('订单号');
            $table->integer('customer_id')->comment('客户ID');
            $table->string('customer_title')->comment('客户名称');
            $table->integer('customer_demand_id')->comment('客户需求ID');
            $table->integer('product_id')->comment('产品ID');
            $table->timestamp('start_time')->comment('开通时间');
            $table->timestamp('end_time')->comment('结束时间');
            $table->integer('admin_user_id')->comment('所属销售');
            $table->decimal('price')->comment('销售金额')->nullable();
            $table->decimal('receivable')->comment('应收金额')->nullable();
            $table->decimal('receipts')->comment('实收金额')->nullable();
            $table->longText('sales_remark')->comment('销售备注')->nullable();
            $table->longText('it_remark')->comment('技术备注')->nullable();
            $table->string('file_path')->comment('附件地址')->nullable();
            $table->string('contract_path')->comment('合同地址')->nullable();
            $table->integer('last_user_id')->comment('最近跟进销售')->nullable(false)->default(1);
            $table->tinyInteger('status')->comment('订单状态 0：待开发 1：开发中 2:开发完成 3：已交付')->default(0);
            $table->tinyInteger('service_status')->comment('服务状态 0：服务未开始 1：服务中 2：服务到期')->default(0);

            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `orders` comment '订单管理'");

        Schema::create('orders_renew_log', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('订单ID');
            $table->integer('product_id')->comment('产品ID');
            $table->timestamp('start_time')->comment('开通时间')->nullable(true);
            $table->timestamp('old_end_time')->comment('上次到期时间')->nullable(true);
            $table->timestamp('end_time')->comment('当前结束时间');
            $table->decimal('receivable')->comment('应收金额');
            $table->decimal('receipts')->comment('实收金额')->nullable(true);
            $table->decimal('arrears')->comment('未收金额')->nullable(true);
            $table->tinyInteger('is_renew')->comment('是否续费 0：首次  1：续费')->nullable(true)->default(0);
            $table->tinyInteger('is_tax')->comment('是否含税  0：不含税  1：含税')->nullable(true)->default(0);
            $table->integer('owner_user_id')->comment('提交人')->nullable(false)->default(1);
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `orders_renew_log` comment '服务续费记录'");

        Schema::create('pay_type', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('支付方式');
            $table->string('number')->comment('支付账号');
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `pay_type` comment '付款方式管理'");

        Schema::create('order_payment_log', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_renew_log_id')->comment('续费ID');
            $table->decimal('receivable')->comment('应收金额');
            $table->decimal('old_receipts')->comment('上次收款金额')->nullable(true);
            $table->decimal('receipts')->comment('本次收款金额')->nullable(true);
            $table->decimal('arrears')->comment('未收金额')->nullable(true);
            $table->integer('pay_type_id')->comment('支付方式ID')->nullable(true);
            $table->timestamp('pay_time')->comment('支付时间')->nullable(true);
            $table->integer('admin_user_id')->comment('操作人')->nullable(false)->default(1);
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `order_payment_log` comment '缴费记录'");

        Schema::create('orders_status', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('客户ID');
            $table->tinyInteger('customer_status')->comment('客户状态 0：待处理  1:确认需求无误')->nullable()->default(0);
            $table->integer('customer_contact_id')->comment('客户联系人ID')->nullable()->default(0);
            $table->tinyInteger('finance_status')->comment('财务认证 0：待处理  1:未收到款  2: 收到部分款  3：收到全款')->nullable()->default(0);
            $table->string('finance_remark')->comment('财务备注')->nullable();
            $table->integer('finance_user_id')->comment('财务审批人')->nullable();
            $table->tinyInteger('commerce_status')->comment('商务部认证 0：待处理  1：资料不完整 2：开发中 3：申请技术协助 4:开发完成')->nullable()->default(0);
            $table->string('commerce_remark')->comment('商务部备注')->nullable();
            $table->integer('commerce_user_id')->comment('商务部操作人ID')->nullable();
            $table->tinyInteger('it_status')->comment('技术认证 0：待处理 1：处理中 2：处理完成')->nullable()->default(0);
            $table->string('it_remark')->comment('技术备注')->nullable();
            $table->integer('it_user_id')->comment('技术操作人ID')->nullable();
            $table->tinyInteger('check_status')->comment('验收认证 0：待处理 1：不合格 2：验收通过')->nullable()->default(0);
            $table->string('check_remark')->comment('验收人备注')->nullable();
            $table->integer('check_user_id')->comment('验收操作人ID')->nullable();
            $table->tinyInteger('customer_check_status')->comment('客户验收状态 0：待处理 1：修改问题 2：确认交付')->nullable()->default(0);
            $table->string('customer_check_remark')->comment('客户验收人备注')->nullable();
            $table->integer('customer_check_contact_id')->comment('客户验收人ID')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `orders` comment '订单管理'");

        Schema::create('orders_status_log', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('订单ID');
            $table->tinyInteger('finance_status')->comment('财务认证 0：待处理  1:未收到款  2: 已收到款')->nullable();
            $table->string('finance_remark')->comment('财务备注')->nullable();
            $table->integer('finance_user_id')->comment('财务审批人')->nullable();
            $table->tinyInteger('commerce_status')->comment('商务部认证 0：待处理  1：资料不完整 2：开发中 3：申请技术协助 4:开发完成')->nullable();
            $table->string('commerce_remark')->comment('商务部备注')->nullable();
            $table->longText('commerce_result')->comment('成果展示')->nullable();
            $table->integer('commerce_user_id')->comment('商务部操作人ID')->nullable();
            $table->tinyInteger('it_status')->comment('技术认证 0：待处理 1：处理中 2：处理完成')->nullable();
            $table->string('it_remark')->comment('技术备注')->nullable();
            $table->integer('it_user_id')->comment('技术操作人ID')->nullable();
            $table->tinyInteger('check_status')->comment('验收认证 0：待处理 1：不合格 2：验收通过')->nullable();
            $table->string('check_remark')->comment('验收人备注')->nullable();
            $table->integer('check_user_id')->comment('验收操作人ID')->nullable();
            $table->tinyInteger('customer_check_status')->comment('客户验收状态 0：待处理 1：修改问题 2：确认交付')->nullable()->default(0);
            $table->longText('customer_check_remark')->comment('客户验收人备注')->nullable();
            $table->integer('customer_check_contact_id')->comment('客户验收人ID')->nullable();
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `orders_status_log` comment '订单状态日志表'");

        Schema::create('orders_detail', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('订单ID');
            $table->integer('params_id')->comment('产品参数ID');
            $table->string('value')->comment('参数值');
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `orders_detail` comment '订单详情表'");

        Schema::create('orders_log', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('订单ID');
            $table->integer('params_id')->comment('产品参数ID')->nullable();
            $table->string('value')->comment('参数值')->nullable();
            $table->tinyInteger('status')->comment('订单状态 0：待开发 1：开发中 2:开发完成 3：已交付 4：已关闭')->default(0);
            $table->integer('admin_user_id')->comment('操作人ID');
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `orders_log` comment '订单修改日志表'");

        Schema::create('orders_devOps', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('订单ID');
            $table->longText('domain')->comment('域名管理权限')->nullable();
            $table->longText('host')->comment('主机管理权限')->nullable();
            $table->longText('website')->comment('网站后台管理权限')->nullable();
            $table->integer('admin_user_id')->comment('操作人ID');
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `orders_devOps` comment '技术外包订单代运维信息表'");

        Schema::create('orders_check_log', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('订单ID');
            $table->longText('content')->comment('验收的内容')->nullable();
            $table->longText('fix_remark')->comment('操作人备注')->nullable();
            $table->integer('admin_user_id')->comment('操作人ID');
            $table->tinyInteger('customer_check_status')->comment('客户验收状态 0：待处理 1：修改问题 2：确认交付')->nullable()->default(0);
            $table->string('customer_check_remark')->comment('客户验收人备注')->nullable();
            $table->integer('customer_check_contact_id')->comment('客户验收人ID')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `orders_check_log` comment '技术外包订单验收记录表'");

        Schema::create('orders_service_report', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('orders_id')->comment('订单ID');
            $table->string('report_url')->comment('服务报告地址')->nullable();
            $table->integer('admin_user_id')->comment('操作人ID');
            $table->timestamps();
            $table->softDeletes();
        });
        DB::statement("ALTER TABLE `orders_service_report` comment '订单服务报告管理表'");

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer');
        Schema::dropIfExists('customer_demand');
        Schema::dropIfExists('customer_contact');
        Schema::dropIfExists('customer_contact_demand');
        Schema::dropIfExists('card_template');
        Schema::dropIfExists('customer_contact_card');
        Schema::dropIfExists('channel');
        Schema::dropIfExists('department');
        Schema::dropIfExists('product');
        Schema::dropIfExists('product_params');
        Schema::dropIfExists('params');
        Schema::dropIfExists('orders');
        Schema::dropIfExists('orders_renew_log');
        Schema::dropIfExists('pay_type');
        Schema::dropIfExists('order_payment_log');
        Schema::dropIfExists('orders_status');
        Schema::dropIfExists('orders_detail');
        Schema::dropIfExists('orders_log');
        Schema::dropIfExists('orders_status_log');
        Schema::dropIfExists('orders_devOps');
        Schema::dropIfExists('orders_check_log');
        Schema::dropIfExists('orders_service_report');
    }
}
