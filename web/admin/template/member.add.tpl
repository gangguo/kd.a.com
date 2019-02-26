<{include file="public/header.tpl"}>
<style>

    .tpl-item .item{width:80%;}
    .tpl-item .item,
    .tpl-item a {
        font-size:14px;
    }
    .tpl-item + .tpl-item {
        margin-top:10px;
    }
    .contact-plus .action,.stockholder .action{
        margin-left:5px;
    }
    .contact-plus .action,.contact-plus .item,.stockholder .action,.stockholder .item{
        vertical-align:top;
        display:inline-block;
    }
    .icon-large{
        font-size:4em;
        float: left;
        width:100%;
        margin: 1px 0px;
    }

</style>
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
                <form class="form-horizontal" action="?ct=member&ac=save" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <{form_token}>
                    <input type="hidden" name="member_id" value="<{if empty($data['member_id'])}>0<{else}><{$data.member_id}><{/if}>" />
                    <div class="widget-title">
                        <span class="icon"><a href="<{$back_url}>"><i class="fa fa-chevron-left"></i>返回</a></span>
                        <!--<span class="icon"> <i class="fa fa-align-justify"></i> </span>-->
                        <h5>
                            添加类型
                        </h5>
                    </div>
                    <div class="widget-content">

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 姓名 :</label>
                            <div class="col-sm-4">
                                <input name="username"  type="text" class="form-control" datatype="*" nullmsg="请输入姓名"
                                value="<{if empty($data['username'])}><{else}><{$data.username}><{/if}>" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 手机号码:</label>
                            <div class="col-sm-4">
                                <input type="text" name='mobile' class="form-control" datatype="*" nullmsg="请输入手机号码"
                                       value="<{if empty($data['mobile'])}><{else}><{$data.mobile}><{/if}>"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 公司名称:</label>
                            <div class="col-sm-6">
                                <input type="text" name='company_name' class="form-control" datatype="*" nullmsg="请输入公司名称" errmsg="请输入公司名称"
                                value="<{if empty($data['company_name'])}><{else}><{$data.company_name}><{/if}>" />
                            </div>
                        </div>

                        <!--<div class="hr-line-dashed"></div>-->

                        <!--<div class="form-group">-->
                        <!--<label class="col-sm-2 control-label">Potato:</label>-->
                        <!--<div class="col-sm-10">-->
                        <!--<input type="text" name='potato' class="form-control" />-->
                        <!--</div>-->
                        <!--</div>-->



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

<{include file="public/footer.tpl"}>

<script>

    $(function () {
        $('.contact-plus').on('click','.add-btn',function(){
            //alert(123)
            $('.contact-plus .contact-wrap').append(getItem('.contact-plus'));
        });

        $('.contact-plus').on('click','.del-btn',function(){
            $(this).closest('.tpl-item').remove();
        });

    });



    function getItem(className){
        console.log(className);
        var item = $(className + ' .contact-wrap').find('.tpl-item').eq(0).clone();
        //item.find('.item').removeClass('has-success').removeClass('has-error').children('span.Validform_wrong').remove();
        //item.find('.Validform_error').removeClass('Validform_error')

        item.find('input').val('');
        item.find('textarea').val('');
        item.find('.operation-btn').empty();
        item.find('.operation-btn').append('<a class="del-btn action btn btn-danger btn-outline" herf="javascript:void(0);"><i class="fa fa-remove"></i><span>刪除</span></a>');
        if(className == '.contact-plus'){
            $(className + ' .contact-wrap').append(item);
        }else{
            index = parseInt($(className + ' table.contact-wrap').find('.tpl-item').length);
            item.find('input[name="add_time[0]"]').attr('name','add_time[' + index + ']');
            item.find('textarea[name="consumption_remark[0]"]').attr('name','consumption_remark[' + index + ']');
            item.find('input[name="consumption_money[0]"]').attr('name','consumption_money[' + index + ']');

            item.find('input[name="operation_time[0]"]').attr('name','operation_time[' + index + ']');
            item.find('textarea[name="operation_remark[0]"]').attr('name','operation_remark[' + index + ']');

            $(className + '  table.contact-wrap').append(item);
        }
        getPluginDate();
    }

</script>