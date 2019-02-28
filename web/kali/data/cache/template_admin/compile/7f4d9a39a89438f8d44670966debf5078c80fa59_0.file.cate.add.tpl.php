<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 15:54:50
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/cate.add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c739f4a2bf4a1_81365336',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7f4d9a39a89438f8d44670966debf5078c80fa59' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/cate.add.tpl',
      1 => 1551081287,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c739f4a2bf4a1_81365336 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),1=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty/plugins/function.html_options.php','function'=>'smarty_function_html_options',),));
$_smarty_tpl->_subTemplateRender("file:public/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

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
                <form class="form-horizontal" action="?ct=cate&ac=save" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <?php echo smarty_function_form_token(array(),$_smarty_tpl);?>

                    <input type="hidden" name="cate_id" value="<?php if (empty($_smarty_tpl->tpl_vars['data']->value['cate_id'])) {?>0<?php } else {
echo $_smarty_tpl->tpl_vars['data']->value['cate_id'];
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
                            <label class="col-sm-2 control-label"><code>*</code> 名称:</label>
                            <div class="col-sm-4">
                                <input name="name" type="text" class="form-control" datatype="*" nullmsg="请输入标题"
                                value="<?php if (!empty($_smarty_tpl->tpl_vars['data']->value['name'])) {
echo $_smarty_tpl->tpl_vars['data']->value['name'];
}?>"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 排序:</label>
                            <div class="col-sm-4">
                                <input name="sort" type="number" class="form-control" datatype="*" nullmsg="请输入标题"
                                       value="<?php if (!empty($_smarty_tpl->tpl_vars['data']->value['sort'])) {
echo $_smarty_tpl->tpl_vars['data']->value['sort'];
}?>"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 是否显示:</label>
                            <div class="col-sm-2">
                                <select name="show" class="form-control" datatype="*" nullmsg="请输入分类">
                                    <?php if (!empty($_smarty_tpl->tpl_vars['data']->value['sort'])) {?>
                                        <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['shows']->value,'selected'=>$_smarty_tpl->tpl_vars['data']->value['show']),$_smarty_tpl);?>

                                    <?php } else { ?>
                                        <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['shows']->value),$_smarty_tpl);?>

                                    <?php }?>
                                </select>
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
}
}
