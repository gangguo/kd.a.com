<{include file="public/header.tpl"}>
<style>

    .tpl-item .item{width:80%;}
    .tpl-item .item,
    .tpl-item a {
        font-size:14px;
    }
    .tpl-item + .tpl-item {
        margin-top:10px;
    }
    .contact-plus .action,.stockholder .action{
        margin-left:5px;
    }
    .contact-plus .action,.contact-plus .item,.stockholder .action,.stockholder .item{
        vertical-align:top;
        display:inline-block;
    }
    .icon-large{
        font-size:4em;
        float: left;
        width:100%;
        margin: 1px 0px;
    }

</style>
<div id="content">
    <div class="container-fluid">
        <div class="row">
            <!--<div class="btn-outline-wrap">-->
            <!--<a href="javascript:history.back(-1)" class="btn btn-success btn-outline"><i class="fa fa-chevron-left"></i>返回</a>-->
            <!--<a href="?ct=content&ac=index" class="btn btn-success btn-outline"><i class="fa fa-bars"></i>内容列表</a>-->
            <!--<a href="?ct=content&ac=add" class="btn btn-info"><i class="fa fa-plus-circle"></i>内容添加</a>-->
            <!--<a href="?ct=content&ac=trash" class="btn btn-outline btn-danger"><i class="fa fa-trash-o"></i>垃圾桶</a>-->
            <!--</div>-->

            <div class="widget-box">
                <form class="form-horizontal" action="?ct=member&ac=send_goods" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <{form_token}>
                    <input type="hidden" name="member_id" value="<{request_em key='id'}>" />
                    <div class="widget-title">
                        <span class="icon"><a href="<{$back_url}>"><i class="fa fa-chevron-left"></i>返回</a></span>
                        <!--<span class="icon"> <i class="fa fa-align-justify"></i> </span>-->
                        <h5>
                            添加类型
                        </h5>
                    </div>
                    <div class="widget-content">

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 车牌号码 :</label>
                            <div class="col-sm-4">
                                <input name="car_num"  type="text" class="form-control" datatype="*1-20" nullmsg="请输入车牌号码"
                                       value="<{if empty($data['car_num'])}><{else}><{$data.car_num}><{/if}>" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 发车时间:</label>
                            <div class="col-sm-4 input-group" style="float:left;padding-left:15px;padding-right:15px;">
                                <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                    <input name="go_off" value="<{if empty($data.go_off)}><{else}><{$data.go_off|date_format:'%Y-%m-%d'}><{/if}>"
                                           type="text" datatype="*" nullmsg="请输入发车时间"  class="form-control" data-plugin="datepicker" data-language="zh-CN"  autocomplete="off" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 货物说明:</label>
                            <div class="col-sm-6">
                                <textarea type="text" name='goods_inter' class="form-control"
                                          datatype="*" nullmsg="货物说明"><{if empty($data['goods_inter'])}><{else}><{$data.goods_inter}><{/if}></textarea>
                            </div>
                        </div>

                        <!--<div class="hr-line-dashed"></div>-->

                        <!--<div class="form-group">-->
                        <!--<label class="col-sm-2 control-label">Potato:</label>-->
                        <!--<div class="col-sm-10">-->
                        <!--<input type="text" name='potato' class="form-control" />-->
                        <!--</div>-->
                        <!--</div>-->



                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button type="submit" class="btn btn-success">提交</button>
                            </div>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<{include file="public/footer.tpl"}>

<script>

    $(function () {
        getPluginDate();

        $('.contact-plus').on('click','.add-btn',function(){
            //alert(123)
            $('.contact-plus .contact-wrap').append(getItem('.contact-plus'));
        });

        $('.contact-plus').on('click','.del-btn',function(){
            $(this).closest('.tpl-item').remove();
        });

    });


    function getPluginDate(){
        $("input[data-plugin='datepicker']").each(function(){
            var dateList=[];
            var lan = $(this).data("language");
            var format = $(this).data("format");
            var minview = "";
            if(format==undefined){
                format = 'yyyy-mm-dd hh:ii:ss';
                minview = 'day';
            }
            $(this).datetimepicker({
                format:format ,
                language:lan,
                pickDate: true,
                pickTime: false,
                minView:minview ,
                startView:2,
                autoclose: true,
                clearBtn: true,
                //todayBtn: true,
                todayHighlight: true,
                keyboardNavigation: true,
            }).on("changeDate", function() {
                var dateClicked = $(this).val();
                if(dateList.indexOf(dateClicked)>-1){
                    dateList.splice(dateList.indexOf(dateClicked),1);
                }else{
                    dateList.push($(this).val());

                }
                $(this).siblings("#datelist").val(dateList);
            });
        })
    }


    function getItem(className){
        console.log(className);
        var item = $(className + ' .contact-wrap').find('.tpl-item').eq(0).clone();
        //item.find('.item').removeClass('has-success').removeClass('has-error').children('span.Validform_wrong').remove();
        //item.find('.Validform_error').removeClass('Validform_error')

        item.find('input').val('');
        item.find('textarea').val('');
        item.find('.operation-btn').empty();
        item.find('.operation-btn').append('<a class="del-btn action btn btn-danger btn-outline" herf="javascript:void(0);"><i class="fa fa-remove"></i><span>刪除</span></a>');
        if(className == '.contact-plus'){
            $(className + ' .contact-wrap').append(item);
        }else{
            index = parseInt($(className + ' table.contact-wrap').find('.tpl-item').length);
            item.find('input[name="add_time[0]"]').attr('name','add_time[' + index + ']');
            item.find('textarea[name="consumption_remark[0]"]').attr('name','consumption_remark[' + index + ']');
            item.find('input[name="consumption_money[0]"]').attr('name','consumption_money[' + index + ']');

            item.find('input[name="operation_time[0]"]').attr('name','operation_time[' + index + ']');
            item.find('textarea[name="operation_remark[0]"]').attr('name','operation_remark[' + index + ']');

            $(className + '  table.contact-wrap').append(item);
        }
        getPluginDate();
    }

</script>