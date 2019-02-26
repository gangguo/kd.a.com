<{include file="public/header.tpl"}>


<div id="content">
    <div class="container-fluid">
        <div class="row">
            <div class="widget-box">

                <div class="widget-content p-b-none">
                    <div class="btn-outline-wrap">
                        <a href="?ct=member&ac=index" class="btn btn-success"><i class="fa fa-bars"></i>列表</a>
                        <a href="?ct=member&ac=add" class="btn btn-info btn-outline"><i class="fa fa-plus-circle"></i>添加</a>
                        <!--<a class="btn btn-outline btn-danger"><i class="fa fa-trash-o"></i>垃圾桶</a>-->
                    </div>
                </div>

                <div class="widget-content p-b-none">
                    <form class="form-inline" action="" method="GET">
                        <input type="hidden" name="ct" value="<{request_em key='ct'}>" />
                        <input type="hidden" name="ac" value="<{request_em key='ac'}>" />
                        <div class="form-group">
                            <!--<memberl>关键字</memberl>-->
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
                            <th> <input type="checkbox" class="parent" /> </th>
                            <th> ID </th>
                            <th> 名称 </th>
                            <th> 昵称 </th>
                            <th> 邮箱 </th>
                            <th> 性别 </th>
                            <th> 状态 </th>
                            <th> 管理 </th>
                        </tr>
                        </thead>
                        <tbody>
                            <{foreach from=$list item=v}>
                            <tr <{if $v['status'] == 2}>style="background:#f2dede !important;"<{/if}> >
                                <td> <input type="checkbox" name="member_ids[]" value="<{$v.member_id}>" class="child" /> </td>
                                <td> <{$v.member_id}> </td>
                                <td> <{$v.username}> </td>
                                <td> <{$v.nickname}> </td>
                                <td> <{$v.email}> </td>
                                <td> <{$sexs[$v['sex']]}> </td>
                                <td> <{$status[$v['status']]}> </td>
                                <td>
                                    <a href="?ct=member&ac=edit&id=<{$v.member_id}>" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
                                    <a href="?ct=member&ac=edit&id=<{$v.member_id}>" class="btn btn-danger btn-xs"><i class="fa fa-delicious"></i>禁用</a>
                                </td>
                            </tr>
                            <{foreachelse}>
                            <tr>
                                <td colspan="8">暂无会员</td>
                            </tr>
                            <{/foreach}>
                            <tr>
                                <td colspan="8">
                                    <div class="fl">
                                    </div>
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