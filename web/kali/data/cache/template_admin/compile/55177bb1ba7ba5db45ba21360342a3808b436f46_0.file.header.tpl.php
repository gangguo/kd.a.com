<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-26 20:27:20
  from '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/public/header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c7530a84da474_72680843',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '55177bb1ba7ba5db45ba21360342a3808b436f46' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/kd.a.com/web/admin/template/public/header.tpl',
      1 => 1551183615,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c7530a84da474_72680843 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>

    <link href="static/frame/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="static/frame/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="static/frame/css/animate.min.css?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" rel="stylesheet">
    <link  href="static/frame/css/plugins/datapicker/bootstrap-datetimepicker.min.css?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" rel="stylesheet">
    <link  href="static/frame/css/plugins/datapicker/datepicker3.css?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" rel="stylesheet">
    <link href="static/frame/css/main.css<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
>" rel="stylesheet">
    <link href="static/redactor/css/redactor.css?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" rel="stylesheet" />
    <link href="static/frame/css/select2.css?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" rel="stylesheet">



    <?php echo '<script'; ?>
 src="static/frame/js/jquery.min.js?v=2.1.4"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/js/redactor.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/js/zh_cn.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>

    <?php echo '<script'; ?>
 src="static/webuploader/webuploader.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/js/redactor.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/plugins/webuploadImage.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/plugins/webuploadVideo.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/plugins/pasteImage.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/js/zh_cn.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/plugins/fullscreen.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/plugins/fontcolor.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="static/redactor/plugins/fonttotal.js"><?php echo '</script'; ?>
>

    <?php echo '<script'; ?>
 type="text/javascript">
        $(function()
        {
            $('#redactor_content').redactor({
                //imageGetJson: '?ct=upload&ac=redactor&type=file_manager_json',
                imageWebUpload: '?ct=upload&ac=upload',
                imageUpload: '?ct=upload&ac=upload_html5',
                imageDir: 'image',
                thumbWidth: 0,
                thumbHeight: 0,
                // videoGetJson: '?ct=upload&ac=redactor&type=file_manager_json',
                videoUpload: '?ct=upload&ac=upload_chunked',
                videoDir: 'video',
                plugins: [ 'fullscreen', 'webuploadImage', 'webuploadVideo', 'pasteImage', 'fontcolor'],
                minHeight: '480px',
                maxHeight: '480px',
                lang: 'zh_cn',
                imgFileNumLimit: 3,
                videoFileNumLimit: 3,
            });
        });
    <?php echo '</script'; ?>
>

</head>

<body><?php }
}
