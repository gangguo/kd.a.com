<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 20:38:12
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/admin.editpwd.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c7533343f1c70_59664007',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6ef7283b3edfbfbce2bee1d5dc798b725a6acbf4' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/admin.editpwd.tpl',
      1 => 1551183615,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c7533343f1c70_59664007 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),1=>array('file'=>'/Users/gangkui/wwwroot/www/kd.a.com/web/kali/core/lib/smarty/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
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
                <form class="form-horizontal" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <?php echo smarty_function_form_token(array(),$_smarty_tpl);?>


                    <div class="widget-title">
                        <span class="icon"> <i class="fa fa-lock"></i> </span>
                        <h5>修改密码</h5>
                    </div>
                    <div class="widget-content">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名:</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"> <?php echo $_smarty_tpl->tpl_vars['v']->value['username'];?>
</p>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group form-password">
                            <label class="col-sm-2 control-label"><code>*</code> 用户密码:</label>
                            <div class="col-sm-10">
                                <input type="password" id="password" name='password' class="form-control"
                                       datatype="password"
                                       nullmsg="请输入新密码"
                                        errmsg="请输入大于大于6位，包含大小写字母和数字的密码"/>
                                        <i class="fa fa-eye eye-btn" onclick="changePassword(this)"></i>
                                <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 必须大于6位，包含大小写字母和数字</span>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group  form-password">
                            <label class="col-sm-2 control-label"><code>*</code> 确认密码:</label>
                            <div class="col-sm-10">
                                <input type="password" name='passwordok' class="form-control"
                                       recheck="password"
                                       nullmsg="请再一次输入密码"
                                       datatype="*" errmsg="两次密码不符，请重新输入"/>
                                       <i class="fa fa-eye eye-btn" onclick="changePassword(this)"></i>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 工作称呼:</label>
                            <div class="col-sm-10">
                                <input type="text" name='realname' class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['v']->value['realname'];?>
" datatype="*" nullmsg="请输入工作称呼"/>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email:</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['v']->value['email'];?>
" datatype="e" ignore="ignore" errmsg="请输入正确的邮箱" />
                            </div>
                        </div>

                        <!--<div class="hr-line-dashed"></div>-->

                        <!--<div class="form-group">-->
                            <!--<label class="col-sm-2 control-label">Potato:</label>-->
                            <!--<div class="col-sm-10">-->
                                <!--<input type="text" name="potato" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['v']->value['potato'];?>
" />-->
                            <!--</div>-->
                        <!--</div>-->

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户组:</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"> <?php echo $_smarty_tpl->tpl_vars['v']->value['groupname'];?>
</p>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">上次登录时间:</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['lastlogin']->value['logintime'],"%Y-%m-%d %H:%M:%S");?>
</p>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">上次登录地址:</label>
                            <div class="col-sm-10">
                                <p class="form-control-static">  <?php echo $_smarty_tpl->tpl_vars['lastlogin']->value['loginip'];?>
</p>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">上次登录国家:</label>
                            <div class="col-sm-10">
                                <p class="form-control-static">  <?php echo $_smarty_tpl->tpl_vars['lastlogin']->value['logincountry'];?>
</p>
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

<?php echo '<script'; ?>
 src="static/frame/js/bootstrap.min.js?v=3.3.6"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/validform.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/newvalidform.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/main.js"><?php echo '</script'; ?>
>

<?php echo '<script'; ?>
>
      //查看密码
    function changePassword(e){
        var _this = $(e),
            _input =_this.siblings("input");
            if(_input.attr("type")=="password"){
                _input.attr("type","text");
                _this.addClass("fa-eye-slash").removeClass("fa-eye");
            }else{
                _input.attr("type","password");
                _this.addClass("fa-eye").removeClass("fa-eye-slash");
            }
    }
<?php echo '</script'; ?>
>
</body>
</html>
<?php }
}
