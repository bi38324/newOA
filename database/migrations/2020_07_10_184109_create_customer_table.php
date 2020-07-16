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
            $table->id();
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `customer` comment '客户管理表'");

        Schema::create('channel', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('渠道标题');
            $table->integer('PID')->comment('父级ID')->default(0);
            $table->integer('sort')->comment('排序')->default(1);
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `channel` comment '渠道管理'");

        Schema::create('department', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment('部门名称');
            $table->integer('PID')->comment('父级ID')->default(0);
            $table->integer('sort')->comment('排序')->default(1);
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `department` comment '部门管理'");

        Schema::create('product', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->string('title')->comment( '产品名称');
            $table->integer('PID')->comment('父级ID')->default(0);
            $table->integer('sort')->comment('排序')->default(1);
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `product_category` comment '产品管理'");

        Schema::create('product_params', function (Blueprint $table) {
            $table->increments('id')->comment('主键id');
            $table->integer('product_id')->comment('产品ID');
            $table->string('title')->comment('参数标题');
            $table->string('alias')->comment('参数别名（英文字母）');
            $table->tinyInteger('type')->comment('参数类型 0：text 1：textarea 2：select');
            $table->integer('sort')->comment('排序')->default(1);
            $table->timestamps();
        });
        DB::statement("ALTER TABLE `product_params` comment '产品参数管理'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer');
    }
}
