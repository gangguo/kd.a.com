<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 20:32:30
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/admin_group.index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c7531de459248_21563948',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c1591ae3a5144b7f586169b99c94cdfc21cc21cb' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/admin_group.index.tpl',
      1 => 1551183615,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c7531de459248_21563948 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),));
?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
    <link href="static/frame/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="static/frame/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="static/frame/css/animate.min.css" rel="stylesheet">
    <link href="static/frame/css/main.css" rel="stylesheet">
    <?php echo '<script'; ?>
 src="static/frame/js/jquery.min.js?v=2.1.4"><?php echo '</script'; ?>
>
</head>

<body>

<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=admin_group&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>用户组列表</a>
                        <a href="?ct=admin_group&ac=add" class="btn btn-outline btn-info"><i class="fa fa-plus-circle"></i>用户组添加</a>
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
" placeholder="请输入名称" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-white">搜索</button>
                        </div>
                    </form>
                </div>

                <div class="widget-content">
                    <table class="table table-bordered table-hover table-agl-c">
                        <thead>
                            <tr>
                                <th align="left">用户组名</th>
                                <th width="150px">管理</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($_smarty_tpl->tpl_vars['list']->value)) {?>
                            <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                            <tr>
                                <td align="left"> <?php echo $_smarty_tpl->tpl_vars['v']->value['name'];?>
 </td>
                                <td>
                                    <?php if ($_smarty_tpl->tpl_vars['v']->value['id'] != 1) {?>
                                    <a href="?ct=admin_group&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                    <a onclick="plt.confirmAction(event)" data-href="?ct=admin_group&ac=del&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
"
                                        data-title="确认删除"
                                        data-tipmsg="确认进行该操作吗？"
                                    class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>删除</a>
                                    <?php } else { ?>
                                    <button href="javascript:;" class="btn btn-xs btn-dark" disabled="disabled">不可操作</button>
                                    <?php }?>
                                </td>
                            </tr>
                            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                            <?php }?>
                            <tr>
                                <td colspan="3">
                                    <div class="fl">
                                        <!--<a class="btn btn-outline btn-danger active"><i class="fa fa-trash-o"></i>批量删除</a>-->
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

<?php echo '<script'; ?>
 src="static/frame/js/bootstrap.min.js?v=3.3.6"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/main.js"><?php echo '</script'; ?>
>
</body>
</html>

<?php }
}
