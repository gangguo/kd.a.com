<{include file="public/header.tpl"}>

<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=labe&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>列表</a>
                        <a href="?ct=labe&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i>添加</a>
                        <!--<a class="btn btn-outline btn-danger"><i class="fa fa-trash-o"></i>垃圾桶</a>-->
                    </div>
                </div>

                <div class="widget-content p-b-none">
                    <form class="form-inline" action="" method="GET">
                        <input type="hidden" name="ct" value="<{request_em key='ct'}>" />
                        <input type="hidden" name="ac" value="<{request_em key='ac'}>" />
                        <div class="form-group">
                            <!--<label>关键字</label>-->
                            <input type='text' name='keyword' class='form-control' value="<{request_em key='keyword'}>" placeholder="请输入标题" />
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
                            <th>名称</th>
                            <th>状态</th>
                            <th>添加时间</th>
                            <th>修改时间</th>
                            <th>编辑</th>
                        </tr>
                        </thead>
                        <tbody>
                        <{foreach from=$list item=v}>
                            <tr>
                                <td> <{$v.labe_id}> </td>
                                <td> <{$v.name}> </td>
                                <td> <{$shows[$v.show]}> </td>
                                <td> <{$v.create_time|date_format:'%Y-%m-%d %H:%M:%S'}> </td>
                                <td> <{$v.update_time|date_format:'%Y-%m-%d %H:%M:%S'}> </td>
                                <td>
                                    <!--a href="?ct=labe&ac=info&id=<{$v.labe_id}>" class="btn btn-success btn-xs"><i class="fa fa-search"></i>查看</a-->
                                    <a href="?ct=labe&ac=edit&id=<{$v.labe_id}>" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>修改</a>
                                </td>
                            </tr>
                            <{foreachelse}>
                            <tr>
                                <td colspan="6">暂无内容</td>
                            </tr>
                            <{/foreach}>
                        <tr>
                            <td colspan="6">
                                <div class="fr">
                                    <{$pages}>
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

<{include file="public/footer.tpl"}>