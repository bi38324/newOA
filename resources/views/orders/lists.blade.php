<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的订单列表</title>
    <link rel="stylesheet" href="{{ URL::asset('mobile/plugin/bootstrap/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('mobile/plugin/swiper/css/swiper.min.css') }}">
    <script src="{{ URL::asset('mobile/plugin/jquery-3.4.js') }}"></script>
    <script src="{{ URL::asset('mobile/plugin/rem.js') }}"></script>
    <script src="{{ URL::asset('mobile/plugin/bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="{{ URL::asset('mobile/plugin/swiper/js/swiper.jquery.min.js') }}"></script>
    <link rel="stylesheet" href="{{ URL::asset('mobile/css/index.css') }}">
    <link rel="stylesheet" href="{{ URL::asset('mobile/css/couselists.css') }}">
</head>
<body>
<div class="outtop" style="background-color: rgb(87,86,104)">
    <div class="top">
        <img src="{{ URL::asset('img/zg.png') }}" alt="" class="logo">
{{--        <img src="mobile/img/myinfo.png" alt="" class="personal">--}}
{{--        <img src="mobile/img/daohang-2@2x.png" alt="" class="classify">--}}
        <span class="zhuce">
            <span class="guanwang">数字中光</span>
{{--            /--}}
{{--            <span class="gologin">登录</span>--}}
        </span>
    </div>
</div>
<div class="icontent">
    <div id="topNav" class="swiper-container_2" style="border-top: 0.03125rem solid #f2f2f2">
        <div class="swiper-wrapper">
            <div class="swiper-slide active">
                <span>全部</span>
                <div></div>
            </div>
            <div class="swiper-slide">
                <span>待确认</span>
                <div></div>
            </div>
            <div class="swiper-slide">
                <span>进行中</span>
                <div></div>
            </div>
            <div class="swiper-slide">
                <span>待验收</span>
                <div></div>
            </div>
        </div>
    </div>
    <div id="nav_content">
        <div>
            @if(!empty($wx_user['customer_contact_id']) || !empty($order['all']))
                @foreach ($order['all'] as $all_key => $all_value)
                    <div class="courseout" onclick="info({{ $all_value['id'] }}, {{ $all_value['status'] }})">
                        <div class="coursetop">
                            <p>订单号： <span>{{ $all_value['order_code'] }}</span></p>
                            <b>订单状态：
                                @switch($all_value['status'])
                                    @case(0)
                                    待开发
                                    @break
                                    @case(1)
                                    开发中
                                    @break
                                    @case(2)
                                    待验收
                                    @break
                                    @case(3)
                                    已交付
                                    @break
                                @endswitch
                            </b>
                            {{--                        <img src="{{ URL::asset('mobile/img/zhuanti.png') }}" alt="">--}}
                            {{--                        <img src="{{ URL::asset('mobile/img/20191112165544.jpg') }}" alt="">--}}
                            {{--                        <div class="right">--}}
                            {{--                            <p><span class="zhibo">直播课</span> 2020年山东省公务员考试·笔试课程系列</p>--}}
                            {{--                            <p><img src="{{ URL::asset('mobile/img/shijian@2x.png') }}" alt="">2020-02-03-2020-06-30</p>--}}
                            {{--                            <p><img src="{{ URL::asset('mobile/img/jijie.png') }}" alt="">1节课</p>--}}
                            {{--                        </div>--}}
                        </div>
                        <div class="line"></div>
                        <div class="coursebottom">
                            <div class="bottomleft">
                            </div>
                            <div class="bottomright">
                                <p>
                                    <span>{{ $all_value['price'] }}</span>
                                    <span>{{ $all_value['receipts'] }}</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    @endforeach
            @else
                <div class="zwkc">
                    <img src="{{ URL::asset('mobile/img/nocourse.png') }}" alt="">
                    <p>暂无订单</p>
                </div>
                @endif
        </div>

        <div>
            @if(!empty($wx_user['customer_contact_id']) || !empty($order['confirm']))
                @foreach ($order['confirm'] as $confirm_key => $confirm_value)
                    <div class="courseout" onclick="info({{ $confirm_value['id'] }}, {{ $confirm_value['status'] }})">
                        <div class="coursetop">
                            <p>订单号： <span>{{ $confirm_value['order_code'] }}</span></p>
                            <b>订单状态：
                                @switch($confirm_value['status'])
                                    @case(0)
                                    待开发
                                    @break
                                    @case(1)
                                    开发中
                                    @break
                                    @case(2)
                                    待验收
                                    @break
                                    @case(3)
                                    已交付
                                    @break
                                @endswitch
                            </b>
                        </div>
                        <div class="line"></div>
                        <div class="coursebottom">
                            <div class="bottomleft">
                            </div>
                            <div class="bottomright">
                                <p>
                                    <span>{{ $confirm_value['price'] }}</span>
                                    <span>{{ $confirm_value['receipts'] }}</span>
                                </p>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="zwkc">
                    <img src="{{ URL::asset('mobile/img/nocourse.png') }}" alt="">
                    <p>暂无订单</p>
                </div>
            @endif
        </div>
        <div>
            @if(!empty($wx_user['customer_contact_id']) || !empty($order['under_way']))
                @foreach ($order['under_way'] as $under_way_key => $under_way_value)
                    <div class="courseout" onclick="info({{ $under_way_value['id'] }}, {{ $under_way_value['status'] }})">
                        <div class="coursetop">
                            <p>订单号： <span>{{ $under_way_value['order_code'] }}</span></p>
                            <b>订单状态：
                                @switch($under_way_value['status'])
                                    @case(0)
                                    待开发
                                    @break
                                    @case(1)
                                    开发中
                                    @break
                                    @case(2)
                                    待验收
                                    @break
                                    @case(3)
                                    已交付
                                    @break
                                @endswitch
                            </b>
                        </div>
                        <div class="line"></div>
                        <div class="coursebottom">
                            <div class="bottomleft">
                            </div>
                            <div class="bottomright">
                                <p>
                                    <span>{{ $under_way_value['price'] }}</span>
                                    <span>{{ $under_way_value['receipts'] }}</span>
                                </p>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="zwkc">
                    <img src="{{ URL::asset('mobile/img/nocourse.png') }}" alt="">
                    <p>暂无订单</p>
                </div>
            @endif
        </div>
        <div>
            @if(!empty($wx_user['customer_contact_id']) || !empty($order['finish']))
                @foreach ($order['finish'] as $finish_key => $finish_value)
                    <div class="courseout" onclick="info({{ $finish_value['id'] }}, {{ $finish_value['status'] }})">
                        <div class="coursetop">
                            <p>订单号： <span>{{ $finish_value['order_code'] }}</span></p>
                            <b>订单状态：
                                @switch($finish_value['status'])
                                    @case(0)
                                    待开发
                                    @break
                                    @case(1)
                                    开发中
                                    @break
                                    @case(2)
                                    待验收
                                    @break
                                    @case(3)
                                    已交付
                                    @break
                                @endswitch
                            </b>
                        </div>
                        <div class="line"></div>
                        <div class="coursebottom">
                            <div class="bottomleft">
                            </div>
                            <div class="bottomright">
                                <p>
                                    <span>{{ $finish_value['price'] }}</span>
                                    <span>{{ $finish_value['receipts'] }}</span>
                                </p>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="zwkc">
                    <img src="{{ URL::asset('mobile/img/nocourse.png') }}" alt="">
                    <p>暂无订单</p>
                </div>
            @endif
        </div>
    </div>
</div>
<div class="foot">
{{--    <p>--}}
{{--        <span><a href="#">在线咨询</a></span>|--}}
{{--        <span><a href="#">电话咨询</a></span>|--}}
{{--        <span><a href="#">选购课程</a></span>--}}
{{--    </p>--}}
</div>
<script src="{{ URL::asset('mobile/js/top.js') }}"></script>
<script src="{{ URL::asset('mobile/js/couselists.js') }}"></script>
<script>
    function info(order_id, status)
    {
        var base_url;
        switch(status)
        {
            case 0:
                base_url = '/orders_confirm';
                break;
            case 1:
                base_url = '/orders_info';
                break;
            case 2:
                base_url = '/orders_info';
                break;
        }
        window.location.href=base_url+'?order_id='+order_id;
    }
</script>
</body>
</html>
