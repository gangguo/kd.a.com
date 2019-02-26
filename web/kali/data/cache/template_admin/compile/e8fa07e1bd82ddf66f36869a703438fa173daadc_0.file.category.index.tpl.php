<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 12:47:05
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/category.index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c73734975a381_90107079',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e8fa07e1bd82ddf66f36869a703438fa173daadc' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/category.index.tpl',
      1 => 1551005473,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c73734975a381_90107079 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.lang.php','function'=>'smarty_function_lang',),1=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),2=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.form_token.php','function'=>'smarty_function_form_token',),3=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
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

<!--<?php echo smarty_function_lang(array('key'=>'common_list','defaultvalue'=>'','replace'=>array('name'=>'owner','age'=>10)),$_smarty_tpl);?>
-->

<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=category&ac=index" class="btn btn-success"><i class="fa fa-bars"></i><?php echo smarty_function_lang(array('key'=>'content_category_list','defaultvalue'=>"category"),$_smarty_tpl);?>
</a>
                        <a href="?ct=category&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i><?php echo smarty_function_lang(array('key'=>'content_category_add'),$_smarty_tpl);?>
</a>
                        <a href="#" class="btn btn-info btn-outline ajax_test"><i class="fa fa-plus-circle"></i>Ajax测试</a>
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
" placeholder="<?php echo smarty_function_lang(array('key'=>'content_category_search_txt'),$_smarty_tpl);?>
" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-white"><?php echo smarty_function_lang(array('key'=>'common_search'),$_smarty_tpl);?>
</button>
                        </div>
                    </form>

                </div>
                <div class="widget-content">
                    <form action="" method="POST">
                        <?php echo smarty_function_form_token(array(),$_smarty_tpl);?>

                        <table class="table table-bordered table-hover table-agl-c with-check">
                            <thead>
                                <tr>
                                    <th> <input type="checkbox" class="parent" /> </th>
                                    <th> ID </th>
                                    <th> <?php echo smarty_function_lang(array('key'=>'common_name'),$_smarty_tpl);?>
 </th>
                                    <th> <?php echo smarty_function_lang(array('key'=>'common_sort'),$_smarty_tpl);?>
 </th>
                                    <th> <?php echo smarty_function_lang(array('key'=>'common_time_add'),$_smarty_tpl);?>
 </th>
                                    <th> <?php echo smarty_function_lang(array('key'=>'common_time_edit'),$_smarty_tpl);?>
 </th>
                                    <th> <?php echo smarty_function_lang(array('key'=>'common_manage'),$_smarty_tpl);?>
 </th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                                <tr>
                                    <td> <input type="checkbox" name="ids[]" value="<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" class="child" /> </td>
                                    <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
 </td>
                                    <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['name'];?>
 </td>
                                    <td align="center"> <input type="text" name="sorts[<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
]" value="<?php echo $_smarty_tpl->tpl_vars['v']->value['sort'];?>
" class="form-control" style="width:80px" /> </td>
                                    <td> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['v']->value['create_time'],'%Y-%m-%d %H:%M:%S');?>
 </td>
                                    <td> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['v']->value['update_time'],'%Y-%m-%d %H:%M:%S');?>
 </td>
                                    <td> 
                                        <a href="?ct=category&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i><?php echo smarty_function_lang(array('key'=>'common_edit'),$_smarty_tpl);?>
</a>
                                        <a onclick="plt.confirmAction(event)" data-href="?ct=category&ac=del&ids[]=<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" data-title="<?php echo smarty_function_lang(array('key'=>'common_sure_delete'),$_smarty_tpl);?>
" data-tipmsg="确认删除" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i><?php echo smarty_function_lang(array('key'=>'common_delete'),$_smarty_tpl);?>
</a>
                                    </td>
                                </tr>
                                <?php
}
} else {
?>
                                <tr>
                                    <td colspan="7">暂无分类</td>
                                </tr>
                                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                <tr>
                                    <td colspan="7">
                                        <div class="fl">
                                            <a data-href="?ct=category&ac=del" class="btn btn-danger" onclick="plt.subform(event,'child')"
                                                data-title="<?php echo smarty_function_lang(array('key'=>'common_sure_batch_delete'),$_smarty_tpl);?>
"
                                                data-tipmsg="确认批量删除" data-errmsg="请先选择"
                                            ><i class="fa fa-trash-o"></i><?php echo smarty_function_lang(array('key'=>'common_batch_delete'),$_smarty_tpl);?>
</a>
                                            <a data-href="?ct=category&ac=edit_batch" class="btn btn-primary" onclick="plt.subform(event,'child')" data-title="<?php echo smarty_function_lang(array('key'=>'common_sure_batch_edit'),$_smarty_tpl);?>
"
                                                data-tipmsg="确认批量修改" data-errmsg="请先选择">
                                            <i class="fa fa-edit"></i><?php echo smarty_function_lang(array('key'=>'common_batch_edit'),$_smarty_tpl);?>
</a>
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
 src="static/frame/js/main.js<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
>
$(document).ready(function(){ 

    $('.ajax_test').click(function(){
    
        $.post( "?ct=index&ac=demo", function( data ) {
            console.log(data);
        });

    });
});
<?php echo '</script'; ?>
>

</body>
</html>

<?php }
}
