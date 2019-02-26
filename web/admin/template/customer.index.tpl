<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <title><{$title}></title>
    <link href="static/frame/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="static/frame/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="static/frame/css/animate.min.css" rel="stylesheet">
    <link href="static/frame/css/plugins/datapicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="static/frame/css/main.css" rel="stylesheet">
    <script src="static/frame/js/jquery.min.js?v=2.1.4"></script>
</head>

<body>

<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=admin&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>用户列表</a>
                        <a href="?ct=admin&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i>用户添加</a>
                        <!--<a class="btn btn-outline btn-danger"><i class="fa fa-trash-o"></i>垃圾桶</a>-->
                    </div>
                </div>

                <div class="widget-content p-b-none">
                    <form class="form-inline" action="" method="GET" id="test">
                        <input type="hidden" name="ct" value="<{request_em key='ct'}>" />
                        <input type="hidden" name="ac" value="<{request_em key='ac'}>" />
                        <div class="form-group">
                            <!--<label>用户组</label>-->
                            <select name="cur_group" class="form-control" onchange="location.href='?ct=<{request_em key='ct'}>&ac=<{request_em key='ac'}>&cur_group='+this.value">
                                <{html_options options=$group_options selected=$cur_group}>
                            </select>
                        </div>
                        <div class="form-group">
                            <!--<label>关键字</label>-->
                            <input type='text' name='keyword' class='form-control' value="<{request_em key='keyword'}>" placeholder="请输入名称" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-white">搜索</button>
                        </div>
                    </form>
                </div>

                <div class="widget-content">
                    <form method="POST" id="user_form" action="">
                        <{form_token}>
                        <table class="table table-bordered table-hover table-agl-c">
                            <thead>
                            <tr>
                                <th>公司名称</th>
                                <th>真实姓名</th>
                                <th>手机号码</th>
                                <th>管理</th>
                            </tr>
                            </thead>
                            <tbody>
                            <{if !empty($list)}>
                            <{foreach from=$list item=v}>
                            <tr>
                                <td> <{$v.company_name}> </td>
                                <td> <{$v.realname}> </td>
                                <td> <{$v.mobile}> </td>
                                <td>
                                    <a href="?ct=admin&ac=edit&id=<{$v.uid}>" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                </td>
                            </tr>
                            <{/foreach}>
                            <{/if}>
                            <tr>
                                <td colspan="10">
                                    <div class="fr">
                                        <{$pages}>
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

<script src="static/frame/js/bootstrap.min.js?v=3.3.6"></script>
<script src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.min.js"></script>
<script src="static/frame/js/plugins/datapicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="static/frame/js/main.js"></script>
<script>
    $("#submitForm").on("click",function(){
        var checkboxs = $("table").find("input[type='checkbox']");
        var flag = 0;var selVal = $("#operate").val();
        checkboxs.each(function() {
            if (this.checked) {
                flag++;
            }
        })
        var tipmsg = "";
        var url = selVal;

        if(flag!=0){
            if(selVal=="?ct=admin&ac=del"){
                tipmsg="确认批量删除？"
                parent.layer.confirm(tipmsg, { icon: 3, title: "批量操作" },
                    function(index) {
                        $("#user_form").attr("action",url)
                        $("#user_form").submit();
                        parent.layer.close(index);
                    });
            }else{
                $("#user_form").attr("action",url)
                $("#user_form").submit();
            }
        }else{
            parent.layer.confirm("请先选择数据", { icon: 3, title: "提示" },
                function(index) {
                    parent.layer.close(index);
                })
        }
    })
</script>

</body>
</html>

