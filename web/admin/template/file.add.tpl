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
                <form class="form-horizontal" action="?ct=file&ac=save" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <{form_token}>
                    <input type="hidden" name="file_id" value="<{if empty($data['file_id'])}>0<{else}><{$data.file_id}><{/if}>" />
                    <div class="widget-title">
                        <span class="icon"><a href="<{$back_url}>"><i class="fa fa-chevron-left"></i>返回</a></span>
                        <!--<span class="icon"> <i class="fa fa-align-justify"></i> </span>-->
                        <h5>
                            添加类型
                        </h5>
                    </div>
                    <div class="widget-content">

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"><code>*</code> 标题:</filel>
                            <div class="col-sm-10">
                                <input name="title" type="text" class="form-control" datatype="*" nullmsg="请输入标题"
                                value="<{if empty($data['title'])}><{else}><{$data.title}><{/if}>" />
                            </div>
                        </div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"> 车牌号:</filel>
                            <div class="col-sm-8">
                                <input name="car_num" type="text" class="form-control" datatype="" nullmsg="请输入车牌号"
                                       value="<{if empty($data['car_num'])}><{else}><{$data.car_num}><{/if}>" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"><code>*</code> 评分:</filel>
                            <div class="col-sm-2">
                                <input name="score" type="number" class="form-control" datatype="" max="5" min="0" nullmsg="请输入标题"
                                       value="<{if empty($data['score'])}>5<{else}><{$data.score}><{/if}>" />
                            </div>

                            <filel class="col-sm-2 control-filel"><code>*</code> 浏览量:</filel>
                            <div class="col-sm-2">
                                <input name="browse_num" type="number" class="form-control" datatype="" min="0" nullmsg="请输入标题"
                                       value="<{if empty($data['browse_num'])}>0<{else}><{$data.browse_num}><{/if}>" />
                            </div>

                            <filel class="col-sm-2 control-filel"> 点赞数:</filel>
                            <div class="col-sm-2">
                                <input name="praise" type="number" class="form-control" datatype=""  min="0" nullmsg="请输入车牌号"
                                       value="<{if empty($data['praise'])}>0<{else}><{$data.praise}><{/if}>" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"> 分类:</filel>
                            <div class="col-sm-4">
                                <select name="cate_id" class="form-control" >
                                    <{if empty($data['cate_id'])}>
                                    <{html_options options=$cates }>
                                    <{else}>
                                    <{html_options options=$cates selected=$data.cate_id}>
                                    <{/if}>
                                </select>
                            </div>

                            <filel class="col-sm-2 control-filel"> 类型:</filel>
                            <div class="col-sm-4">
                                <select name="type" class="form-control" >
                                    <{if empty($data['type'])}>
                                    <{html_options options=$types }>
                                    <{else}>
                                    <{html_options options=$types selected=$data.type}>
                                    <{/if}>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"><code>*</code> 标签:</filel>
                            <div class="col-sm-10">
                                <{foreach from=$labes key="labe_id" item=labe_name }>
                                    <input type="checkbox"  name="labe_id[]"
                                <{if !empty($data['labes']) && in_array($labe_id, array_column($data['labes'], 'labe_id'))}>checked<{/if}> value="<{$labe_id}>" ><{$labe_name}></input>
                                <{/foreach}>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group uploader-group uploader-group-img"
                             data-compress="true"
                             data-thumb_w='100'
                             data-auto="true"
                             data-len="1"
                             data-multiple="false"
                             data-dir="image"
                             data-extensions="gif,jpg,jpeg,bmp,png"
                             data-chunked="true">
                            <filel class="col-sm-2 control-filel"> 封面图:</filel>
                            <div class="col-sm-10">
                                <!--用来存放文件信息-->
                                <div class="uploader-list"></div>
                                <a class="btn btn-dark uploader-picker"
                                   data-file="image"
                                   data-type="image"><i class="fa fa-upload"></i> </a>
                            </div>
                            <div class="hidden-input col-sm-9 col-sm-offset-2">
                                <input type="hidden" class="form-control file" datatype="file" nullmsg="请上传文件">
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <filel class="col-sm-2 control-filel"> URL地址:</filel>
                            <div class="col-sm-10 contact-plus">
                                <div class="contact-wrap">
                                    <{foreach from=$data.urls key=k_url item=url}>

                                        <div class="tpl-item">
                                            <div class="item">
                                                <input style="width: 100%;" datatype="s0-100"  name="url[]" type="text"
                                                       class="form-control" errmsg="请输入正确的网址格式" value="<{$url.url}>"  nullmsg="请输入公司网址" />
                                            </div>

                                            <{if $k_url == 0}>
                                            <span class="operation-btn">
                                                <a href="javascript:void(0)" class="add-btn action btn btn-success btn-outline">
                                                    <i class="fa fa-plus"></i><span>添加</span></a>
                                            </span>
                                            <{else}>
                                            <span class="operation-btn">
                                                <a class="del-btn action btn btn-danger btn-outline web_site" data-id="<{$url.id}>" herf="javascript:void(0);">
                                                    <i class="fa fa-remove"></i><span>刪除</span></a>
                                            </span>
                                            <{/if}>

                                        </div>

                                    <{foreachelse}>
                                        <div class="tpl-item">
                                            <div class="item">
                                                <input style="width: 100%;" datatype="s0-100"  name="url[]" type="text"
                                                       class="form-control" errmsg="请输入正确的网址格式" value=""  nullmsg="请输入公司网址" />
                                            </div>
                                            <span class="operation-btn">
                                                <a href="javascript:void(0)" class="add-btn action btn btn-success btn-outline">
                                                    <i class="fa fa-plus"></i><span>添加</span></a>
                                            </span>
                                        </div>
                                    <{/foreach}>
                                </div>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <filel class="col-sm-2 control-filel">内容:</filel>
                            <div class="col-sm-10">
                                <div class="total-wrap" style="position: relative">
                                    <textarea id="redactor_content" name="inter" cols="10" rows="5" class="form-control"><{if !empty($data.inter)}><{$data.inter}><{/if}></textarea>
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