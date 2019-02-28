<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 16:04:15
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/labe.index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c73a17fb81081_82869379',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fac7ab3dd1a57efa9dc61f035a5eb052458f4e6f' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/labe.index.tpl',
      1 => 1551081852,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c73a17fb81081_82869379 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),1=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
$_smarty_tpl->_subTemplateRender("file:public/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=labe&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>列表</a>
                        <a href="?ct=labe&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i>添加</a>
                        <!--<a class="btn btn-outline btn-danger"><i class="fa fa-trash-o"></i>垃圾桶</a>-->
                    </div>
                </div>

                <div class="widget-content p-b-none">
                    <form class="form-inline" action="" method="GET">
                        <input type="hidden" name="ct" value="<?php echo smarty_function_request_em(array('key'=>'ct'),$_smarty_tpl);?>
" />
                        <input type="hidden" name="ac" value="<?php echo smarty_function_request_em(array('key'=>'ac'),$_smarty_tpl);?>
" />
                        <div class="form-group">
                            <!--<label>关键字</label>-->
                            <input type='text' name='keyword' class='form-control' value="<?php echo smarty_function_request_em(array('key'=>'keyword'),$_smarty_tpl);?>
" placeholder="请输入标题" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-white">搜索</button>
                        </div>
                    </form>
                </div>
                <div class="widget-content">
                    <table class="table table-bordered table-hover table-agl-c with-check">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>状态</th>
                            <th>添加时间</th>
                            <th>修改时间</th>
                            <th>编辑</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                            <tr>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['labe_id'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['name'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['shows']->value[$_smarty_tpl->tpl_vars['v']->value['show']];?>
 </td>
                                <td> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['v']->value['create_time'],'%Y-%m-%d %H:%M:%S');?>
 </td>
                                <td> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['v']->value['update_time'],'%Y-%m-%d %H:%M:%S');?>
 </td>
                                <td>
                                    <!--a href="?ct=labe&ac=info&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['labe_id'];?>
" class="btn btn-success btn-xs"><i class="fa fa-search"></i>查看</a-->
                                    <a href="?ct=labe&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['labe_id'];?>
" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                </td>
                            </tr>
                            <?php
}
} else {
?>
                            <tr>
                                <td colspan="6">暂无内容</td>
                            </tr>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        <tr>
                            <td colspan="6">
                                <div class="fr">
                                    <?php echo $_smarty_tpl->tpl_vars['pages']->value;?>

                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $_smarty_tpl->_subTemplateRender("file:public/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
