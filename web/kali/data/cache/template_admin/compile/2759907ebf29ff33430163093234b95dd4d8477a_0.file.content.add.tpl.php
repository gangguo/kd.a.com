<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 19:59:57
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/content.add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c73d8bd43f868_30666071',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2759907ebf29ff33430163093234b95dd4d8477a' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/content.add.tpl',
      1 => 1551005473,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c73d8bd43f868_30666071 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),1=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty/plugins/function.html_options.php','function'=>'smarty_function_html_options',),));
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
    <link href="static/redactor/css/redactor.css" rel="stylesheet" />
    <?php echo '<script'; ?>
 src="static/frame/js/jquery.min.js?v=2.1.4"><?php echo '</script'; ?>
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

<body>

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
                <form class="form-horizontal" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <?php echo smarty_function_form_token(array(),$_smarty_tpl);?>


                    <div class="widget-title">
                        <span class="icon"><a href="javascript:history.back(-1)"><i class="fa fa-chevron-left"></i>返回</a></span>
                        <!--<span class="icon"> <i class="fa fa-align-justify"></i> </span>-->
                        <h5>
                            添加内容
                            <small>我是注释拉</small>
                        </h5>
                    </div>
                    <div class="widget-content">

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 标题:</label>
                            <div class="col-sm-10">
                                <input name="name" type="text" class="form-control" datatype="*" nullmsg="请输入标题" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 分类:</label>
                            <div class="col-sm-10">
                                <select name="catid" class="form-control" datatype="*" nullmsg="请输入分类">
                                    <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['options']->value,'selected'=>$_smarty_tpl->tpl_vars['catid']->value),$_smarty_tpl);?>
       
                                </select>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group uploader-group uploader-group-img" data-compress="true" data-thumb_w='100' data-auto="true" data-len="1" data-multiple="false" data-dir="image" data-extensions="gif,jpg,jpeg,bmp,png" data-chunked="true">
                            <label class="col-sm-2 control-label"> 单图:</label>
                            <div class="col-sm-10">
                                <!--用来存放文件信息-->
                                <div class="uploader-list"></div>
                                <a class="btn btn-dark uploader-picker" data-file="image" data-type="image"><i class="fa fa-upload"></i> </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <!--data-height="1026"-->
                        <!--data-width="1624"-->
                        <div class="form-group uploader-group uploader-group-img" 
                        data-auto="true" 
                        data-dir="image"
                        data-extensions="gif,jpg,jpeg,bmp,png">
                            <label class="col-sm-2 control-label">多图:</label>
                            <div class="col-sm-10">
                                <div class="uploader-list"></div>
                                <a class="btn btn-dark uploader-picker" data-file="images" data-type="image"><i class="fa fa-upload"></i> </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">内容:</label>
                            <div class="col-sm-10">
                                <div class="total-wrap" style="position: relative">
                                    <textarea id="redactor_content" name="content" cols="30" rows="10" class="form-control"></textarea>
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

<?php echo '<script'; ?>
 src="static/frame/js/bootstrap.min.js?v=3.3.6"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/main.js<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/validform.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/newvalidform.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/webuploader.own.js<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
"><?php echo '</script'; ?>
>
</body>
</html>
<?php }
}
