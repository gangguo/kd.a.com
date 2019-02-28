<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 12:12:21
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/member.index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c74bca5515545_08118662',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a9af3fe0fd9ec0d59a99aec90ff8b2360f857354' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/member.index.tpl',
      1 => 1551154338,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c74bca5515545_08118662 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),));
$_smarty_tpl->_subTemplateRender("file:public/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>


<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=member&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>列表</a>
                        <a href="?ct=member&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i>添加</a>
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
                            <!--<memberl>关键字</memberl>-->
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
                            <th> <input type="checkbox" class="parent" /> </th>
                            <th> ID </th>
                            <th> 名称 </th>
                            <th> 昵称 </th>
                            <th> 邮箱 </th>
                            <th> 性别 </th>
                            <th> 状态 </th>
                            <th> 管理 </th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                            <tr <?php if ($_smarty_tpl->tpl_vars['v']->value['status'] == 2) {?>style="background:#f2dede !important;"<?php }?> >
                                <td> <input type="checkbox" name="member_ids[]" value="<?php echo $_smarty_tpl->tpl_vars['v']->value['member_id'];?>
" class="child" /> </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['member_id'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['username'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['nickname'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['email'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['sexs']->value[$_smarty_tpl->tpl_vars['v']->value['sex']];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['status']->value[$_smarty_tpl->tpl_vars['v']->value['status']];?>
 </td>
                                <td>
                                    <a href="?ct=member&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['member_id'];?>
" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
                                    <a href="?ct=member&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['member_id'];?>
" class="btn btn-danger btn-xs"><i class="fa fa-delicious"></i>禁用</a>
                                </td>
                            </tr>
                            <?php
}
} else {
?>
                            <tr>
                                <td colspan="8">暂无会员</td>
                            </tr>
                            <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                            <tr>
                                <td colspan="8">
                                    <div class="fl">
                                    </div>
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
