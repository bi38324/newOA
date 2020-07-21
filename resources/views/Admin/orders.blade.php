
    <div class="box-body">

        <div class="fields-group">

            <div class="col-md-12">
                <div class="form-group" style="display: none">

                    <label for="title" class="col-sm-2 asterisk control-label">订单ID</label>

                    <div class="col-sm-8">


                        <div class="input-group">

                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>

                            <input required="1" type="text" id="orders_id" name="orders_id" value=" {{ $orders['id'] }}" class="form-control title" readonly>


                        </div>


                    </div>
                </div>

                <div class="form-group">

                    <label for="title" class="col-sm-2 asterisk control-label">客户名称</label>

                    <div class="col-sm-8">


                        <div class="input-group">

                            <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>

                            <input required="1" type="text" id="customer_title" name="customer_title" value=" {{ $orders['title'] }}" class="form-control title" readonly>


                        </div>


                    </div>
                </div>
                @foreach ($params_list as $params)
                    @if($params['type'] == 0)
                        <div class="form-group">

                            <label for="{{ $params['id'] }}" class="col-sm-2 asterisk control-label">{{ $params['title'] }}</label>

                            <div class="col-sm-8">

                                <div class="input-group">

                                    <span class="input-group-addon"><i class="fa fa-pencil fa-fw"></i></span>

                                    <input required="{{ $params['is_required'] }}" type="text" id="{{ $params['id'] }}" name="{{ $params['id'] }}" value="" class="form-control {{ $params['alias'] }}  placeholder="请输入 {{ $params['title'] }}"">
                                    @if ($params['remark'])
                                        <span class="help-block">
    <i class="fa fa-info-circle"></i>&nbsp; {{ $params['remark'] }}</span>
                                    @endif

                                </div>

                            </div>
                        </div>
                    @elseif ($params['type'] == 1)
                        <div class="form-group  ">

                            <label for="{{ $params['id'] }}" class="col-sm-2  control-label">{{ $params['title'] }}</label>

                            <div class="col-sm-8">


                                <textarea required="{{ $params['is_required'] }}" name="{{ $params['id'] }}" class="form-control {{ $params['id'] }}" rows="5" placeholder="请输入 {{ $params['title'] }}"></textarea>

                                @if ($params['remark'])
                                    <span class="help-block">
    <i class="fa fa-info-circle"></i>&nbsp; {{ $params['remark'] }}</span>
                                    @endif
                            </div>
                        </div>
                    @elseif ($params['type'] == 2)
                        <div class="form-group  ">

                            <label for="{{ $params['id'] }}" class="col-sm-2 asterisk control-label">{{ $params['title'] }}</label>
                            <div class="col-sm-8">

                                <input type="hidden" name="{{ $params['id'] }}">
                                <select class="form-control {{ $params['id'] }}" style="width: 100%;" name="{{ $params['id'] }}" required="{{ $params['is_required'] }}" data-value="" tabindex="-1" aria-hidden="true">
                                    @foreach ($arr=explode(',', $params['type_params']) as $options)
                                        {{ $options }}
                                        <option value="{{ $options }}">{{ $options }}</option>
                                    @endforeach
                                </select>
                                @if ($params['remark'])
                                    <span class="help-block">
    <i class="fa fa-info-circle"></i>&nbsp; {{ $params['remark'] }}</span>
                                @endif

                            </div>
                        </div>

                    @endif
                @endforeach
            </div>
        </div>

    </div>
    <!-- /.box-body -->
