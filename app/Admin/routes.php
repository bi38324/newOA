<?php

use App\Admin\Controllers\CardTemplateController;
use App\Admin\Controllers\ChannelController;
use App\Admin\Controllers\CustomerContactCartController;
use App\Admin\Controllers\CustomerContactController;
use App\Admin\Controllers\CustomerController;
use App\Admin\Controllers\CustomerDemandController;
use App\Admin\Controllers\DepartmentController;
use App\Admin\Controllers\OrdersController;
use App\Admin\Controllers\OrdersDetailController;
use App\Admin\Controllers\OrdersLogController;
use App\Admin\Controllers\OrdersStatusController;
use App\Admin\Controllers\OrdersStatusLogController;
use App\Admin\Controllers\ParamsController;
use App\Admin\Controllers\ProductController;
use App\Admin\Controllers\ProductParamsController;
use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');

    // 客户管理
    $router->resource('customers', 'CustomerController');
    // 客户需求管理
    $router->resource('customer-demands', 'CustomerDemandController');
    // 客户联系人表
    $router->resource('customer-contacts', 'CustomerContactController');
    // 名片模板管理
    $router->resource('cart-templates', 'CardTemplateController');
    // 联系人名片管理
    $router->resource('customer-contact-cards', 'CustomerContactCartController');
    // 渠道管理
    $router->resource('channels', 'ChannelController');
    // 部门管理
    $router->resource('departments', 'DepartmentController');
    // 产品管理
    $router->resource('products', 'ProductController');
    // 产品参数管理
    $router->resource('product-params', 'ProductParamsController');
    // 参数管理
    $router->resource('params', 'ParamsController');
    // 收款方式管理
    $router->resource('pay-type', 'PayTypeController');
    // 订单管理
    $router->resource('orders', 'OrdersController');
    // 订单状态管理
    $router->resource('orders-statuses', 'OrdersStatusController');
    // 订单续费管理
    $router->resource('orders-renew-log', 'OrdersRenewLogController');
    // 订单收款管理
    $router->resource('order-payment-log', 'OrderPaymentLogController');

    // 订单详情管理
    $router->resource('orders-details', 'OrdersDetailController');
    // 订单日志
    $router->resource('orders-logs', 'OrdersLogController');
    // 订单状态日志
    $router->resource('orders-status-logs', 'OrdersStatusLogController');
    // 订单代运维信息
    $router->resource('orders-devOps', 'OrdersDevOpsController');


    // 根据客户ID获取客户跟单的接口
    $router->get('/api/getCustomerDemand', 'ApiController@getCustomerDemand');
    // 根据客户ID和销售ID 获取客户联系人的接口
    $router->get('/api/getCustomerContact', 'ApiController@getCustomerContact');

});
