<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 15:38:17
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/type.index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c739b69e6ccc2_09790829',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'cfae2647b83d6791acdb1fd47283ba6b7f20b358' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/type.index.tpl',
      1 => 1551064630,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:public/header.tpl' => 1,
    'file:public/footer.tpl' => 1,
  ),
),false)) {
function content_5c739b69e6ccc2_09790829 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty_plugins/function.request_em.php','function'=>'smarty_function_request_em',),1=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty/plugins/function.html_options.php','function'=>'smarty_function_html_options',),2=>array('file'=>'/Users/gangkui/wwwroot/www/video.a.com/web/kali/core/lib/smarty/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
$_smarty_tpl->_subTemplateRender("file:public/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=type&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>内容列表</a>
                        <a href="?ct=type&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i>内容添加</a>
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
                            <!--<label>分类</label>-->
                            <select name="catid" class="form-control">
                                <?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['options']->value,'selected'=>$_smarty_tpl->tpl_vars['catid']->value),$_smarty_tpl);?>

                            </select>
                        </div>
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
                            <th>标题</th>
                            <th>图片</th>
                            <th>添加时间</th>
                            <th>修改时间</th>
                            <th>管理</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['list']->value, 'v');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['v']->value) {
?>
                            <tr>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
 </td>
                                <td> <?php echo $_smarty_tpl->tpl_vars['v']->value['name'];?>
 </td>
                                <td> <img src="<?php echo $_smarty_tpl->tpl_vars['v']->value['imageurl'];?>
" width="100px" height="100px" /> </td>
                                <td> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['v']->value['create_time'],'%Y-%m-%d %H:%M:%S');?>
 </td>
                                <td> <?php echo smarty_modifier_date_format($_smarty_tpl->tpl_vars['v']->value['update_time'],'%Y-%m-%d %H:%M:%S');?>
 </td>
                                <td>
                                    <a href="?ct=type&ac=info&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" class="btn btn-success btn-xs"><i class="fa fa-search"></i>查看</a>
                                    <a href="?ct=type&ac=edit&id=<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                    <a onclick="plt.confirmAction(event)" data-href="?ct=type&ac=del&ids[]=<?php echo $_smarty_tpl->tpl_vars['v']->value['id'];?>
" data-title="确认删除" data-tipmsg="确认删除" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>删除</a>
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
                                <div class="fl">
                                    <!--<a class="btn btn-outline btn-danger active"><i class="fa fa-trash-o"></i>批量删除</a>-->
                                    <a class="btn btn-outline btn-danger active ajax-post-test"><i class="fa fa-trash-o"></i>批量删除</a>
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
