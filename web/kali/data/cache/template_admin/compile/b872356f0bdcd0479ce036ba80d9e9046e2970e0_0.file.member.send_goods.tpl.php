<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-28 19:01:12
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/member.send_goods.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c77bf78974070_56614264',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b872356f0bdcd0479ce036ba80d9e9046e2970e0' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/member.send_goods.tpl',
      1 => 1551351665,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c77bf78974070_56614264 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),1=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),2=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
$_smarty_tpl->_subTemplateRender("file:public/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
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

                    <?php echo smarty_function_form_token(array(),$_smarty_tpl);?>

                    <input type="hidden" name="member_id" value="<?php echo smarty_function_request_em(array('key'=>'id'),$_smarty_tpl);?>
" />
                    <div class="widget-title">
                        <span class="icon"><a href="<?php echo $_smarty_tpl->tpl_vars['back_url']->value;?>
"><i class="fa fa-chevron-left"></i>返回</a></span>
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
                                       value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['car_num'])) {
} else {
echo $_smarty_tpl->tpl_vars['data']->value['car_num'];
}?>" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 发车时间:</label>
                            <div class="col-sm-4 input-group" style="float:left;padding-left:15px;padding-right:15px;">
                                <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                </span>
                                    <input name="go_off" value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['go_off'])) {
} else {
echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['data']->value['go_off'],'%Y-%m-%d');
}?>"
                                           type="text" datatype="*" nullmsg="请输入发车时间"  class="form-control" data-plugin="datepicker" data-language="zh-CN"  autocomplete="off" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 货物说明:</label>
                            <div class="col-sm-6">
                                <textarea type="text" name='goods_inter' class="form-control"
                                          datatype="*" nullmsg="货物说明"><?php if (empty($_smarty_tpl->tpl_vars['data']->value['goods_inter'])) {
} else {
echo $_smarty_tpl->tpl_vars['data']->value['goods_inter'];
}?></textarea>
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

<?php $_smarty_tpl->_subTemplateRender("file:public/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php echo '<script'; ?>
>

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

<?php echo '</script'; ?>
><?php }
}
