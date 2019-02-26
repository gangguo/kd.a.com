<{include file="public/header.tpl"}>

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
                <form class="form-horizontal" action="?ct=labe&ac=save" id="validateForm" novalidate="novalidate" action="" method="POST">

                    <{form_token}>
                    <input type="hidden" name="labe_id" value="<{if empty($data['labe_id'])}>0<{else}><{$data.labe_id}><{/if}>" />
                    <div class="widget-title">
                        <span class="icon"><a href="<{$back_url}>"><i class="fa fa-chevron-left"></i>返回</a></span>
                        <!--<span class="icon"> <i class="fa fa-align-justify"></i> </span>-->
                        <h5>
                            添加类型
                        </h5>
                    </div>
                    <div class="widget-content">

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 名称:</label>
                            <div class="col-sm-4">
                                <input name="name" type="text" class="form-control" datatype="*" nullmsg="请输入标题"
                                       value="<{if !empty($data['name'])}><{$data.name}><{/if}>"/>
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="col-sm-2 control-label"><code>*</code> 是否显示:</label>
                            <div class="col-sm-2">
                                <select name="show" class="form-control" datatype="*" nullmsg="请输入分类">
                                    <{if !empty($data['sort'])}>
                                    <{html_options options=$shows selected=$data.show}>
                                    <{else}>
                                    <{html_options options=$shows }>
                                    <{/if}>
                                </select>
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