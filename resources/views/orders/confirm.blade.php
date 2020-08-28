<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="{{ URL::asset('css/bootstrap-4.3.1.min.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('css/bootstrap-3.3.7.min.css') }}">
    <script src="{{ URL::asset('js/popper-1.15.0-umd.min.js') }}"></script>
    <script src="{{ URL::asset('js/bootstrap-4.3.1.min.js') }}"></script>
    <script src="{{ URL::asset('js/jquery-2.1.1.min.js') }}"></script>
    <script src="{{ URL::asset('js/bootstrap-3.3.7.min.js') }}"></script>
    <title>需求确认</title>
</head>
<style>
    .bg-dark {
        background-color: #343a40 !important;
        font-size: 1.6rem;
    }

    .logo {
        width: 10rem;
    }

    .logo img {
        width: 100%;
        height: 100%;
        margin-left: 2rem;
    }

    .navbar-dark .navbar-nav .active>.nav-link,
    .navbar-dark .navbar-nav .nav-link.active,
    .navbar-dark .navbar-nav .nav-link.show,
    .navbar-dark .navbar-nav .show>.nav-link {
        color: #fff;
    }

    label {
        cursor: default;
    }

    .form-group {
        display: flex;
        flex-direction: row;
        justify-content: center;
    }

    .col-lg-6 {
        margin: auto;
    }

    label {
        display: inline-block;
        margin-bottom: .5rem;
        margin-top: .7rem;
        font-size: 1.4rem;
    }

    .container {
        margin: auto !important;
    }

    .container #title {
        text-align: center;
        margin-bottom: 5rem;
    }

    .form-group .box {
        margin: auto;
        /* margin-left: 5rem; */
        /* border: 0.1rem solid #999999; */
    }

    .form-control {
        width: 50%;
        margin-left: 2rem;
        /* border: none; */
    }

    .picture {
        border-radius: 10px;
        width: 8rem;
        padding: 0;
        height: 4rem;
        /* background: #9cd8b1; */
        margin-top: 3rem;
        /* margin-left: 1rem; */
        font-size: 1.6rem;
    }

    button {
        margin: auto;
        border: none;
        background-color: transparent;
        outline: none !important;
        margin: auto;
    }

    /* 模态框 */
    .modal-dialog {
        /*    display: flex;
        align-items: center;
        justify-content: center; */
        margin-top: 10rem;
    }

    .modal-body {
        display: flex;
        margin: auto;
    }

    .input-text {
        width: 60%;
    }
</style>

<body class="need">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">

    <ul class="navbar-nav mr-auto">
        <li class="nav-item active logo">
            <img src="{{ URL::asset('img/logo_zg.png') }}" alt="">
        </li>
    </ul>
</nav>
<div class="container">
    <h3 id="title">需求单确认</h3>
    <form>
        <!--第一行-->
        <div class="row">
            <div class="col-lg-6 col-md-12">
                <!--左边-->
                <input hidden="hidden" id="order_id" value="{{ $order['info']['id'] }}"/>
                <input hidden="hidden" id="customer_contact_id" value="{{ $user['customer_contact_id'] }}"/>
                <div class="form-group">
                    <label>公司名称：</label>
                    <span class="form-control">{{ $order['info']['customer_title'] }}</span></label>
                </div>

                <div class="form-group">
                    <label>产品名称：</label>
                    <span class="form-control">{{ $order['info']['product_title'] }}</span></label>
                </div>
                @if($order['detail'])
                    @foreach ($order['detail'] as $key => $value)
                        <div class="form-group">
                            <label>{{ $key }}：</label>
                            <span class="form-control">{{ $value }}</span></label>
                        </div>
                    @endforeach
                    @endif

                <div class="form-group">
                    <label>需求确认单附件地址：</label>
                    <a href="{{ $order['info']['file_url'] }}" target="_blank">{{ $order['info']['file_path'] }}</a>
                </div>
                <div class="form-group">
                    <label>开始时间：</label>
                    <span class="form-control">{{ $order['info']['start_time'] }}</span></label>
                </div>
                <div class="form-group">
                    <label>结束时间：</label>
                    <span class="form-control">{{ $order['info']['end_time'] }}</span></label>
                </div>

                <div class="form-group">
                    <label>销售金额：</label>
                    <span class="form-control">{{ $order['info']['price'] }}</span></label>
                </div>
                <div class="form-group">
                    <label>实收金额：</label>
                    <span class="form-control">{{ $order['info']['receipts'] }}</span></label>
                </div>
                <div class="form-group">
                    <label>订单状态：</label>
                    @switch($order['info']['status'])
                        @case(0)
                        <span class="form-control">待开发</span></label>
                        @break
                        @case(1)
                        <span class="form-control">开发中</span></label>
                        @break
                        @case(2)
                        <span class="form-control">开发完成</span></label>
                        @break
                        @case(3)
                        <span class="form-control">已交付</span></label>
                        @break
                    @endswitch
                </div>
                <div class="form-group">
                    <label>跟进销售：</label>
                    <span class="form-control">{{ $order['info']['last_user'] }}</span></label>
                </div>
            </div>
        </div>

        <!--第二行-->
        <div class="row">
            <div class="col-12">
                <div class="form-group">
                    <div class="box">
                        @switch($order['info']['customer_status'])
                            @case(0)
                            <button type="button" class="picture btn btn-default" onclick="agreen(0)">取消</button>
                            @switch ($user['is_band'])
                                    @case(0)
                                    <button type="button" class="picture btn btn-primary" data-toggle="modal"
                                            data-target="#myModal">确定</button>
                                    @break
                                    @case(1)
                                    <button type="button" class="picture btn btn-primary" data-toggle="modal"
                                            onclick="agreen(1)">确定</button>
                                    @break
                                @endswitch
                            @break
                            @case(1)
                                <button type="button" class="picture btn btn-primary" data-toggle="modal" disabled="disabled">已确定</button>
                            @break
                        @endswitch
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


<!--模态框开始 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!-- 关闭按钮 -->
                <!--  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button> -->
                <h4 class="modal-title" id="myModalLabel">
                    请您绑定您的手机号码
                </h4>
            </div>
            <div class="modal-body">
                <label>公司名称：</label>
                <input type="text" class="form-control input-text" id="company" placeholder="请输入您的公司名称">
            </div>
            <div class="modal-body">
                <label>手机号码：</label>
                <input type="text" class="form-control input-text" id="phone" placeholder="请输入您的电话号码">
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
                <button type="button" class="picture btn btn-primary" id="butn">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- 模态框结束 -->
</body>
<script>
    var butn = document.getElementById("butn");
    var companyName = document.getElementById("company");
    var phoneNumber = document.getElementById("phone");
    var order_id = document.getElementById("order_id").value;
    var customer_contact_id = document.getElementById("customer_contact_id").value;

    // 绑定手机号
    butn.onclick = function () {
        var customer_name = companyName.value;
        var phone = phoneNumber.value;
        var url = '/bindPhone';
        $.ajax({
            type:'POST',
            url:url,
            dataType: 'json',
            data:{
                'phone': phone,
                'customer_name': customer_name,
                '_token': "{!! csrf_token() !!}"
            },
            success:function ($response){
                if($response.code==="200")
                {
                    window.location.reload();
                }else {
                    alert($response.message)
                }
            },
            error:function ($response){
                console.log('error')
            }
        });

    }

    function agreen(customer_status){
        var url = '/order_handle';
        $.ajax({
            type:'POST',
            url:url,
            dataType: 'json',
            data:{
                'customer_contact_id': customer_contact_id,
                'order_id': order_id,
                'customer_status': customer_status,
                '_token': "{!! csrf_token() !!}"
            },
            success:function ($response){
                if($response.code==="200")
                {
                    alert('需求确认成功');
                    window.location.reload();
                }else {
                    alert($response.message)
                }
            },
            error:function ($response){
                console.log('error')
            }
        });
    }


</script>

</html>
