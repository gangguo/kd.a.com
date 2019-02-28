<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 20:35:10
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/admin.index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c75327eb755b4_57133919',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5b89eb36d310eb24352c95b345fe94b12f0b3c7e' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/admin.index.tpl',
      1 => 1551183615,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c75327eb755b4_57133919 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),1=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty/plugins/function.html_options.php','function'=>'smarty_function_html_options',),2=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),3=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
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
                                    <th> <input type="checkbox" class="parent" /> </th>
                                    <th>用户名</th>
                                    <th>真实姓名</th>
                                    <th>邮箱</th>
                                    <th>用户组</th>
                                    <th>登录国家</th>
                                    <th>上次登录</th>
                                    <!--<th>登录次数</th>-->
                                    <th>激活中</th>
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
                                    <td> <input type='checkbox' name='ids[]' value='<?php echo $_smarty_tpl->tpl_vars['v']->value['uid'];?>
' class="child" /> </td>
                                    <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['username'];?>
 </td>
                                    <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['realname'];?>
 </td>
                                    <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['email'];?>
 </td>
                                    <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['groups'];?>
 </td>
                                    <td> 
                                        <?php if ($_smarty_tpl->tpl_vars['v']->value['logincountry']) {?>
                                        <?php echo $_smarty_tpl->tpl_vars['v']->value['logincountry'];?>
 
                                        <?php } else { ?>
                                        -
                                        <?php }?>
                                    </td>
                                    <td> 
                                        <?php if ($_smarty_tpl->tpl_vars['v']->value['logintime']) {?>
                                        <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['v']->value['logintime'],'%Y-%m-%d %H:%M:%S');?>

                                        <?php } else { ?>
                                        -
                                        <?php }?>
                                    </td>
                                    <td> 
                                        <?php if ($_smarty_tpl->tpl_vars['v']->value['status'] == 1) {?>
                                        <i class="fa fa-check text-success">
                                        <?php } else { ?>
                                        <i class="fa fa-times text-danger">
                                        <?php }?>
                                    </td>
                                    <td> 
                                        <a onclick="plt.confirmAction(event)" data-href="?ct=admin&ac=reset_mfa&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['uid'];?>
" data-title="重置MFA" data-tipmsg="确定重置MFA?" class="btn btn-success btn-xs"><i class="fa fa-refresh"></i>重置MFA</a>
                                        <a href="?ct=admin&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['uid'];?>
" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                        <a onclick="plt.confirmAction(event)" data-href="?ct=admin&ac=del&ids[]=<?php echo $_smarty_tpl->tpl_vars['v']->value['uid'];?>
"
                                            data-title="确认删除"
                                            data-tipmsg="确认进行该操作吗？"
                                            class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>删除</a>
                                    </td>
                                </tr>
                                <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                <?php }?>
                                <tr>
                                    <td colspan="10">
                                        <div class="fl form-inline">
                                            <div class="form-group">
                                                <select id="operate" class="form-control">
                                                    <option value="?ct=admin&ac=del" data-title="确定删除" data-tipmsg="确定删除?">批量删除</option>
                                                    <!--<option value="?ct=admin&ac=update">批量更新</option>-->
                                                    <option value="?ct=admin&ac=active&is_active=0">禁用所选</option>
                                                    <option value="?ct=admin&ac=active&is_active=1">激活所选</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-inline btn-success" type="button" id="submitForm">提交</button>
                                            </div>
                                        </div>
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
