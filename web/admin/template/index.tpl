<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title><{$title}></title>

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->

    <link href="static/frame/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="static/frame/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="static/frame/css/animate.min.css" rel="stylesheet">
    <link href="static/ui/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="static/frame/css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="static/frame/css/jquery.gritter.css"/>

</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden" >
<input type="hidden" id="username" value="<{$user.username}>" />
<input type="hidden" id="userid" value="<{$user.uid}>" />
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <div class="nav-header">
                <div class="dropdown profile-element">
                    <h1><{$title}></h1>
                </div>
            </div>
            <ul class="nav copyNav" id="side-menu">
               <!-- <li class=" nav-list">
                    <a class="J_menuItem" href="home.html" data-index="0"><i class="fa fa-columns"></i> <span
                            class="nav-label">首页</span></a>
                </li>
                <li >
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">示列</span>
                        <span class="label label-important">6</span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li >
                            <a class="J_menuItem" href="table.html">table</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="form.html">form</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="button.html">button</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="icon.html">icon</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="elements.html">element</a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-info-circle"></i>
                        <span class="nav-label">error</span>
                        <span class="label label-important">4</span>
                    </a>
                    <ul class="nav nav-second-level collapse">
                        <li>
                            <a class="J_menuItem" href="error403.html">error403</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="error404.html">error404</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="error405.html">error405</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="error500.html">error500</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem" href="builder-form.html"><i class="fa fa-columns"></i> <span
                            class="nav-label">form-builder</span></a>
                </li>
                <li>
                    <a class="J_menuItem" href="suggest.html"><i class="fa fa-bars"></i> <span
                            class="nav-label">suggest</span></a>
                </li>
                <li>
                    <a class="J_menuItem" href="management.html"><i class="fa fa-search"></i> <span
                            class="nav-label">通讯录管理</span></a>
                </li>
                <li>
                    <a class="J_menuItem" href="credit-management.html"><i class="fa fa-search"></i> <span
                            class="nav-label">授信管理</span></a>
                </li>
                <li class="content">
                    <span>Monthly Bandwidth Transfer</span>
                    <div class="progress progress-striped">
                        <div class="progress-bar progress-bar-danger progress-mini active" role="progressbar"
                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                             style="width: 80%;">
                            <span class="sr-only">80% 完成（警告）</span>
                        </div>
                    </div>

                    <span class="percent">80%</span>
                    <div class="stat">21419.94 / 14000 MB</div>
                </li>
                <li class="content">
                    <span>Monthly Bandwidth Transfer</span>
                    <div class="progress progress-striped">
                        <div class="progress-bar progress-bar-info progress-mini active" role="progressbar"
                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                             style="width: 80%;">
                            <span class="sr-only">80% 完成（警告）</span>
                        </div>
                    </div>

                    <span class="percent">80%</span>
                    <div class="stat">21419.94 / 14000 MB</div>
                </li>-->
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->

    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row">
            <nav class="navbar navbar-static-top" role="navigation">
                <ul class="pull-left nav navbar-top-links navbar-left">
                    <li class="dropdown" id="profile-messages">
                        <a  href="#" data-toggle="dropdown" data-target="#profile-messages"
                           class="dropdown-toggle" aria-expanded="false">
                            <i class="fa icon fa-user"></i>
                            <span class="text">Welcome <{$user.username}></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> My Profile</a></li>

                            <li><a href="#"><i class="fa fa-check-square-o"></i> My Tasks</a></li>

                            <li><a href="?ac=logout"><i class="fa fa-sign-out"></i> Log Out</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle">
                            <i class="fa icon fa-envelope"></i>
                            <span class="text">Messages</span>
                            <span class="label label-important message_count" style="display: none"></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="sAdd J_menuItem"  href="home.html" data-index="1" data-Item="other" data-reload="true"><i class="fa fa-plus"></i>home</a></li>
                            <li><a class="J_menuItem" href="?ct=member&ac=oplog" data-index="15" data-reload="true"><i class="fa fa-envelope"></i> inbox</a></li>
                            <li><a class="sOutbox J_menuItem" data-index="11" href="icon.html" data-Item="other"><i class="fa fa-arrow-up"></i> icon</a></li>
                            <li><a class="sTrash J_menuItem" data-index="12" href="elements.html" data-Item="other"><i class="fa fa-trash"></i> elements</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
                            <i class="fa icon fa-language"></i>
                            <span class="text">Language</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="?ac=language_change&lang=zh-cn"> 简体中文 </a></li>
                            <li><a href="?ac=language_change&lang=zh-tw"> 繁体中文 </a></li>
                            <li><a href="?ac=language_change&lang=en"> English </a></li>
                            <li><a href="?ac=language_change&lang=km"> Combodia </a></li>
                        </ul>
                    </li>

                    <li class=""><a title="" href="#"><i class="fa fa-cog"></i> <span class="text">Settings</span></a> </li>
                    <!--<li class=""><a title="" href="?ac=logout"><i class="fa fa-sign-out"></i> <span class="text">Logout</span></a></li>-->
                </ul>
                <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">

                    <li class="dropdown notify-wrap"  title="">
                        <a data-toggle="" href="javascript:;" class="msg-btn" aria-expanded="false" data-animation="scale-up" role="button">
                            <i class="fa fa fa-bell-o" aria-hidden="true"></i>
                            <span class="badge badge-danger up msg-num">99+</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media" role="menu">
                            <li class="dropdown-menu-header" role="presentation">
                                <h5>最新消息</h5>
                                <span class="label label-round label-danger"></span>
                            </li>
                            <li class="list-group" role="presentation">
                                <div class="slimScrollDiv" id="notifyWrap">
                                    <a class="list-group-item J_menuItem" href="home.html" data-index="1" data-Item="other" data-reload="true" data-message="测试">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问欢迎您访问Admui演示系统欢迎您访问欢迎您访问Admui演示系统系统系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                    <a class="list-group-item item10" href="#">
                                        <div class="media">
                                            <div class="media-left" >
                                                <i class="fa fa-indent" ></i>
                                            </div>
                                            <div class="media-body">
                                                <h4 >欢迎您访问Admui演示系统</h4>
                                                <span class="media-meta" >2017-11-08 16:33:59</span>
                                            </div>
                                        </div>
                                    </a>
                                 </div>
                            </li>
                            <li class="dropdown-menu-footer" role="presentation">
                                <a href="/system/account/message" target="_blank" data-pjax="">
                                    <i class="fa fa-list"></i> 所有消息
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li id="screen-btn" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="全屏" data-trigger="hover">
                        <a class="fa fa-arrows" href="javascript:;"></a>
                    </li>
                    <li  data-toggle="tooltip" data-placement="bottom" title="" data-original-title="用户" data-trigger="hover">
                        <a class="fa fa-user"  href="javascript:;" role="button"></a>
                    </li>
                    <li data-toggle="tooltip" data-placement="bottom" title="" data-original-title="退出" data-trigger="hover">
                        <a class="fa fa-sign-out" id="admui-signOut" href="?ac=logout" role="button"> </a>
                    </li>

                </ul>
                <!--<div id="search">-->
                    <!--<input type="text" placeholder="Search here...">-->
                    <!--<button type="submit" class="tip-bottom" data-original-title="Search" data-toggle="tooltip"-->
                            <!--data-placement="bottom" title="" data-original-title="Search">-->
                        <!--<i class="fa fa-search icon-white"></i>-->
                    <!--</button>-->
                <!--</div>-->
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <!--<a href="javascript:;" class="active J_menuTab" data-id="home.html" data-index="1">首页</a>-->
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <button class="roll-nav roll-right refresh-btn" onclick="fnIfram()"><i class="fa fa-refresh"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>
                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="nav-phone-wrap" style="display: none">
            <div class="nav-phone-header" flag="flag"></div>
        </div>
        <div class="row J_mainContent" id="content-main">

        </div>
    </div>
    <!--右侧部分结束-->
</div>
<script src="static/frame/js/jquery.min.js?v=2.1.4"></script>
<script src="static/frame/js/bootstrap.min.js?v=3.3.6"></script>
<script src="static/frame/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="static/frame/js/plugins/layer/layer.min.js"></script>
<script src="static/ui/js/hplus.min.js?v=4.1.0"></script>
<script src="static/ui/js/contabs.min.js"></script>
<script src="static/frame/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="static/frame/js/jquery.gritter.min.js"></script>
<script src="static/frame/js/jquery.peity.min.js"></script>
<script src="static/frame/js/interface.js"></script>
<script src="static/frame/js/fullscreen.js"></script>
<script>
    var MenuData = <{$menus}>;

    function fnIfram() {
        $("body").on("click",".refresh-btn",function(){
            var ifr = $("iframe");
            for(var i = 0;i<ifr.length;i++){
               if(ifr.eq(i).css("display")=="inline") {
                   ifr[i].contentWindow.location.reload(true);
               }
            }
        })
    }
    //顶部icon提示
    $(function () { $("[data-toggle='tooltip']").tooltip(); });
    //消息弹出
    /*$("body").messageFn({
        title:"最新消息",//标题
        text:"开业啦",//内容
        index:"2",//序号
        url:"home.html",//链接
        tabTitle:"测试"//导航标题
    })
    $("body").messageFn({
        title:"最新消息2",
        text:"开业啦2",
        index:"8",
        url:"icon.html",
        tabTitle:"ioon"
    })*/

    $("body").notifyFn({
            title:"最新消息1",//标题
            time:"2017-09-08 09：00",//内容
            index:"10",//序号
            url:"button.html",//链接
            tabTitle:"最新消息",//导航标题
            reload:true//是否要刷新页面
    });

    $("body").notifyFn({
        title:"最新消息1",//标题
        time:"2017-09-08 09：00",//内容
        index:"1",//序号
        url:"home.html",//链接
        tabTitle:"最新消息",//导航标题
        reload:true//是否要刷新页面
    })
    $("body").notifyFn({
        title:"最新消息1",//标题
        time:"2017-09-08 09：00",//内容
        index:"1",//序号
        url:"home.html",//链接
        tabTitle:"最新消息",//导航标题
        reload:true//是否要刷新页面
    })


    //子iframe调用管理关闭dropdown
    function closeDrop(e){
        if($(e.target).parents(".dropdown").length == 0){
            if($(".notify-wrap").hasClass("open")){//判断是否为消息
                $("#notifyWrap .list-group-item").addClass("invalid-item");
                $(".msg-num").html("0").hide();
            }
            $(".dropdown").removeClass("open");
        }
    }
$(function(){
    $(".dropdown-menu-media:after").css("left","14px");
})
</script>
</body>


</html>
