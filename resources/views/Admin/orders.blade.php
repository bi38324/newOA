
    <div class="box-body">

        <div class="fields-group">

            <div class="col-md-12">
                <div class="form-group  ">

                    <label for="customer_id" class="col-sm-2 asterisk control-label">客户名称</label>

                    <div class="col-sm-8">


                        <input type="hidden" name="customer_id">

                        <select class="form-control customer_id select2-hidden-accessible" style="width: 100%;" name="customer_id" required="1" data-value="" tabindex="-1" aria-hidden="true">
                            <option value=""></option>
                            <option value="1">测试</option>
                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer_id-et-container"><span class="select2-selection__rendered" id="select2-customer_id-et-container"><span class="select2-selection__placeholder">客户名称</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>


                    </div>
                </div>

                <div class="form-group  ">

                    <label for="customer_demand_id" class="col-sm-2 asterisk control-label">客户需求</label>

                    <div class="col-sm-8">


                        <input type="hidden" name="customer_demand_id">

                        <select class="form-control customer_demand_id select2-hidden-accessible" style="width: 100%;" name="customer_demand_id" required="1" data-value="" tabindex="-1" aria-hidden="true">
                            <option value=""></option>
                            <option value="1">测试</option>
                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-customer_demand_id-qa-container"><span class="select2-selection__rendered" id="select2-customer_demand_id-qa-container"><span class="select2-selection__placeholder">客户需求</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>


                    </div>
                </div>

                <div class="form-group  ">

                    <label for="start_time" class="col-sm-2  control-label">开始时间</label>

                    <div class="col-sm-8">


                        <div class="input-group">

                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>

                            <input style="width: 160px" type="text" id="start_time" name="start_time" value="2020-07-20 19:21:27" class="form-control start_time" placeholder="输入 开始时间">


                        </div>


                    </div>
                </div>
                <div class="form-group  ">

                    <label for="end_time" class="col-sm-2  control-label">结束时间</label>

                    <div class="col-sm-8">


                        <div class="input-group">

                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>

                            <input style="width: 160px" type="text" id="end_time" name="end_time" value="2020-07-20 19:21:27" class="form-control end_time" placeholder="输入 结束时间">


                        </div>


                    </div>
                </div>
                <div class="form-group  ">

                    <label for="admin_user_id" class="col-sm-2  control-label">所属销售</label>

                    <div class="col-sm-8">


                        <input type="hidden" name="admin_user_id">

                        <select class="form-control admin_user_id select2-hidden-accessible" style="width: 100%;" name="admin_user_id" readonly="1" data-value="1" tabindex="-1" aria-hidden="true">
                            <option value=""></option>
                            <option value="1" selected="">Administrator</option>
                            <option value="2">杨佳敏</option>
                        </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100%;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-admin_user_id-9w-container"><span class="select2-selection__rendered" id="select2-admin_user_id-9w-container" title="Administrator">Administrator</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>


                    </div>
                </div>

                <div class="form-group  ">

                    <label for="price" class="col-sm-2  control-label">销售金额</label>

                    <div class="col-sm-8">


                        <div class="input-group">

                            <span class="input-group-addon"><i class="fa fa-terminal fa-fw"></i></span>

                            <input style="width: 130px; text-align: right;" type="text" id="price" name="price" value="" class="form-control price" placeholder="输入 销售金额">


                        </div>


                    </div>
                </div>
                <div class="form-group  ">

                    <label for="receivable" class="col-sm-2  control-label">应收金额</label>

                    <div class="col-sm-8">


                        <div class="input-group">

                            <span class="input-group-addon"><i class="fa fa-terminal fa-fw"></i></span>

                            <input style="width: 130px; text-align: right;" type="text" id="receivable" name="receivable" value="" class="form-control receivable" placeholder="输入 应收金额">


                        </div>


                    </div>
                </div>
                <div class="form-group  ">

                    <label for="receipts" class="col-sm-2  control-label">实收金额</label>

                    <div class="col-sm-8">


                        <div class="input-group">

                            <span class="input-group-addon"><i class="fa fa-terminal fa-fw"></i></span>

                            <input style="width: 130px; text-align: right;" type="text" id="receipts" name="receipts" value="" class="form-control receipts" placeholder="输入 实收金额">


                        </div>


                    </div>
                </div>
                <div class="form-group  ">

                    <label for="sales_remark" class="col-sm-2  control-label">销售备注</label>

                    <div class="col-sm-8">


                        <textarea name="sales_remark" class="form-control sales_remark" rows="5" placeholder="输入 销售备注"></textarea>


                    </div>
                </div>

                <div class="form-group  ">

                    <label for="it_remark" class="col-sm-2  control-label">技术备注</label>

                    <div class="col-sm-8">


                        <textarea name="it_remark" class="form-control it_remark" rows="5" placeholder="输入 技术备注"></textarea>


                    </div>
                </div>

                <div class="form-group  ">

                    <label for="file_path" class="col-sm-2  control-label">上传附件</label>

                    <div class="col-sm-8">


                        <div class="file-input file-input-new"><div class="file-preview ">
                                <button type="button" class="close fileinput-remove" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>    <div class="file-drop-disabled">
                                    <div class="file-preview-thumbnails">
                                    </div>
                                    <div class="clearfix"></div>    <div class="file-preview-status text-center text-success"></div>
                                    <div class="kv-fileinput-error file-error-message" style="display: none;"></div>
                                </div>
                            </div>
                            <div class="kv-upload-progress kv-hidden" style="display: none;"><div class="progress">
                                    <div class="progress-bar bg-success progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
                                        0%
                                    </div>
                                </div></div><div class="clearfix"></div>
                            <div class="input-group file-caption-main">
                                <div class="file-caption form-control  kv-fileinput-caption" tabindex="500">
                                    <span class="file-caption-icon"></span>
                                    <input class="file-caption-name" onkeydown="return false;" onpaste="return false;" placeholder="选择文件">
                                </div>
                                <div class="input-group-btn input-group-append">



                                    <div tabindex="500" class="btn btn-primary btn-file"><i class="glyphicon glyphicon-folder-open"></i>&nbsp;  <span class="hidden-xs">浏览</span><input type="file" class="file_path" name="file_path" id="1595244088981_61"></div>
                                </div>
                            </div></div>


                    </div>
                </div>

                <div class="form-group  ">

                    <label for="status" class="col-sm-2  control-label">订单状态</label>

                    <div class="col-sm-8">



            <span class="icheck">

                <label class="radio-inline">
                    <div class="iradio_minimal-blue checked" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="radio" name="status" value="0" class="minimal status" checked="" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&nbsp;待开发&nbsp;&nbsp;
                </label>

            </span>


                        <span class="icheck">

                <label class="radio-inline">
                    <div class="iradio_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="radio" name="status" value="1" class="minimal status" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&nbsp;开发中&nbsp;&nbsp;
                </label>

            </span>


                        <span class="icheck">

                <label class="radio-inline">
                    <div class="iradio_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="radio" name="status" value="2" class="minimal status" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&nbsp;开发完成&nbsp;&nbsp;
                </label>

            </span>


                        <span class="icheck">

                <label class="radio-inline">
                    <div class="iradio_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="radio" name="status" value="3" class="minimal status" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&nbsp;已交付&nbsp;&nbsp;
                </label>

            </span>


                        <span class="icheck">

                <label class="radio-inline">
                    <div class="iradio_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="radio" name="status" value="4" class="minimal status" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins></div>&nbsp;已关闭&nbsp;&nbsp;
                </label>

            </span>



                    </div>
                </div>

            </div>
        </div>

    </div>
    <!-- /.box-body -->
