<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 21:29:26
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/file.add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c73edb6678638_82990161',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a0bd82a544eb41122cc7bc2f4120445350cd972e' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/file.add.tpl',
      1 => 1551101364,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c73edb6678638_82990161 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),1=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty/plugins/function.html_options.php','function'=>'smarty_function_html_options',),));
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
                <form class="form-horizontal" action="?ct=file&ac=save" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <?php echo smarty_function_form_token(array(),$_smarty_tpl);?>

                    <input type="hidden" name="file_id" value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['file_id'])) {?>0<?php } else {
echo $_smarty_tpl->tpl_vars['data']->value['file_id'];
}?>" />
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
                            <filel class="col-sm-2 control-filel"><code>*</code> 标题:</filel>
                            <div class="col-sm-10">
                                <input name="title" type="text" class="form-control" datatype="*" nullmsg="请输入标题"
                                value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['title'])) {
} else {
echo $_smarty_tpl->tpl_vars['data']->value['title'];
}?>" />
                            </div>
                        </div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"> 车牌号:</filel>
                            <div class="col-sm-8">
                                <input name="car_num" type="text" class="form-control" datatype="" nullmsg="请输入车牌号"
                                       value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['car_num'])) {
} else {
echo $_smarty_tpl->tpl_vars['data']->value['car_num'];
}?>" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"><code>*</code> 评分:</filel>
                            <div class="col-sm-2">
                                <input name="score" type="number" class="form-control" datatype="" max="5" min="0" nullmsg="请输入标题"
                                       value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['score'])) {?>5<?php } else {
echo $_smarty_tpl->tpl_vars['data']->value['score'];
}?>" />
                            </div>

                            <filel class="col-sm-2 control-filel"><code>*</code> 浏览量:</filel>
                            <div class="col-sm-2">
                                <input name="browse_num" type="number" class="form-control" datatype="" min="0" nullmsg="请输入标题"
                                       value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['browse_num'])) {?>0<?php } else {
echo $_smarty_tpl->tpl_vars['data']->value['browse_num'];
}?>" />
                            </div>

                            <filel class="col-sm-2 control-filel"> 点赞数:</filel>
                            <div class="col-sm-2">
                                <input name="praise" type="number" class="form-control" datatype=""  min="0" nullmsg="请输入车牌号"
                                       value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['praise'])) {?>0<?php } else {
echo $_smarty_tpl->tpl_vars['data']->value['praise'];
}?>" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"> 分类:</filel>
                            <div class="col-sm-4">
                                <select name="cate_id" class="form-control" >
                                    <?php if (empty($_smarty_tpl->tpl_vars['data']->value['cate_id'])) {?>
                                    <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['cates']->value),$_smarty_tpl);?>

                                    <?php } else { ?>
                                    <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['cates']->value,'selected'=>$_smarty_tpl->tpl_vars['data']->value['cate_id']),$_smarty_tpl);?>

                                    <?php }?>
                                </select>
                            </div>

                            <filel class="col-sm-2 control-filel"> 类型:</filel>
                            <div class="col-sm-4">
                                <select name="type" class="form-control" >
                                    <?php if (empty($_smarty_tpl->tpl_vars['data']->value['type'])) {?>
                                    <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['types']->value),$_smarty_tpl);?>

                                    <?php } else { ?>
                                    <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['types']->value,'selected'=>$_smarty_tpl->tpl_vars['data']->value['type']),$_smarty_tpl);?>

                                    <?php }?>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"><code>*</code> 标签:</filel>
                            <div class="col-sm-10">
                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['labes']->value, 'labe_name', false, 'labe_id');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['labe_id']->value => $_smarty_tpl->tpl_vars['labe_name']->value) {
?>
                                    <input type="checkbox"  name="labe_id[]"
                                <?php if (!empty($_smarty_tpl->tpl_vars['data']->value['labes']) && in_array($_smarty_tpl->tpl_vars['labe_id']->value,array_column($_smarty_tpl->tpl_vars['data']->value['labes'],'labe_id'))) {?>checked<?php }?> value="<?php echo $_smarty_tpl->tpl_vars['labe_id']->value;?>
" ><?php echo $_smarty_tpl->tpl_vars['labe_name']->value;?>
</input>
                                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group uploader-group uploader-group-img"
                             data-compress="true"
                             data-thumb_w='100'
                             data-auto="true"
                             data-len="1"
                             data-multiple="false"
                             data-dir="image"
                             data-extensions="gif,jpg,jpeg,bmp,png"
                             data-chunked="true">
                            <filel class="col-sm-2 control-filel"> 封面图:</filel>
                            <div class="col-sm-10">
                                <!--用来存放文件信息-->
                                <div class="uploader-list"></div>
                                <a class="btn btn-dark uploader-picker"
                                   data-file="image"
                                   data-type="image"><i class="fa fa-upload"></i> </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"> URL地址:</filel>
                            <div class="col-sm-10 contact-plus">
                                <div class="contact-wrap">
                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['data']->value['urls'], 'url', false, 'k_url');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['k_url']->value => $_smarty_tpl->tpl_vars['url']->value) {
?>

                                        <div class="tpl-item">
                                            <div class="item">
                                                <input style="width: 100%;" datatype="s0-100"  name="url[]" type="text"
                                                       class="form-control" errmsg="请输入正确的网址格式" value="<?php echo $_smarty_tpl->tpl_vars['url']->value['url'];?>
"  nullmsg="请输入公司网址" />
                                            </div>

                                            <?php if ($_smarty_tpl->tpl_vars['k_url']->value == 0) {?>
                                            <span class="operation-btn">
                                                <a href="javascript:void(0)" class="add-btn action btn btn-success btn-outline">
                                                    <i class="fa fa-plus"></i><span>添加</span></a>
                                            </span>
                                            <?php } else { ?>
                                            <span class="operation-btn">
                                                <a class="del-btn action btn btn-danger btn-outline web_site" data-id="<?php echo $_smarty_tpl->tpl_vars['url']->value['id'];?>
" herf="javascript:void(0);">
                                                    <i class="fa fa-remove"></i><span>刪除</span></a>
                                            </span>
                                            <?php }?>

                                        </div>

                                    <?php
}
} else {
?>
                                        <div class="tpl-item">
                                            <div class="item">
                                                <input style="width: 100%;" datatype="s0-100"  name="url[]" type="text"
                                                       class="form-control" errmsg="请输入正确的网址格式" value=""  nullmsg="请输入公司网址" />
                                            </div>
                                            <span class="operation-btn">
                                                <a href="javascript:void(0)" class="add-btn action btn btn-success btn-outline">
                                                    <i class="fa fa-plus"></i><span>添加</span></a>
                                            </span>
                                        </div>
                                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                </div>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel">内容:</filel>
                            <div class="col-sm-10">
                                <div class="total-wrap" style="position: relative">
                                    <textarea id="redactor_content" name="inter" cols="10" rows="5" class="form-control"><?php if (!empty($_smarty_tpl->tpl_vars['data']->value['inter'])) {
echo $_smarty_tpl->tpl_vars['data']->value['inter'];
}?></textarea>
                                </div>

                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

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
    $('.contact-plus').on('click','.add-btn',function(){
        //alert(123)
        $('.contact-plus .contact-wrap').append(getItem('.contact-plus'));
    });

    $('.contact-plus').on('click','.del-btn',function(){
        $(this).closest('.tpl-item').remove();
    });

});



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
