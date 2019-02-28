<?php
/* Smarty version 3.1.32-dev-45, created on 2019-02-25 15:38:17
  from '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/public/footer.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32-dev-45',
  'unifunc' => 'content_5c739b69e7a377_46010047',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e3ec7d339fb4fd7b50d90250721a7533dc3a0be2' => 
    array (
      0 => '/Users/gangkui/wwwroot/www/video.a.com/web/admin/template/public/footer.tpl',
      1 => 1551064630,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c739b69e7a377_46010047 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
 src="static/frame/js/bootstrap.min.js?v=3.3.6"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/validform.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/newvalidform.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/plugins/layer/layer.min.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/webuploader/webuploader.min.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/webuploader.own.js?12312"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/select2.min.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/bootstrap-tokenfield.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.min.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.zh-CN.js?<?php echo $_smarty_tpl->tpl_vars['clear_cache']->value;?>
" ><?php echo '</script'; ?>
>

<?php echo '<script'; ?>
>
    $(function () {
        getPluginDate();

    });



    function getPluginDate(){
        $("input[data-plugin='datepicker']").each(function(){
            var dateList=[];
            var lan = $(this).data("language");
            var format = $(this).data("format");
            if(format==undefined){
                format = 'yyyy-mm-dd';
            }

            var minview = $(this).data("minview");
            if(minview == undefined){
                minview = "month";
            }

            var startview = $(this).data("startview");
            if(minview == undefined){
                startview = 2;
            }
            var setstartdate = $(this).data('setstartdate');
            if(setstartdate == undefined){
                setstartdate = null;
            }


            $(this).datetimepicker({
                format:format ,
                language:lan,
                pickDate: true,
                pickTime: false,
                minView:minview ,
                startView:startview,
                setStartDate: setstartdate,
                autoclose: true,
                clearBtn: true,
                //todayBtn: true,
                todayHighlight: true,
                keyboardNavigation: true,
            }).on("changeDate", function() {
                var dateClicked = $(this).val();
                if(dateList.indexOf(dateClicked)>-1){
                    dateList.splice(dateList.indexOf(dateClicked),1);
                }else{
                    dateList.push($(this).val());

                }
                $(this).siblings("#datelist").val(dateList);
            });
        })
    }



<?php echo '</script'; ?>
>
</body>
</html><?php }
}
