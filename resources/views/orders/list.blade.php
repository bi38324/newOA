<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <script src="{{ URL::asset('js/jquery-3.4.1.min.js') }}" type="text/javascript" charset="utf-8"></script>
    <script src="{{ URL::asset('js/bootstrap.min.js') }}" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="{{ URL::asset('css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ URL::asset('css/style.css') }}">
</head>

<body>
<!-- 	<h3>js触发选项卡</h3> -->
<ul class="nav nav-tabs" id="myTab">
    <li class="active"><a href="#bulletin1">全部</a></li>
{{--    <li><a href="#rule1">待确认</a></li>--}}
{{--    <li><a href="#forum1">进行中</a></li>--}}
{{--    <li><a href="#security1">已完结</a></li>--}}
</ul>
<div id="mytab-content2" class="tab-content">
    <!-- 全部 -->
    <div class="tab-pane fade in active" id="bulletin1">
        <!-- 01 -->
        <div class="first-common">
            <div class="first-top">
                <p>订单号： <span>        {{ $user['id'] }}</span></p>
                <b>交易完成</b>
            </div>
            <div class="first-center">
                <p>2020年改变促业务保持发育为本次</p>
                <div class="first-center-money">
                    <p>￥ <span>1.00</span> </p>
                    <a>X <span>1</span> </a>
                </div>
                <div class="first-center-bottom">
                    <p>合计：￥<span>1.00</span></p>
                </div>
            </div>
        </div>
        <!-- 02 -->
        <div class="first-common">
            <div class="first-top">
                <p>订单号： <span>123121231123132123132132132123</span></p>
                <b>交易完成</b>
            </div>
            <div class="first-center">
                <p>2020年改变促业务保持发育为本次</p>
                <div class="first-center-money">
                    <p>￥ <span>1.00</span> </p>
                    <a>X <span>1</span> </a>
                </div>
                <div class="first-center-bottom">
                    <p>合计：￥<span>1.00</span></p>
                </div>
            </div>
        </div>
        <!-- 03 -->
        <div class="first-common">
            <div class="first-top">
                <p>订单号： <span>123121231123132123132132132123</span></p>
                <b>交易完成</b>
            </div>
            <div class="first-center">
                <p>2020年改变促业务保持发育为本次</p>
                <div class="first-center-money">
                    <p>￥ <span>1.00</span> </p>
                    <a>X <span>1</span> </a>
                </div>
                <div class="first-center-bottom">
                    <p>合计：￥<span>1.00</span></p>
                </div>
            </div>
        </div>
        <!-- 04 -->
        <div class="first-common">
            <div class="first-top">
                <p>订单号： <span>123121231123132123132132132123</span></p>
                <b>交易完成</b>
            </div>
            <div class="first-center">
                <p>2020年改变促业务保持发育为本次</p>
                <div class="first-center-money">
                    <p>￥ <span>1.00</span> </p>
                    <a>X <span>1</span> </a>
                </div>
                <div class="first-center-bottom">
                    <p>合计：￥<span>1.00</span></p>
                </div>
            </div>
        </div>
        <!-- 05 -->
        <div class="first-common">
            <div class="first-top">
                <p>订单号： <span>123121231123132123132132132123</span></p>
                <b>交易完成</b>
            </div>
            <div class="first-center">
                <p>2020年改变促业务保持发育为本次</p>
                <div class="first-center-money">
                    <p>￥ <span>1.00</span> </p>
                    <a>X <span>1</span> </a>
                </div>
                <div class="first-center-bottom">
                    <p>合计：￥<span>1.00</span></p>
                </div>
            </div>
        </div>
    </div>
    <!-- 待确认 -->
    <div class="tab-pane fade" id="rule1">
        <div class="first-common">
            <div class="first-top">
                <p>订单号： <span>123121231123132123132132132123</span></p>
                <b>交易完成</b>
            </div>
            <div class="first-center">
                <p>2020年改变促业务保持发育为本次</p>
                <div class="first-center-money">
                    <p>￥ <span>1.00</span> </p>
                    <a>X <span>1</span> </a>
                </div>
                <div class="first-center-bottom">
                    <p>合计：￥<span>1.00</span></p>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="forum1">论坛内容面板</div>
    <div class="tab-pane fade" id="security1">安全内容面板</div>
</div>
<script type="text/javascript">
    $(function () {
        $('#myTab a').click(function () {
            $(this).tab('show')
        })
    })
</script>
</body>

</html>
