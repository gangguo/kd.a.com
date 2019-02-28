<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 20:49:30
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/customer.index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c7535da0aa8b2_37306958',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '18608da57519b8f1fbcae2df6761a37f705211e6' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/customer.index.tpl',
      1 => 1551185366,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c7535da0aa8b2_37306958 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),1=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty/plugins/function.html_options.php','function'=>'smarty_function_html_options',),2=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),));
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
    <link href="static/frame/css/plugins/datapicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
                        <a href="?ct=admin&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>用户列表</a>
                        <a href="?ct=admin&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i>用户添加</a>
                        <!--<a class="btn btn-outline btn-danger"><i class="fa fa-trash-o"></i>垃圾桶</a>-->
                    </div>
                </div>

                <div class="widget-content p-b-none">
                    <form class="form-inline" action="" method="GET" id="test">
                        <input type="hidden" name="ct" value="<?php echo smarty_function_request_em(array('key'=>'ct'),$_smarty_tpl);?>
" />
                        <input type="hidden" name="ac" value="<?php echo smarty_function_request_em(array('key'=>'ac'),$_smarty_tpl);?>
" />
                        <div class="form-group">
                            <!--<label>用户组</label>-->
                            <select name="cur_group" class="form-control" onchange="location.href='?ct=<?php echo smarty_function_request_em(array('key'=>'ct'),$_smarty_tpl);?>
&ac=<?php echo smarty_function_request_em(array('key'=>'ac'),$_smarty_tpl);?>
&cur_group='+this.value">
                                <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['group_options']->value,'selected'=>$_smarty_tpl->tpl_vars['cur_group']->value),$_smarty_tpl);?>

                            </select>
                        </div>
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
                    <form method="POST" id="user_form" action="">
                        <?php echo smarty_function_form_token(array(),$_smarty_tpl);?>

                        <table class="table table-bordered table-hover table-agl-c">
                            <thead>
                            <tr>
                                <th>公司名称</th>
                                <th>真实姓名</th>
                                <th>手机号码</th>
                                <th>管理</th>
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
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['company_name'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['realname'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['mobile'];?>
 </td>
                                <td>
                                    <a href="?ct=admin&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['uid'];?>
" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                </td>
                            </tr>
                            <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                            <?php }?>
                            <tr>
                                <td colspan="10">
                                    <div class="fr">
                                        <?php echo $_smarty_tpl->tpl_vars['pages']->value;?>

                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
 src="static/frame/js/bootstrap.min.js?v=3.3.6"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.min.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.zh-CN.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/main.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
    $("#submitForm").on("click",function(){
        var checkboxs = $("table").find("input[type='checkbox']");
        var flag = 0;var selVal = $("#operate").val();
        checkboxs.each(function() {
            if (this.checked) {
                flag++;
            }
        })
        var tipmsg = "";
        var url = selVal;

        if(flag!=0){
            if(selVal=="?ct=admin&ac=del"){
                tipmsg="确认批量删除？"
                parent.layer.confirm(tipmsg, { icon: 3, title: "批量操作" },
                    function(index) {
                        $("#user_form").attr("action",url)
                        $("#user_form").submit();
                        parent.layer.close(index);
                    });
            }else{
                $("#user_form").attr("action",url)
                $("#user_form").submit();
            }
        }else{
            parent.layer.confirm("请先选择数据", { icon: 3, title: "提示" },
                function(index) {
                    parent.layer.close(index);
                })
        }
    })
<?php echo '</script'; ?>
>

</body>
</html>

<?php }
}
