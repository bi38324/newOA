<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 引入样式文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vant@2.9/lib/index.css" />

    <!-- 引入 Vue 和 Vant 的 JS 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vant@2.9/lib/vant.min.js"></script>

    <link rel="stylesheet" href="{{ URL::asset('css/category.css') }}">
    <!-- rem布局 -->
    <script>
        let deviceWidth = document.documentElement.clientWidth
        if (deviceWidth > 1080) {
            deviceWidth = 1080;
        }
        var a = (deviceWidth * 100) / 1080;
        document.documentElement.style.fontSize = a + "px";
    </script>
</head>

<body>
<div id="app">
    <!-- 头部内容模块 -->
    <input hidden="hidden" id="status" value="{{ $order['info']['status'] }}"/>
    <div class="head">
        <van-steps :active="active" active-icon="success" active-color="#38f">
            <van-step>待开发</van-step>
            <van-step>开发中</van-step>
            <van-step>待验收</van-step>
            <van-step>已完成</van-step>
        </van-steps>
    </div>
{{--    <!-- 物品内容模块 -->--}}
{{--    <div class="content">--}}
{{--        <span>JD绿联，京东自营旗舰店></span>--}}
{{--        <div>--}}
{{--            <img src="{{ URL::asset('/img/timg.jpg') }}" alt="静态图片" title="商品信息">--}}
{{--            <div>--}}
{{--                <p>绿联DVI公转VGA母转接头</p>--}}
{{--                <span>数量：1 颜色：橙</span>--}}
{{--                <p>￥14.59</p>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--        <!--<div class="btn btn1">加购物车</div>-->--}}
{{--    </div>--}}
    <!-- 联系客服模块 -->
{{--    <div class="lxkf">--}}
{{--        <div><i></i>联系客服</div>--}}
{{--    </div>--}}
    <!-- 订单编号模块 -->
    <div class="box">
        <van-collapse v-model="activeNames">
            <van-collapse-item>
                <template #title>
                    <div>
                        <p><span>订单编号：&nbsp;&nbsp;&nbsp;&nbsp;</span><span>{{ $order['info']['id'] }}</span></p>
                        <p><span>开始时间：&nbsp;&nbsp;&nbsp;&nbsp;</span><span>{{ $order['info']['start_time'] }}</span></p>
                        <p><span>结束时间：&nbsp;&nbsp;&nbsp;&nbsp;</span><span>{{ $order['info']['end_time'] }}</span></p>
                    </div>
                    <div>
                        <p><span>销售金额：&nbsp;&nbsp;&nbsp;&nbsp;</span><span>{{ $order['info']['price'] }}</span></p>
                        <p><span>实收金额：&nbsp;&nbsp;&nbsp;&nbsp;</span><span>{{ $order['info']['receipts'] }}</span></p>
                        <p><span>跟进销售：&nbsp;&nbsp;&nbsp;&nbsp;</span><span>{{ $order['info']['last_user'] }}</span></p>
                    </div>
                </template>
                <div>
                    @if(!empty($order['detail']))
                        @foreach ($order['detail'] as $key => $value)
                            <p>
                                <span>{{ $key }}：&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span>{{ $value }}</span>
                            </p>
                        @endforeach
                    @endif
                </div>
            </van-collapse-item>
        </van-collapse>
    </div>
    <!-- 提交订单模块 -->
{{--    <div class="foot">--}}
{{--         <div>更多</div>--}}
{{--         <div>--}}
{{--             <div class="btn">查看发票</div>--}}
{{--             <div class="btn">退换/售后</div>--}}
{{--             <div class="btn btn2">再次购买</div>--}}
{{--         </div>--}}
{{--     </div>--}}
</div>
</body>
<script>
    var status = document.getElementById("status").value;
    // 在 #app 标签下渲染一个按钮组件
    new Vue({
        el: '#app',
        data: {
            active: status,
            activeNames: ['1'],
        }
    });

</script>

</html>
