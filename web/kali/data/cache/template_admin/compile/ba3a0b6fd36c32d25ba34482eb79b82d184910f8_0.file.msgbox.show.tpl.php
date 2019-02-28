<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-24 20:27:36
  from '/Users/gangguo/alidata/www/video.a.com/web/admin/template/system/msgbox.show.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c728db811f060_84036233',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ba3a0b6fd36c32d25ba34482eb79b82d184910f8' => 
    array (
      0 => '/Users/gangguo/alidata/www/video.a.com/web/admin/template/system/msgbox.show.tpl',
      1 => 1550983602,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c728db811f060_84036233 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
    *{ margin:0; padding:0; color:#333; font-size:12px; }
    .msgbox { background:#CBCCD0; padding:5px; width:500px; margin:50px auto; }
    .msgbox h2{ font-size:12px; height:28px; line-height:28px; border-bottom:1px #909090 solid; padding:0 10px; background:#E1E1E1; }
    .msgbox .content{ padding:20px 0; text-align:center; background:#fff; }
    .msgbox h4{ font-size:14px; line-height:24px; margin-bottom:10px; }
 </style>
<base target='_self' />
<title> <?php echo $_smarty_tpl->tpl_vars['title']->value;?>
 </title>
</head>
<body>

    <div class="msgbox">
        <div style="border:1px #909090 solid;">
            <h2><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</h2>
            <div class="content">
	        	<h4> <?php echo $_smarty_tpl->tpl_vars['msg']->value;?>
 </h4>
				<?php echo $_smarty_tpl->tpl_vars['jumpmsg']->value;?>

                <!--<a href="#">重新登录</a>-->
            </div>
        </div>
    </div>
    <?php echo '<script'; ?>
 lang='javascript'>
        function JumpUrl(url) { 
            location=url;  
        }
        <?php echo $_smarty_tpl->tpl_vars['jstmp']->value;?>

    <?php echo '</script'; ?>
>
</body>
</html>

<?php }
}
