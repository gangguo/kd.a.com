<{include file='document/common.tpl'}>
<{include file='document/header.tpl'}>
<link rel="stylesheet" href="static/css/document.css">
<link rel="stylesheet" href="static/highlight/styles/default.css">
<script src="static/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

<!-- Docs master nav -->
<header class="navbar navbar-static-top navbar-inverse" id="top" role="banner">
    <div class="container">
        <a href="#" class="navbar-brand">Kali Framework Wiki</a>
        <div class="pull-right" style="margin-right: 15%">
            <a class="navbar-brand <?php if ($PRM['lan']==='cn'){?>active<?php } ?>" href="javascript:void(0)" onclick="changeLanguage('cn')">中文</a>
            <a class="navbar-brand <?php if ($PRM['lan']==='en'){?>active<?php } ?>" href="javascript:void(0)" onclick="changeLanguage('en')">English</a>
        </div>
    </div>
</header>

<div class="container bs-docs-container">

<div class="row">
<div <{if $is_mobile}>class="col-md-12"<{else}>class="col-md-9"<{/if}> role="main">
    <div class="bs-docs-section">
        <h1 id="overview" class="page-header">概览</h1>
        <p>Kali是一款高性能的轻量级PHP框架</p>
        <p>遵循 MVC 模式，用于快速开发现代 Web 应用程序</p>
        <p>Kali代码简洁优雅，对应用层，数据层，模板渲染层的封装简单易懂，能够快速上手使用</p>
        <p>高性能，框架响应时间在1ms以内，单机qps轻松上3000</p>

        <h2 id="overview-introduce">介绍</h2>
        <p>支持跨库连表，条件复合筛选，查询PK缓存等</p>
        <p>同步异步请求分离，类的自动化加载管理</p>
        <p>支持Form表单验证，支持事件触发机制</p>
        <p>支持浏览器端调试，快速定位程序问题和性能瓶颈</p>
        <p>具有sql防注入，html自动防xss等特性</p>
        <p>GitHub 地址：<a href="https://github.com/owner888/kali">https://github.com/owner888/kali</a></p>

        <h2 id="overview-files">目录结构</h2>
        <!--<div class="col-lg-3"><img src="http://f.wetest.qq.com/gqop/10000/20000/GuideImage_cb2a0980064cb1e61242742ed0b183be.png"></div>-->
        <div class="col-lg-11" style="margin-left: 20px">
            <p><code>/app/</code> 总工作目录</p>
            <p><code>/app/config/</code> 业务配置层</p>
            <p><code>/app/control/</code> 路由入口控制器层</p>
            <p><code>/app/model/</code> 自定义模型层</p>
            <p><code>/app/event/</code> 事件触发及定义层</p>
            <p><code>/app/template/</code> 页面渲染层</p>
            <p><code>/config/</code> 框架配置层</p>
            <p><code>/lib/</code> 系统Lib层</p>
            <p><code>/extend/</code> 自定义Lib层，该目录下内容用户都可以根据需要自行替换删除</p>
            <p><code>/data/log/</code> 工作日志目录</p>
            <p><code>/data/cache/</code> 工作缓存目录</p>
            <p><code>/web/</code> 总执行入口</p>
            <p><code>/web/static/</code> 静态资源文件</p>
            <p><code>/web/index.php</code> 总执行文件</p>
        </div>
        <div style="clear: both"></div>

        <h2 id="overview-level">调用关系</h2>
        <p><code>control</code>为总路由入口，<code>control方法</code>可调用自定义model数据类</p>
        <p><code>model</code>为自定义model数据类，通常是static方法</p>
        <p>程序全局可调用core库下系统方法，例如：</p>
        <p><code>log</code>日志类，可记录info、debug、warn、erro等日志，方便调试</p>
        <p><code>req</code> 请求类，可获GET、POST等请求参数，当前地址，客户端ip等</p>
        <p><code>cache</code> 缓存类，可缓存从数据库获取的数据，token，session等数据</p>
        <p>core/lib 下还有各种各样的类库，基本上涵盖互联网所有开发所需</p>

        <p>简单示例</p>
        <pre><code class="php">namespace admin\control;
use kali\core\kali;
use admin\model\mod_user;
class ctl_index extends ctl_base
{
    // init方法会在action执行前被执行
    public static function _init()
    {
        // 未登录时调整登录页面
        if(!mod_user::exist())
        {
            header('location:?ct=auth&ac=login');
        }
    }

    // 默认路由index
    public function index()
    {
        // 获取当前用户
        $user_id = mod_user::$user_id;
        $user_info = cache::get('cache_'.$user_id);
        if (!$user_info)
        {
            // 数据库获取用户信息
            $user_info = db::query("SELECT * FROM `user` WHERE `id`=$user_id");
            // 缓存用户信息
            cache::set('cache_'.$user_id, $user_info);
        }

        tpl::assign('user_info', $user_info);
        tpl::display('user.tpl');
    }
}</code></pre>
        <p>P.S: 示例中的用法会在下面具体展开介绍</p>

        <h2 id="overview-index">环境配置</h2>
        <p>PHP版本必须在<code>5.5</code>以上，包含<code>5.5</code></p>
        <p>如果需要用到数据库，则需要安装并启用<code>mysqli扩展</code></p>
        <p><code>/data/log/</code> 目录为日志记录文件夹，必须具有<code>写权限</code></p>
        <p><code>/data/cache/</code> 目录为缓存文件夹，也必须具有<code>写权限</code></p>
        <p>本例子中主要介绍linux下nginx的配置</p>
        <p>nginx根目录需要指向<code>/web/</code>目录下，示例如下</p>
<pre><code class="nginx">location / {
    root   /data/web/kali/web/; // 这里为框架/web目录的绝对路径
    index  index.php index.html index.htm;
    try_files $uri $uri/ /index.php?$args;
}</code></pre>
        <p>Apache 配置如下：</p>
<pre><code class="apache"># 设置文档根目录为框架/web目录
DocumentRoot "/data/web/kali/web/"

&lt;Directory "/data/web/kali/web/"&gt
    RewriteEngine on
    # 如果请求的是真实存在的文件或目录，直接访问
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    # 如果请求的不是真实文件或目录，分发请求至 index.php
    RewriteRule . index.php

    # 以下三行apache默认会有，如无法正常使用请自行添加
    # Options +Indexes +Includes +FollowSymLinks +MultiViews
    # AllowOverride All
    # Require local

    # ...other settings...
&lt;/Directory&gt </code></pre>

        <p><code>/web/index.php</code>是程序的主入口，其中有几个关键配置</p>

        <pre><code class="php">//默认时区配置
date_default_timezone_set('Asia/Shanghai');
// 开启debug调试模式（会输出异常, web是html格式化的调试信息，ajax/app是json）
defined('SYS_DEBUG') or define('SYS_DEBUG', true);
// 开启Chrome Logger页面调试
defined('SYS_CONSOLE') or define('SYS_CONSOLE', true);
// dev pre pub 当前环境
defined('SYS_ENV') or define('SYS_ENV', 'dev');
// 系统维护中。。。
defined('isMaintenance') or define('isMaintenance', false);</code></pre>

        <p>其中<code>SYS_ENV</code>的环境值也有bool型，方便判断使用</p>
        <pre><code class="php">// 在\core\kali.php 中配置
// 测试环境
defined('ENV_DEV') or define('ENV_DEV', SYS_ENV === 'dev');
// 预发布环境
defined('ENV_PRE') or define('ENV_PRE', SYS_ENV === 'pre');
// 线上正式环境
defined('ENV_PUB') or define('ENV_PUB', SYS_ENV === 'pub');</code></pre>
    </div>

    <div class="bs-docs-section">
        <h1 id="router">路由</h1>
        <p>基本MVC架构路由模式，第一层对应<code>control</code>（默认<code>index</code>），第二层对应<code>action</code>（默认也是<code>index</code>）</p>
        <h2 id="router-rule">默认路由</h2>
        <p>在<code>/app/control</code>目录下，必须确保文件名小写并且与类名一致，否则会报控制器找不到的错误。</p>
        <p>示例：/app/control/ctl_index.php</p>
        <pre><code class="php">class ctl_index extends ctl_base
{
    //默认路由index
    //http://www.kaliphp.com/
    public function index()
    {
        //调用模版 index.tpl
        tpl::display('index.tpl');
    }

    //http://www.kaliphp.com/?ct=index&ac=test
    public function test()
    {
        //调用模版 test/test.tpl
        tpl::display('test/test');
    }

}</code></pre>

        <h2 id="router-ajax">异步请求</h2>
        <p>异步请求包含POST，ajax等多种请求方式，系统会自动进行<code>异步验证（csrf）</code>及处理，框架提供了一整套<code>csrf验证</code>机制，默认<code>开启</code>，可通过在<code>kali/config/config.php</code>中将<code>'csrf_token_on' => false</code>关闭。</p>
        <pre><code class="php">'request' => [
    'csrf_token_on'     => false,               // 是否开启令牌验证
    'csrf_token_name'   => 'csrf_token_name',   // 令牌验证的表单隐藏字段名称
    'csrf_token_reset'  => true,                // 令牌验证出错后是否重置令牌 默认为true
    'csrf_cookie_name'  => 'csrf_cookie_name',  // 令牌存放的cookie名称
    'csrf_expire'       => 86400,               // 令牌过期时间，一天
    'csrf_white_ips'    => [                    // csrf IP白名单
        '127.0.0.1/24'
    ],
    'csrf_exclude_uris' => [                    // csrf URL白名单
    ],
]</code></pre>
        <p>当csrf验证开启时，前端ajax请求需要预先加载引用<code>/static/frame/js/main.js</code>文件，ajax提交时，系统会在请求头自动加上验证字段。</p>
        <pre><code class="javascript">//ajax.js
jQuery(document).ajaxSend(function(event, xhr, settings) {
    function getCookie(name) {
        var reg = new RegExp("(^| )" + name + "(?:=([^;]*))?(;|$)"),
            val = document.cookie.match(reg);
        return val ? (val[2] ? unescape(val[2]) : "") : null;
    }
    if (typeof xhr.setRequestHeader == "function") {
        if (getCookie('csrf_cookie_name')) {
            xhr.setRequestHeader('X-CSRF-TOKEN', getCookie('csrf_cookie_name'));
        }
    }
});</code></pre>
        <p>POST请求同样也会触发csrf验证，需要在form中添加如下数据字段：</p>
        <pre><code class="html">// 加在form中提交
&lt;input type="text" name="_csrf" hidden value="&lt;{form_token type="token"}&gt;"/&gt;
// 或直接传form参数通过smarty生成一个完整的input
&lt;{form_token type="form"}&gt;</code></pre>
        <p>同样也可以在js中获取（前提是引用<code>/static/frame/js/main.js</code>JS文件），加在POST参数中即可。</p>
        <pre><code class="javascript">var _csrf = getCookie('csrf_cookie_name');</code></pre>
        <h2 id="router-restful">Restful</h2>
        <p>Kali也同时支持restful协议的请求</p>

        <h2 id="router-check">权限验证</h2>
        <p>框架中提供了一套完整的权限验证逻辑，可对路由下所有<code>method</code>进行权限验证</p>
        <p>用户需要在入口处（index.php）中添加权限验证配置，具体如下</p>
        <pre><code class="php"># 权限控制程序信息
$purview_config = [
    'auto_check'        => true,                        // 自动加载权限检查
    'menu_file'         => 'admin_menu.xml',            // 获取菜单和用户权限配置
    'login_url'         => '?ct=index&ac=login',        // 用户登录入口地址
];

# APP信息
$app_config = [
    'app_title'         => 'KaliPHP',                   // APP标题
    'app_name'          => 'app',                       // APP名称，app代码和模版都受到这个控制
    'session_start'     => true,                        // 是否启用session
    'purview_config'    => $purview_config,             // 权限控制程序信息
];

kali::registry( $app_config );</code></pre>
        <p>如果需要接管权限验证类，可添加auto_check_handle参数，记得接管类要继承cls_auth，否则cls_auth完整的安全体系就失效了。</p>
        <pre><code class="php">'auto_check_handle' => ['member\model\mod_auth', 'auth']</code></pre>
    </div>

    <div class="bs-docs-section">
        <h1 id="config" class="page-header">配置</h1>
        <p>程序配置分三块，一块是系统配置，一块是程序配置，一块是数据库配置</p>
        <p><code>/config/</code> 系统配置路径</p>
        <p><code>/app/config/</code> 程序配置路径</p>
        <p><code>#PB#_config</code> 数据库配置表</p>

        <h2 id="config-system">系统配置</h2>
        <p><code>/config/config.php</code> 系统基本配置（包括默认路由，自定义路由配置等）</p>
        <pre><code class="php">return array(

    //请求配置
    'request' => array(
        'csrf_token_on'     =&gt; true,                 // 是否开启令牌验证
        'csrf_token_name'   =&gt; 'csrf_token_name',    // 令牌验证的表单隐藏字段名称
        'csrf_token_reset'  =&gt; true,                 // 令牌验证出错后是否重置令牌 默认为true
        'csrf_cookie_name'  =&gt; 'csrf_cookie_name',   // 令牌存放的cookie名称
        'csrf_expire'       =&gt; 7200,                 // 令牌过期时间
        'csrf_exclude_uris' =&gt; array(                // 不检查的url，通常是ajax的url
            'ct=oauth&ac=authorize',
            'ct=upload&ac=upload',
            'ct=upload&ac=upload_html5',
            'ct=upload&ac=upload_chunked',
        ),

        'global_xss_filtering' =&gt; true,
    ),

    // COOKIE设置
    'cookie' =&gt; array(
        'prefix'   =&gt; 'kali_',                  // cookie前缀
        'pwd'      =&gt; 'pwd',                    // cookie加密码，密码前缀
        'expire'   =&gt; 7200,                     // cookie超时时间
        'path'     =&gt; '/',                      // cookie路径
        'domain'   =&gt; null,                     // 正式环境中如果要考虑二级域名问题的应该用 .xxx.com
        'secure'   =&gt; false,
        'httponly' =&gt; false,
    ),

    //响应配置
    'response' =&gt; array(
        'jsonContentType' =&gt; 'application/json',
        'objectEncode'    =&gt; true, //object对象是否转义
    ),

    //语言包设置
    'language' =&gt; array(
        'default'  =&gt; 'en',     // 默认语言包
        'fallback' =&gt; 'en',     // 默认语言包不存在的情况下调用这个语言包
        'locale'   =&gt; 'en_US',
        'always_load' =&gt; array( // 总是自动加载
            'common', 'form_validate', 'upload'
        ),
    ),

    // 程序分析
    'profiler' =&gt; array(
        'benchmarks'         =&gt; true,
        'config'             =&gt; true,
        'controller_info'    =&gt; true,
        'http_headers'       =&gt; true,
        'uri_string'         =&gt; true,
        'get'                =&gt; true,
        'post'               =&gt; true,
        'cookie_data'        =&gt; true,
        'session_data'       =&gt; true,
        'memory_usage'       =&gt; true,
        'queries'            =&gt; true,
        'query_toggle_count' =&gt; 25,
    ),

    // 安全相关配置
	'security' =&gt; array(
        // 指定某些IP允许开启调试，数组格式为 array('ip1', 'ip2'...)
        'safe_client_ip' =&gt; array(
            '127.0.0.1',
            '101.1.18.36'
        ),
        // IP白名单
        'ip_whitelist' =&gt; array(),
        // IP黑名单
        'ip_blacklist' =&gt; array(),
        // 国家白名单
        'country_whitelist' =&gt; array(),
        // 国家黑名单
        'country_blacklist' =&gt; array('CN'),
    ),

    //日志相关配置
    'log' =&gt; array(
        //错误类型
        'log_type'          =&gt; 'file',
        //错误级别
        //'log_threshold'     =&gt; ERROR,
        'log_threshold'     =&gt; array(ERROR, WARNING, NOTICE, DEBUG, INFO),
        //错误日期格式
        'log_date_format'   =&gt; 'Y-m-d H:i:s',
        'log_chrome'        =&gt; false,
        // 那些请求方法提交的数据会被记录
        'log_request_methods'  =&gt; array(
            'POST',
            //'*',
            //'GET', 'POST', 'PUT', 'DELETE',
        ),
        // 那些请求URL提交的数据会被记录
        'log_request_uris'  =&gt; array(
            '*',
            //'ct=index&ac=index',
        ),
        //MYSQL慢查询阀值
        'slow_query'        =&gt; 1000,
    ),

    //缓存相关配置
    'cache' =&gt; array(
        'enable'     =&gt; true,
        'prefix'     =&gt; 'mc_df_',
        'cache_type' =&gt; 'redis',
        'cache_time' =&gt; 7200,
        'cache_name' =&gt; 'cfc_data',
        'memcache' =&gt; array(
            'timeout' =&gt; 1,
            'servers' =&gt; array(
                array( 'host' =&gt; '127.0.0.1', 'port' =&gt; 11211, 'weight' =&gt; 1 ),
            )
        ),
        // redis目前只支持单台服务器
        'redis' =&gt; array(
            'timeout' =&gt; 30,
            'server' =&gt; array( 'host' =&gt; '127.0.0.1', 'port' =&gt; 6379, 'pass' =&gt; 'foobared')
        ),

        'session' =&gt; array(
            'type'   =&gt; 'cache',      // session类型 default || cache || mysql
            'expire' =&gt; 1440,         // session 回收时间 默认24分钟:1440、一天:86400
        ),
        // 开启redis自动序列化存储
        'serialize' =&gt; true,
    ),

    'timezone_set' =&gt; 'Asia/Shanghai',

    //异常配置
    'exception' =&gt; array(
        //返回页面
        'exception_tpl' =&gt; 'error/exception',
        'error_tpl' =&gt; 'error/msg',

        'messages' =&gt; array(
            500 =&gt; '网站有一个异常，请稍候再试',
            404 =&gt; '您访问的页面不存在',
            403 =&gt; '权限不足，无法访问'
        )
    ),


)</code></pre>
        <p><code>/config/autoload.php</code> 系统自动加载类的配置</p>
        <p><code>/config/exception.php</code> 系统异常配置类</p>
        <p><code>/config/http.php</code> HTTP请求基本错误码</p>
        <p><code>/config/database.php</code> 数据库链接配置</p>
        <p>用户可通过<code>config::instance('config')->get</code>方法获取</p>
        <p>简单例子：</p>
        <pre><code class="php">/config/config.php
return array(
    'session_name' =&gt; 'kali_sessionid'
}

// 程序中获取方式 第二个参数为文件名（默认为config可不传）第三个参数为是否使用别名（默认为true）
config::instance('config')->get('session_name', 'config', true);</code></pre>

        <h2 id="config-app">程序配置</h2>
        <p>程序配置目录在<code>/app/config/</code>中</p>
        <p>默认有<code>database.php</code>（数据库连接配置） 和 <code>config.php</code>（默认配置路径）</p>
        <p>使用方式也与系统配置基本一致</p>
        <pre><code class="php">/app/config/database.php
return array(
    // 数据库相关配置
    'config' => array(
        'user'       =&gt; 'kaliphp',
        'pass'       =&gt; 'kaliphp',
        'name'       =&gt; 'kaliphp',
        'charset'    =&gt; 'utf8',
        'prefix'     =&gt; 'kali',
    )
)

// 程序中获取方式 第二个参数为文件名（默认为config可不传）第三个参数为是否使用别名（默认为true）
config::instance('app_config')->get('config', 'database');</code></pre>

        <h2 id="config-db">数据库配置</h2>
        <p>数据库配置表是<code>#PB#_config</code></p>
        <p>使用方式也与系统配置基本一致</p>
        <pre><code class="php">#PB#_config
表字段：name、group、value

// 数据库中获取方式 第一个参数为name字段 第二个参数为group字段（默认为config可不传）第三个参数为是否使用别名（默认为true） 返回结果为value字段
config::instance('db_config')->get('site_name', 'config');</code></pre>

        <h2 id="config-env">环境配置</h2>
        <p>系统对不同环境的配置是可以做区分的</p>
        <p>系统配置在<code>/web/index.php</code>中</p>
        <pre><code class="php">// dev pre pub 当前环境
defined('SYS_ENV') or define('SYS_ENV', 'dev');</code></pre>

        <p>当程序调用<code>config::instance()->get</code>时，系统会自动查找对应的配置文件</p>
        <pre><code class="php">// 当前环境dev 会自动查找 /config/config_dev.php文件
config::instance()-&gt;get('test', 'config');

// 当前环境pub 会自动查找 /config/database_pub.php文件
config::instance()-&gt;get('test2', 'database');</code></pre>

        <p>公用配置文件可以放在不添加环境名的文件中，如<code>/config/config.php</code></p>
        <p>在系统中同时存在<code>config.php</code>和<code>config_dev.php</code>时，带有环境配置的文件内容会覆盖通用配置</p>
        <pre><code class="php">// /app/config/database.php
return array(
    'test' => 'database',
    'demo' => 'database',
);

// /app/config/database_dev.php
return array(
    'test' => 'database_dev'
);

// 返回 'database_dev'
config::instance('app_config')->get('test', 'database');

// 返回 'database'
config::instance('app_config')->get('demo', 'database');</code></pre>
        <p>系统配置和程序配置中的使用方法相同</p>

        <h2 id="config-alias">别名使用</h2>
        <p>配置中是支持别名的使用的，在别名两边加上<code>@</code>即可</p>
        <p>系统默认有个别名 <code>web</code>会替换当前路径</p>
        <pre><code class="php">/config/config.php
return array(
    'path' =&gt; '@web@/my-path/'
);

// 返回 '/kali/my-path/'
config::instance('config')-&gt;get('path');</code></pre>

        <p>用户也可以自定义别名，例如</p>
        <pre><code class="php">// config-&gt;get 之前执行
config::instance('config')-&gt;set_alias('time', time());

// config.php
return array(
    'path' =&gt; '@web@/my-path/?time=@time@'
);

// 返回 '/kali/my-path/?time=1461141347'
config::instance('config')-&gt;get('path');

// 返回 '@web@/my-path/?time=@time@'
config::instance('config')-&gt;get('path', 'config', false);</code></pre>

        <p>当然如果需要避免别名转义，也可以在<code>config::instance('config')->get</code>第三个参数传<code>false</code>，就不会执行别名转义了。</p>
    </div>

    <div class="bs-docs-section">
        <h1 id="dao" class="page-header">数据库使用</h1>
        <p>为了简化调用，KaliPHP框架数据库主要考虑使用mysql，并没有考虑其他数据库的情况，因此并没有很复杂的数据库驱动之类的数据类结构，并且只支持<code>mysqli</code>函数，使用时记得安装<code>mysqli</code>扩展。</p>
        <p>db类的成员方法都是静态方法，因此使用时不需要初始化。</p>

        <h2 id="dao-connect">连接配置</h2>
        <p>数据库库信息都配置在<code>/app/config/database.php</code>中，也可根据环境配置在<code>database_dev.php</code>/<code>database_pre.php</code>/<code>database_pub.php</code>里面</p>
        <p>基本参数如下：</p>
        <pre><code class="php">/app/config/database_dev.php
return array(
    'config' => array(
        // 库名
        'name'       =&gt; 'kali',
        // 用户名
        'user'       =&gt; 'root',
        // 密码
        'pass'       =&gt; 'pwd',
        // 端口号
        'port'       =&gt; 3306,
        // 编码格式
        'charset'    =&gt; 'utf8',
        // 是否长链接（默认关闭, mysqli的长链问题很多）
        'keep-alive' =&gt; true,
        // 表前缀
        'prefix'     =&gt; 'kali',
        // 是否对SQL语句进行安全检查并处理，在插入十万条以上数据的时候会出现瓶颈
        'safe_test'  =&gt; true,
        // 慢查询阀值，秒
        'slow_query' =&gt; 0.5,
        // 库IP
        'host' =&gt; array(
            // 主库IP
            'master' =&gt; '192.168.0.2:3306',
            // 从库IP, 支持多个从库，随机链接
            'slave'  =&gt; array('192.168.0.3:3306', '192.168.0.4:3306', '192.168.0.5:3306')
        ),
        // 字段加密key
        'crypt_key' =&gt; 'key',
        // 需要加解密字段, 字段类型记得采用BLOB
        'crypt_fields' =&gt; array(
            'kali_member' =&gt; array( 'name', 'age', 'email', 'address' ),
        ),

    )
)</code></pre>

        <p>数据库库信息都配置在<code>/app/config/database.php</code>中，也可根据环境配置在<code>database_dev.php</code>/<code>database_pre.php</code>/<code>database_pub.php</code>里面</p>

    <h2 id="dao-slave">主从操作</h2>

    <p>框架支持配置多个从库，操作数据库时会自动判断，<code>增删改</code>操作主库，<code>查询</code>操作从库</p>
    <p>如果需要强制使用主库：</p>
    <p>1、程序上下文有对数据修改并且需要立刻获得修改结果的时候，常见于订单生成接口<br />
    2、操作事务的时候</p>
    <p>这个时候我们可以在操作的时候指定使用主库</p>
    <p><code>$query->execute(true)</code></p>
    <p>还可以设置从库状态为 false</p>
    <p><code>db::enable_slave(false)</code></p>


        <h2 id="dao-simple">基础查询</h2>
        <pre><code class="php">db::query($sql)->execute($is_master = false);</code></pre>
        <p>$is_master 是读写分离参数，默认false为智能操作，查询操作从库，增删改操作主库，true为强制操作主库</p>
        <h2 id="dao-return">返回值</h2>
        <p>返回值是根据查询类型而变化的</p>
        <p><b>SELECT:</b><br />
            1、无数据返回 array()<br />
            2、默认返回多维数组<br />
            3、使用as_row()后返回一维数组<br />
            4、使用as_field()后返回第一个元素<br />
            5、使用as_result()后返回结果集</p>
        <p><b>INSERT:</b><br />
        array( insert id, affected rows )</p>
        <p><b>UPDATE & DELETE:</b><br />
        affected rows</p>
        <h2 id="dao-select">查询数据</h2>
        <p>查询数据支持两种字段选择方式：字符串（字段以逗号隔开）、数组，如果需要使用db::expr()方法，请使用数组方式</p>
        <pre><code class="php">// SELECT `id`,`name` FROM `users`
// 字符串
$result = db::select('id, name')-&gt;from('users')-&gt;execute();
// 数组
$resutl = db::select(array('id', 'name'))-&gt;from('users')-&gt;execute();

// SELECT DISTINCT `name` FROM `users`
$users = db::select('name')-&gt;from('users')-&gt;distinct(true)-&gt;execute();

// SELECT `company_id`, COUNT(DISTINCT `order_id`) AS `count`
$users = db::select(array('name', db::expr('COUNT(DISTINCT `order_id`)')))
    -&gt;from('users')-&gt;distinct(true)-&gt;execute();

// Use as_row() to get a piece of data
$user = db::select('name')->from('users')->as_row()->execute();

// SELECT COUNT(*) AS `count` FROM `users`
$result = db::select('COUNT(*) AS `count`')->from('users')->as_row()->execute();</code></pre>
        <h2 id="dao-insert">增加数据</h2>
        <p>单条数据增加可采用<code>set</code>方法, 成功返回（<code>自增ID</code> 和 <code>受影响行数</code>）</p>
        <pre><code class="php">// INSERT INTO `users`(`name`,`email`,`password`)
// VALUES ("John Random", "john@example.com", "s0_s3cr3t")
list($insert_id, $rows_affected) = db::insert('users')-&gt;set(array(
    'name' =&gt; 'John Random',
    'email' =&gt; 'john@example.com',
    'password' =&gt; 's0_s3cr3t',
))-&gt;execute();</code></pre>
        <p>批量增加数据可采用<code>columns</code>和<code>values</code>组合方法</p>
        <pre><code class="php">// INSERT INTO `users`(`name`,`email`,`password`)
// VALUES ("John Random", "john@example.com", "s0_s3cr3t"),
// ("Sam Chen", "sam@example.com", "s0_s4cr4t")
list($insert_id, $rows_affected) = db::insert('users')->columns(array(
    'name', 'email', 'password'
))-&gt;values(array(
    array('John Random', 'john@example.com', 's0_s3cr3t'),
    array('Sam Chen', 'sam@example.com', 's0_s3cr4t')
))-&gt;execute();</code></pre>
        <h2 id="dao-update">修改数据</h2>
        <p>单字段修改可采用<code>value</code>方法, 成功返回（<code>受影响行数</code>）</p>
        <pre><code class="php">// UPDATE `users` SET `name` = "John Random" WHERE `id` = "2";
$rows_affected = db::update('users')
    -&gt;value("name", "John Random")
    -&gt;where('id', '=', '2')
    -&gt;execute();</code></pre>
        <p>多字段修改可采用<code>set</code>方法</p>
        <pre><code class="php">// UPDATE `users`
// SET `group` = "Peter Griffon", `email` = "peter@thehindenpeter.com"
// WHERE `id` = "16";
$rows_affected = db::update('users')
    -&gt;set(array(
        'name'  =&gt; "Peter Griffon",
        'email' =&gt; "peter@thehindenpeter.com"
    ))
    -&gt;where('id', '=', '16')
    -&gt;execute();</code></pre>
        <h2 id="dao-delete">删除数据</h2>
        <p>删除操作成功返回（<code>受影响行数</code>）</p>
        <pre><code class="php">// DELETE FROM `users`
$rows_affected = db::delete('users')-&gt;execute(); // (int) 20

// DELETE FROM `users` WHERE `email` LIKE "%@example.com"
$rows_affected = db::delete('users')-&gt;where('email', 'like', '%@example.com')-&gt;execute(); // (int) 7</code></pre>

        <h2 id="dao-join">多联表</h2>
        <p>框架支持多连表模型: <code>join</code>（全联接），<code>left join</code>（左联接），<code>right join</code>（右联接）方法</p>
        <pre><code class="php">// SELECT * FROM `users` LEFT JOIN `roles` ON `roles`.`id` = `users`.`role_id`
db::select()-&gt;from('users')-&gt;join('roles','LEFT')-&gt;on('roles.id', '=', 'users.role_id');

// SELECT * FROM `users` RIGHT OUTER JOIN `roles` ON `roles`.`id` = `users`.`role_id`
db::select()-&gt;from('users')-&gt;join('roles','right outer')-&gt;on('roles.id', '=', 'users.role_id');</code></pre>
        <p>多次使用<code>join</code>方法可以继续联接，理论上可以建立任意数量的关联表。</p>

        <h2 id="dao-filter">选择器</h2>
        <p>选择器用于筛选表内数据，参数可以为两个或者三个，两个相当于<code>=</code>号省略不写。</p>
        <pre><code class="php">// SELECT * FROM `users` WHERE `id` = 1
$result = db::select()-&gt;from('users')-&gt;where('id', 1)-&gt;execute();
$result = db::select()-&gt;from('users')-&gt;where('id', '=', 1)-&gt;execute();


// SELECT * FROM `users` WHERE `id` != 1
$result = db::select()-&gt;from('users')-&gt;where('id', '!=', 1)->execute();

// SELECT * FROM `users` WHERE `delete_user` IS NOT NULL
$result = db::select()-&gt;from('users')-&gt;where('delete_user', '!=', NULL)->execute();

// SELECT * FROM `users` WHERE `name` LIKE "john%"
$result = db::select()-&gt;from('users')-&gt;where('name', 'like', 'john%')-&gt;execute();</code></pre>
        <p><code>IN</code>、<code>BETWEEN</code>等多值方式需要传递一维数组参数</p>
        <pre><code class="php">// SELECT * FROM `users` WHERE `id` IN (1,2,3)
$id_array = array(1,2,3);
$result = db::select()-&gt;from('users')-&gt;where('id', 'in', $id_array)-&gt;execute();

// SELECT * FROM `users` WHERE `id` BETWEEN 1 AND 2
$result = db::select()-&gt;from('users')-&gt;where('id', 'between', array(1,2))-&gt;execute();</code></pre>
        <p>多条件查询可采用数组或者迭代调用</p>
        <pre><code class="php">// SELECT * FROM `users` WHERE `name` LIKE "john%" AND `sex`='1'
// 数组方式
$where = array(
    array('name', 'like', 'john%'),
    array('sex', '=', 1)
);
$result = db::select()-&gt;from('users')-&gt;where($where)-&gt;execute();

// 迭代方式
$where = array();
$query = db::select()-&gt;from('users');
if ( !empty($keyword))
{
    $query-&gt;where('name', 'like', "%{$keyword}%");
    $query-&gt;where('enname', 'like', "%{$keyword}%");
}
$query-&gt;execute();</code></pre>

        <h2 id="dao-extracts">复杂选择</h2>
        <p>除了正常的匹配选择以外，框架还提供了其他复杂选择器。</p>
        <pre><code class="php">// SELECT * FROM `users` WHERE (`name` = 'John' AND `email` = 'john@example.com')
// OR (`name` = 'mike' OR `name` = 'dirk')
$result = db::select()-&gt;from('users')-&gt;where_open()
    -&gt;where('name', 'John')
    -&gt;and_where('email', 'john@example.com')
-&gt;where_close()
-&gt;or_where_open()
    -&gt;where('name', 'mike')
    -&gt;or_where('name', 'dirk')
-&gt;or_where_close()-&gt;execute();</code></pre>

        <h2 id="dao-group">其他条件</h2>
        <p><code>order by</code>语句支持迭代调用方式</p>
        <pre><code class="php">// SELECT * FROM `users` ORDER BY `name` ASC
db::select()-&gt;from('users')-&gt;order_by('name', 'asc');

// 迭代调用
// SELECT * FROM `users` PRDER BY `name` ASC, `surname` DESC
db::select()-&gt;from('users')-&gt;order_by('name', 'asc')-&gt;order_by('surname', 'desc');</code></pre>
        <p><code>group by</code>语句单字段情况下传递字符串即可，多字段需要传递数组</p>
        <pre><code class="php">// SELECT * FROM `users` GROUP BY `age`
db::select()-&gt;from('users')-&gt;group_by('age');

// SELECT * FROM `users` GROUP BY `age`,`sex`
$group = array('age', 'sex');
db::select()-&gt;from('users')-&gt;group_by($group);</code></pre>

        <p><code>Limit && Offset</code></p>
        <pre><code class="php">// SELECT * FROM `users` LIMIT 1
db::select()-&gt;from('users')-&gt;limit(1);

// SELECT * FROM `users` LIMIT 10 OFFSET 5
db::select()-&gt;from('users')-&gt;limit(10)-&gt;offset(5);</code></pre>

        <h2 id="dao-expression">防止构建</h2>
        <p>正常情况下，传递参数进去后会被构建器重新构建成表达式，<code>expr</code>方法会返回一个db_expression类对象，可以防止表达式被重新构建，保留它原来的样子。</p>
        <pre><code class="php">$expr = db::expr('columnname + 1');</code></pre>
        <pre><code class="php">// SELECT `company_id`, COUNT(DISTINCT `order_id`) AS `count` FROM `order`
db::select( array('company_id', db::expr('COUNT(DISTINCT `order_id`) AS `count`')) )
   -&gt;from('order')
   -&gt;group_by('company_id')
   -&gt;execute();</code></pre>
        <h2 id="dao-command">SQL模版</h2>
        <p>框架中提供了上述<code>选择器</code>，<code>条件语句</code>，<code>联表</code>等，基本覆盖了所有sql语法，但可能还有部分生僻的用法无法被实现，
        于是这里提供了一种SQL模版的使用方式，支持用户自定义SQL语句，但<code>并不推荐用户使用</code>，如果一定要使用的话，请务必自己做好<code>防SQL注入</code></p>

        <p>你可以使用框架提供的标准占位符，他是一个字符串，以冒号（:varname）为前缀。</p>
        <pre><code class="php">$name = 'John'; // 设置要绑定的变量
$query = "SELECT * FROM users WHERE username = :name"; // 要执行的表达式

// 绑定变量执行查询, 相当于执行 SELECT * FROM users WHERE username = 'John'
$result = db::query($query)->bind('name', $name)->execute();

// 也可以用param方法，param是bind方法的别名
$result = db::query($query)->param('name', $name)->execute();</code></pre>
        <p>多个参数绑定采用数组穿参</p>
        <pre><code class="php">$params = array('name' =&gt; 'John', 'state' =&gt; 'new'); // 设置要绑定的变量
$query = "SELECT * FROM users WHERE username = :name AND state = :state"; // 要执行的表达式

// 绑定变量执行查询，相当于执行 SELECT * FROM users WHERE username = 'John' AND state = 'new'
$result = db::query($query)-&gt;parameters($params)-&gt;execute();</code></pre>

        <h2 id="dao-cursor">游标数据</h2>
        <p>如果DB中取出的数据非常大，而PHP中却无法承受这么大量的内存可以用来处理，这时候就需要用到游标了</p>
        <p>游标可以将复合条件的数据逐一取出，在程序中进行分批处理，从而降低大数据所带来的内存瓶颈</p>
        <pre><code class="php">// 选择器，条件类模式完全一样，在获取数据时使用as_result方法
$rsid = db::query( $sql )->as_result()->execute();
while( $row = db::fetch($rsid) )
{
    //do something...
}</code></pre>
        <h2 id="dao-transaction">事务处理</h2>
        <p>框架提供了一套简单的事务处理机制，默认是关闭的，可以通过<code>db::start()</code>方法开启</p>
        <p><code>注意：</code>请确保连接的数据表是<code>innodb</code>的存储引擎，否者事务并不会生效。</p>

        <p>在<code>db::start()</code>之后可以通过<code>db::commit()</code>来进行完整事务的提交保存，但并不会影响<code>start</code>之前的操作</p>
        <p>同理，可以通过<code>db::rollback()</code>进行整个事务的回滚，回滚所有当前未提交的事务</p>
        <p>当程序调用<code>db::end()</code>方法后事务会全部终止，未提交的事务也会自动回滚，另外，程序析构时，也会自动回滚未提交的事务</p>

        <pre><code class="php">// 在事务开始前的操作都会默认提交，num:0
db::update('#PB#_test')-&gt;set(array('num'=&gt;0))-&gt;where('id', 1)-&gt;execute();
// 开始事务
db::start();
// set num = num+2
db::update('#PB#_test')-&gt;set(array('num'=&gt;db::expr('`num`+1')))-&gt;where('id', 1)-&gt;execute();
db::update('#PB#_test')-&gt;set(array('num'=&gt;db::expr('`num`+1')))-&gt;where('id', 1)-&gt;execute();
// 回滚事务
db::rollback();
// 当前num还是0，事务操作请务必调用主库查询
$num = db::select('num')-&gt;from('#PB#_test')-&gt;where('id', 1)-&gt;as_field()-&gt;execute(true);
// set num = num+2
db::update('#PB#_test')-&gt;set(array('num'=&gt;db::expr('`num`+1')))-&gt;where('id', 1)-&gt;execute();
db::update('#PB#_test')-&gt;set(array('num'=&gt;db::expr('`num`+1')))-&gt;where('id', 1)-&gt;execute();
// 提交事务
db::commit();
// num = 2，事务操作请务必调用主库查询
$num = db::select('num')-&gt;from('#PB#_test')-&gt;where('id', 1)-&gt;as_field()-&gt;execute(true);
// 关闭事务
db::end();</code></pre>

        <p>另外，事务的开启并不会影响<code>select</code>操作，只对增加，删除，修改操作有影响</p>
         <p>还有就是，框架默认是主从操作以缓解数据库查询压力，但是数据库主从同步需要时间而且远比PHP执行效率要低，开始事务、回滚事务、提交事务、关闭事务会自动调用主库，增加，删除，修改操作也会自动调用主库，所以用户只需要在查询操作时强制使用主库( <code>execute(true)</code> )即可</p>

        <h2 id="dao-cache">数据缓存</h2>


        <h2 id="dao-log">语句调试</h2>
        <p>SQL调试方法已经集成在框架事件中，只需要在需要调试语句的方法前调用<code>event::on(onSql)</code>就可以在<code>页面控制台</code>中输出sql语句了</p>
        <pre><code class="php">// one方法绑定一次事件，输出一次后自动释放
event::one(onSql);
$data = db::query()->execute();

// on方法绑定事件，直到off释放前都会有效
event::on(onSql);
$data = db::query()-&gt;execute();
$data = db::query()-&gt;execute();
$data = db::query()-&gt;execute();
event::off(onSql);</code></pre>

        <p>该SQL事件功能还可自行绑定方法，具体用法会在后面<code>事件</code>介绍中详细展开</p>
    </div>

    <div class="bs-docs-section">
        <h1 id="view" class="page-header">页面渲染</h1>
        <p>居于简洁的原则出发，视图直接使用了Smarty模板引擎，在Smarty上做了二次开发，增加自由函数、自定义block标循环插件，操作十分简单。</p>
        <p>视图层目录在<code>/app/template/</code>下面，可以在<code>Action</code>层中通过<code>tpl::display()</code>方法输出模板</p>

        <h2 id="view-param">渲染参数</h2>
        <p><code>display</code>方法只有一个参数，指定<code>template</code>文件</p>
        <pre><code class="php">// 给模板变量赋值
tpl::assign('test', 1);
tpl::assign('path', '/test.png');
// 显示视图/app/template/main/test.tpl
tpl::display('main/test');

/* /app/template/main/test.tpl
返回:
&lt;div class="container">
    &lt;span> 1 &lt;/span>
    &lt;img src="/test.png"/>
&lt;/div> */
&lt;div class="container"&gt;
    &lt;span&gt; &lt;{$test}&gt; &lt;/span&gt;
    &lt;img src="&lt;{$path}&gt;"/&gt;
&lt;/div&gt;</code></pre>

        <p>使用tpl类，需要特别注意的事项是关于 $tpl 这个值的设置，在 app 入口中，定义了如下配置: </p>
        <pre><code class="php">$app_config = array(
    'app_name' =&gt; 'app',
);</code></pre>
        <h2 id="view-func">自定义函数插件</h2>
        <p>对应文件为：<code>smarty_plugins/function.tagname.php</code>, 与普通函数调用不同之处是，这是属于动态触发的插件函数，而非自由函数。</p>
        <pre><code class="php">&lt;{myfunc att1=$arr.title att2='8'}&gt;</code></pre>

        <h2 id="view-block">自定义block标循环插件</h2>
        <p>对应文件为：<code>smarty_plugins/block.tagname.php</code>, 相当于函数返回foreach里的from值</p>
        <pre><code class="php">&lt;{myblock key=k item=v}&gt;
    &lt;{$k}&gt; -- &lt;{$v}&gt;
&lt;{/myblock}&gt;</code></pre>

        <h2 id="view-xss">反XSS注入</h2>

    </div>

    <div class="bs-docs-section">
        <h1 id="event" class="page-header">事件</h1>
        <p>框架中提供了事件机制，可以方便全局调用。其中系统默认已提供的有<code>beforeAction</code>，<code>afterAction</code>，<code>onException</code>，<code>onSql</code>这几个</p>
        <p><code>beforeAction</code>为Action执行前执行的事件（在<code>init()</code>方法之后被触发）</p>
        <p><code>afterAction</code>为Action执行后执行的事件（会在渲染页面之前触发）</p>
        <p><code>onException</code>系统抛出异常时被触发，会传递错误code，在<code>/config/exception.php</code>中定义code</p>
        <p><code>onSql</code>执行语句时被触发，上述例子中的<code>event::on(onSql)</code>就是使用了该事件</p>

        <h2 id="event-init">定义事件</h2>
        <p>系统提供了两种定义事件的方式，一种是定义长期事件<code>$fd = event::on($event, [$class, $method])</code>，直到被off之前都会生效。</p>
        <p>参数分别为<code>事件名</code>，<code>方法[类，方法名]</code></p>
        <p><code>$fd</code>返回的是该事件的操作符。在调用off方法时，可以通过传递该操作符解绑该事件。</p>

        <pre><code class="php">namespace admin\control;
/**
* 主页Action
*/
class ctl_index extends ctl_base
{
    //构造函数
    public function init()
    {
        // 要触发beforeAction事件，可在init里定义，会在init之后被触发
        event::on(beforeAction, array($this, 'test_event'));
    }

    //默认路由index
    public function index()
    {
        // 绑定testService里的my_event1方法 和 my_event2方法 到 myEvent事件中，两个方法都会被执行，按绑定先后顺序执行
        $fd1 = event::on('myEvent', array($this->testService, 'my_event1'));
        $fd2 = event::on('myEvent', array($this->testService, 'my_event2'));

        // do something .....

        // 解绑myEvent事件的 my_event1方法
        event::off('myEvent', $fd1);

        // 解绑myEvent事件，所有绑定在该事件上的方法都不会再被执行
        event::off('myEvent');

        exit('测试一下');
    }

    // 自定义的事件类
    public function test_event($event)
    {
        // addLog为写日志的方法
        log::info('触发beforeAction事件');
    }
}</code></pre>

        <p>另一种绑定则为一次绑定事件<code>event::one()</code>，调用参数相同，返回<code>$fd</code>操作符，当该事件被触发一次后会自动解绑</p>
        <pre>$fd = event::one('myEvent', array($this, 'my_event'));</pre>

        <p>当然如果想要绑定多次但非长期绑定时，系统也提供了<code>bind</code>方法，参数用法类似。</p>
        <pre>// 第一个参数绑定方法，第二个为事件名，第三个为绑定次数，触发次数满后自动释放
$fd = event::bind(array($this, 'my_event'), 'myEvent', $times);</pre>

        <h2 id="event-trigger">触发事件</h2>
        <p>用户可以自定义事件，同时也可以选择性的触发，可以直接使用<code>event::trigger($event, $params)</code>方法</p>
        <p>参数有两个，第一个为触发的事件名，第二个为触发传递的参数，会传递到触发方法中执行</p>
        <pre><code class="php">// 触发myEvent事件
event::trigger('myEvent', array(get_class($this), 'test'))

// 定义事件时绑定的方法
public function my_event($event, $params)
{
    // array('testService', 'test')
    var_dump($params);
}</code></pre>

    </div>

    <div class="bs-docs-section">
        <h1 id="forms" class="page-header">表单验证</h1>
        <p>框架提供了一套完整的表单验证解决方案，适用于绝大多数场景。</p>
        <p>表单验证支持所有类型的验证以及自定义方法、自定义错误信息。</p>
        <p>简单示例：</p>
        <pre><code class="php">namespace admin\control;
class ctl_user extends ctl_base
{
    // 自定义验证方法
    public function username_check()
    {
        // 设置验证规则
        $val = cls_validate::instance()
            -&gt;set_rules('username', 'Username', 'required|minlength[5]|maxlength[12]')
            -&gt;set_rules('password', 'Password', 'required|minlength[8]')
            -&gt;set_rules('passconf', 'Password Confirmation', 'required|matches[password]')
            -&gt;set_rules('email', 'Email', 'required|email');

        // 运行验证程序。成功返回 TRUE，失败返回 FALSE
        if ($val-&gt;run() == FALSE)
        {
            tpl::display('myform');
        }
        else
        {
            tpl::display('formsuccess');
        }

    }
}</code></pre>

        <h2 id="forms-type">验证类型</h2>
        <p>系统提供了21种默认验证方式，验证失败时都会记录错误信息，用户可以通过<code>error($field = '', $prefix = '', $suffix = '')
</code>方法获取</p>
        <p><code>required</code> 必选字段</p>
        <p><code>remote</code> 请修正该字段</p>
        <p><code>email</code> 请输入正确格式的电子邮件</p>
        <p><code>url</code> 请输入合法的网址</p>
        <p><code>date</code> 请输入合法的日期</p>
        <p><code>numeric</code> 数字类型，包括整型、浮点型</p>
        <p><code>integer</code> 整型类型，包括正数，负数</p>
        <p><code>decimal</code> 只能输入小数</p>
        <p><code>idcard</code> 请输入合法的身份证号</p>
        <p><code>creditcard</code> 请输入合法的信用卡号</p>
        <p><code>matches[param]</code> 请再次输入相同的值</p>
        <p><code>accept</code> 请输入拥有合法后缀名的字符串</p>
        <p><code>maxlength[param]</code> 长度不能大于 {param} 位</p>
        <p><code>minlength[param]</code> 长度不能小于 {param} 位</p>
        <p><code>exactlength[param]</code> 长度只能等于 {param} 位</p>
        <p><code>rangelength[minlen:maxlen]</code> 长度介于 {minlen} 和 {maxlen} 之间</p>
        <p><code>max[param]</code> 请输入一个最大为 {param} 的值</p>
        <p><code>min[param]</code> 请输入一个最小为 {param} 的值</p>
        <p><code>range[minnum:maxnum]</code> 请输入一个介于 {minnum} 和 {maxnum} 之间的值</p>
        <p>验证类型几乎涵盖了所有情况，如果有不能满足的类型，用户可以自定义验证方法，上述例子中已有，不再过多阐述</p>
    </div>
    <h2 id="forms-array">数组方式</h2>
    <p>验证类除了迭代方式，还支持使用数组来设置验证规则</p>
    <pre><code class="php">$config = array(
    array(
        'field' => 'username',
        'label' => 'Username',
        'rules' => 'required'
    ),
    array(
        'field' => 'password',
        'label' => 'Password',
        'rules' => 'required',
        'errors' => array(
            'required' => 'You must provide a password.',
        ),
    ),
    array(
        'field' => 'passconf',
        'label' => 'Password Confirmation',
        'rules' => 'required'
    ),
    array(
        'field' => 'email',
        'label' => 'Email',
        'rules' => 'required'
    )
);
cls_validate::instance()->set_rules($config);</code></pre>
    <div class="bs-docs-section">
        <h1 id="debug" class="page-header">调试</h1>
        <p>框架中有两种调试方式，一种是在页面控制台中输出的调试，方便用户对应网页调试。</p>
        <p>另一种则是和其他框架一样，在日志中调试</p>

        <h2 id="debug-console">控制台调试</h2>
        <p>Kali的一大特色既是这控制台调试方式，通过Chrome logger扩展，用户可以调试自己想要的数据，同时也不会对当前的页面结构产生影响。</p>
        <p>调试的开关在<code>/web/index.php</code>里</p>
        <p>扩展安装地址：https://chrome.google.com/extensions/detail/noaneddfkdjfnfdakjjmocngnfkfehhd</p>
        <pre><code class="php">// console调试开关，关闭后控制台不会输出内容
defined('SYS_CONSOLE') or define('SYS_CONSOLE', true);</code></pre>
        <p>控制台调试的方式，同步异步都可以调试，因为调试信息是在http header信息里面，所以异步ajax的请求也会把调试信息输出在控制台里了，并不会污染json数据。</p>

        <p>调试方式很简单，全局可以调用<code>log::info($message, $context)</code>，另外还有warn，error，debug等</p>
        <p>第一个参数为想要调试的内容，同时也支持数组，Object类的输出。第二个参数为信息扩展，一般是信息分类，比如：SQL Error、IP地址、当前调用方法__method__，然后通过grep即可进行日志筛选查询：<code>grep -rIn "SQL Query" debug.log</code></p>

        <p><code>log::info()</code>消息 输出</p>
        <p><code>log::notice()</code>提示 输出</p>
        <p><code>log::debug()</code>调试 输出</p>
        <p><code>log::warning()</code>警告 输出</p>
        <p><code>log::error()</code>异常 输出</p>
        <p>下面是一个简单例子，和控制台的输出结果。结果会因为浏览器不一样而样式不同，效果上是一样的。</p>

        <pre><code class="php">// 以下代码全局都可以使用
log::info('order start');
// 可以传数组，也可以传对象，对象会先转化为数组，再转化为json字符串
log::notice(array('cc'=>'dd'));
// debug里面很多信息，SQL Query分类一下，日志查询可以用 grep -rIn "SQL Query" debug.log
log::debug('SELECT * FROM `user`', 'SQL Query');
log::error('this is a error');
log::warning('ss');</code></pre>

        <p>另外<code>log</code>调试类中还支持time，memory的输出，信息会输出到debug.log，可以使用其对代码性能做优化。</p>
        <pre><code class="php">// 开始结尾处加上时间 和 memory 就可以获取中间程序消耗的性能了
log::time('start-time');
log::memory('start-memory');
log::debug('do something');
log::time('end-time');
log::memory('end-memory');</code></pre>

        <h2 id="debug-log">日志调试</h2>

        <p>平台的日志目录在<code>/kali/data/log/</code>，请确保该目录有<code>写权限</code></p>
        <p>记录会生成在<code>{错误类型}.log</code>文件中，如：<code>info.log</code>、<code>debug.log</code>、<code>warn.log</code>、<code>error.log</code></p>
        <!--<p>异常记录会生成在<code>error_{日期}.log</code>文件中，如：<code>error_2016-05-05.log</code></p>-->
        <!--<p>调试记录会生成在<code>log_{日期}.log</code>文件中，如：<code>log_2016-05-05.log</code></p>-->

        <p>系统程序错误也都会在error日志中显示，如页面出现500时可在错误日志中查看定位</p>

    </div>

    <div class="bs-docs-section">
        <h1 id="shell" class="page-header">脚本执行</h1>
        <p>Kali框架除了提供HTTP的请求处理以外，同时还提供了一套完整的脚本执行逻辑，基本上和HTTP请求保持一致</p>
        <p>执行入口为一样是根目录下的<code>index.php</code>文件，用户可以通过命令行执行<code>php index.php {router} {param}</code>方式调用</p>
        <p>其中<code>router</code>为脚本路由，<code>param</code>为执行参数，可缺省或多个参数</p>

        <h2 id="shell-router">脚本路由</h2>
        <p>路由跟http请求模式基本保持一致，只需要改变传参方式即可，改为<code>--ct={control} --ac={action}</code>的形式，<code>{control}</code>和<code>{action}</code>都可以缺省，默认为<code>index</code></p>
        <p>例如：<code>--ct=index --ac=test</code>就会执行<code>index</code>中的<code>test</code>方法，而<code>--ct=demo</code>则会执行<code>demo</code>中的<code>index</code>方法</p>
        <pre><code class="php">// /app/index.php
namespace admin\control;
class ctl_index extends ctl_base
{
    // _init方法会先被执行
    public static function _init()
    {
    }

    //默认路由index
    public function index()
    {
        echo __method__."\n";
    }
}</code></pre>

        <h2 id="shell-param">脚本参数</h2>
        <p>框架提供了变量化的参数传递方式，用法与http模式保持一致</p>
        <p>例如：终端执行<code>php index.php --ct=test --ac=demo --id=23 --name="test"</code>，结果如下：</p>
        <pre><code class="php">namespace admin;
class ctl_test extends ctl_base
{
    public function demo()
    {
        //23
        echo req::item('id', 0, 'int');
        //demo
        echo req::item('name');
        //default
        echo req::item('prm', 'default');
    }
}</code></pre>

        <h2 id="shell-crond">定时任务</h2>
        <p>原则上程序员不应该直接登陆Linux系统去配置crontab，应由运维人员配置好每个项目对应的crontab，避免安全性问题，框架提供和Linux原生crontab一模一样的配置方法。</p>
        <pre><code class="php">// crontab配置
// 记得使用和web同样的用户避免生成的日志不同权限：crontab -uwww-data -e
*/1 * * * * /data/web/www.kaliphp.com/kali/crond/index.php >> /data/web/www.kaliphp.com/kali/data/crond.log

// crond配置文件目录：kali/config/crond.php
// crond执行文件目录：kali/crond/
/* CROND 定时器 配置文件 */
return array(
    'crond_timer' => array(
        /* 配置支持的格式 */
        'the_format' => array(
            '*',        //每分钟
            '*:i',      //每小时 某分
            'H:i',      //每天 某时:某分
            '@-w H:i',  //每周-某天 某时:某分  0=周日
            '*-d H:i',  //每月-某天 某时:某分
            'm-d H:i',  //某月-某日 某时-某分
            'Y-m-d H:i',//某年-某月-某日 某时-某分
        ),
        /* 配置执行的文件 */
        'the_time' => array(
            /* 每分钟 */
            //'*' => array('xxx.php'),

            /* 每小时 某分 */
            //'*:01' => array('xxx.php'),

            /* 每天 某时:某分 */
            //'10:00' => array('xxx.php'),

            /* 每周-某天 某时:某分 */
            //'@-0 01:30' => array('xxx.php'),

            /* 每月-某天 某时:某分 */
            //'*-05 01:00' => array('xxx.php'),

            /*每年 某月-某日 某时-某分 */
            //'12-12 23:43' => array('xxx.php'),

            /* 某年某月某日某时某分 */
            //'2008-12-12 23:43' => array('xxx.php'),
        ),
    )
);
</code></pre>


        <h2 id="shell-socket">Socket框架</h2>
        <p>框架提供PSR-4规范的类加载器，同样swoole、workerman也支持同样的加载方式，所以框架和swoole、workerman配合恰到好处，与此同时，框架还解决了经典的MYSQL 8小时无操作导致的MySQL server has gone away问题，在onMessage方法下调用 kali::run() 方法即可实现MVC调度模式。</p>
        <pre><code class="php">// 注意：请一定一定不要在外围操作db和cache
use Workerman\Worker;
use kali\core\kali;
use kali\core\db;
use kali\core\cache;
use kali\core\req;

//require_once __DIR__ . '/workerman/Autoloader.php';
require_once __DIR__ . '/kali/core/autoloader.php';

define('RUN_SHELL', true);
define('SYS_DEBUG', true);
//dev pre pub
define('SYS_ENV', 'dev');

kali::registry();

// websocket服务端
$worker = new Worker("websocket://0.0.0.0:9527");

// 启动4个进程对外提供服务
$worker->count = 4;

$worker->onWorkerStart = function($worker)
{
    Worker::log("Worker starting...");
};

$worker->onConnect = function($connection) use ($worker)
{
    $msg = "workerID:{$worker->id} connectionID:{$connection->id} connected";
    Worker::log($msg);

    $connection->onWebSocketConnect = function($connection, $http_header) use ($worker)
    {
        /**
         * 客户端websocket握手时的回调onWebSocketConnect
         * 在onWebSocketConnect回调中获得nginx通过http头中的X_REAL_IP值
         */
        $ip = empty($_SERVER['HTTP_X_REAL_IP']) ? $connection->getRemoteIp() : $_SERVER['HTTP_X_REAL_IP'];
        $connection->realIP = $ip;
        Worker::log("connection connected from ip " . $connection->realIP);
    };
};

// 当收到客户端发来的数据后返回hello $data给客户端
$worker->onMessage = function($connection, $data) use ($worker)
{
    // 接收到客户端心跳包
    if ($data == '~H#C~')
    {
        //Worker::log("收到来自 ".$connection->realIP." 的心跳包");
        // 回复一个心跳包
        $connection->send('~H#S~');
        return;
    }

    Worker::log($connection->realIP." ".$data);
    $data = @json_decode($data, true);
    // 判断是否存在控制器和方法
    if (!$data || empty($data['ct']) || empty($data['ac']))
    {
        Worker::log("Controller or Method not exists.");
        return;
    }

    $req_data = [];
    $req_data[] = ['connection', $connection];
    foreach ($data as $k=>$v)
    {
        $req_data[$k] = [$k, $v];
    }
    // 把指定数据转化为路由数据
    req::assign_values($req_data);
    // 运行MVC框架
    kali::run();
    // 要清空，否则下次请求还继续带着上次的数据呢
    $_GET = req::$gets = [];
};

$worker->onClose = function($connection) use ($worker)
{
    Worker::log("connection closed from ip " . $connection->realIP);
};

// 运行worker
Worker::runAll();
</code></pre>

    </div>

    <div class="bs-docs-section">
        <h1 id="other" class="page-header">其他</h1>
        <p>系统有很多单例都可以直接通过方法名直接操作</p>
        <p><code>req</code> 为当前请求，可获取请求参数，当前地址，客户端ip等</p>
        <p><code>cache</code> 为请求静态缓存</p>

        <h2 id="other-request">Request</h2>
        <p>Kali即是框架，也是类库，所以在执行框架注册<code>kali::registry()</code>后，<code>Request</code>就可以被调用了，以下是几个常用操作</p>
        <pre><code class="php">// 以请求 /test/demo/?id=10 为例

// 获取id参数，$_GET、$_POST、$_REQUEST、$_COOKIE 变量都可以用这个获取
req::item('id');
// 如果id参数不存在则设置为0
req::item('id', 0);
// 强制id参数转化为整型
req::item('id', 0, 'int');

// 获取HTTP Method名 返回GET、POST、PUT、DELETE
req::method();

// 是否异步请求 返回false
req::is_ajax();

// 返回当前URL  ?ct=test&ac=demo&id=10
req::cururl();

// 获取来源网址 （上一个页面地址）
req::referrer();

// 获取浏览器UA
req::user_agent();

// 获取浏览器语言
req::language();

// 获取用户IP
req::ip();

// 获取用户国家代码
req::country();
</code></pre>

        <h2 id="other-lang">Lang</h2>
        <p>语言类提供了一些方法用于获取语言文件和不同语言的文本来实现国际化。</p>
        <p>要使用语言类，首先需要在 <code>kali/lang</code>目录下创建语言文件，每种不同的语言都有相应的一个子目录（例如：'en' 或者 'zh-cn'）。</p>
        <pre><code class="ini"># 语言包定义，左边是key，右边是value，建议key部分用下划线模式，value用单引号或者双引号包含起来
error_email_missing    = 'You must submit an email address';
error_url_missing      = 'You must submit a URL';
error_username_missing = 'You must submit a username';
</code></pre>
        <p>语言包设置</p>
        <pre><code class="php">'language' => array(
    'default'  => 'en',     // 默认语言包
    'fallback' => 'en',     // 默认语言包不存在的情况下调用这个语言包
    'locale'   => 'en_US',
    'always_load' => array( // 总是自动加载
        'common', 'form_validate', 'upload', 'menu', 'content'
    ),
)
</code></pre>
        <p>语言包常用方法</p>
        <pre><code class="php">// 手动加载语言包
lang::load($langfile, $lang);
// 读取语言文本
lang::get($key, $defaultvalue = null, $replace = [], $log_errors = true)
</code></pre>
        <p>模版中使用语言类</p>
        <pre><code>&lt;{lang key='' defaultvalue=null replace=[] log_errors=true}&gt;</code></pre>
        <p>字符串替换</p>
        <pre><code>lang::get("There are {numer} million cars in {address}.", null, ['number'=>2, 'address'=>'Shanghai']);</code></pre>

        <h2 id="other-cache">Cache</h2>
        <p>框架提供了可基于<code>文件</code>、<code>memcache</code>、<code>redis</code>的缓存，可在config/config.php文件里面设置，使用非常简单</p>
        <pre><code class="php">// /config/config.php
    'cache' => array(
        'enable'     => true,
        'prefix'     => 'mc_df_',
        'cache_type' => 'redis',
        'cache_time' => 7200,
        'cache_name' => 'cfc_data',
        'memcache' => array(
            'timeout' => 1,
            'servers' => array(
                array( 'host' => '127.0.0.1', 'port' => 11211, 'weight' => 1 ),
            )
        ),
        // redis目前只支持单台服务器
        'redis' => array(
            'timeout' => 30,
            'server' => array( 'host' => '127.0.0.1', 'port' => 6379, 'pass' => 'foobared')
        ),

        'session' => array(
            'type'   => 'cache',      // session类型 default || cache || mysql
            'expire' => 1440,         // session 回收时间 默认24分钟:1440、一天:86400
        ),
        // 开启redis自动序列化存储
        'serialize' => true,
    )</code></pre>

        <p>Cache支持<code>set</code>、<code>get</code>、<code>del</code>、<code>ttl</code>、<code>inc</code>、<code>dec</code>等简单操作方法</p>
        <pre><code class="php">// 添加缓存
cache::set('name', 'kali');

// 获取缓存
$name = cache::get('name');

// 删除缓存
$name = cache::del('name');

// 添加缓存并设置一个小时有效期
cache::set('email', 'kaliphp@gmail.com', 3600);

// 自增缓存，默认增加1
$num = cache::inc('num');

// 自减缓存，默认减少1
$num = cache::dec('num');
</code></pre>

        <p>Cache还支持在知道使用何种缓存的时候使用其方法，比如driver是Redis，那么我们可以直接使用Redis的其他方法</p>
        <pre><code class="php">// 添加队列
cache::lpush('new-list', '1111');

// 弹出队列
cache::rpop('new-list');
</code></pre>

        <h2 id="other-redis">Redis</h2>
        <p>当我们缓存没有使用Redis的情况下，但是又需要用到Redis的队列功能的时候，我们可以使用 cls_redis.php 类进行操作，配置请看上面的Cache中的Redis部分</p>
        <pre><code class="php">// 添加队列
cls_redis::instance()->lpush('new-list', '1111');

// 弹出队列
cls_redis::instance()->rpop('new-list');
</code></pre>
        <p>Redis类不支持主从操作，但是支持多实例，所以在使用的时候可以通过不同配置创建多个实例来操作Redis</p>
        <pre><code class="php">// 默认实例，调用默认配置
$redis1 = cls_redis::instance();

// 添加一个实例，手动配置
$config = [
    'host' => '192.168.0.2',
    'port' => 6379,
    'pass' => 'foobared'
];
$redis2 = cls_redis::instance('redis2', $config);
</code></pre>

        <h2 id="other-session">Session</h2>
        <p>框架注册运行后，会用kali\core\session类接管session的所有操作，开发时可以调用<code>session::del(session id)</code>销毁某个session，强制用户下线，对于登录需要后台审核、用户密码修改后用户重新登录、非安全用户强制下线等业务特别有效。</p>

        <h2 id="other-cookie">Cookie</h2>
        <p>框架在引入 <code>req.php</code> 类后会 unset 掉 $_GET、$_POST、$_REQUEST、$_COOKIE, 所以 cookie 只能通过<code>req::item()</code>方法获取，当与$_GET、$_POST参数发生冲突时，可采用<code>req::cookie()</code>方法获取正确的值。</p>

        <h2 id="other-model">模型类</h2>
        <p>用户可以在<code>/app/model/</code>下自定义model模块类，模块类统一使用static方法，控制器中可以通过<code>mod_{model}::{method}</code>直接操作，例如：</p>
        <p>第一步，我们在<code>/app/model/</code>目录或者子目录/孙目录下新建一个文件<code>/app/model/mod_team.php</code></p>
        <pre><code class="php">// mod_team.php
namespace admin\model;
use kali\core\kali;
class mod_team extends mod_base
{
    public static $vip_level = 0;

    // 模块类被引入时会先执行_init方法
    public static function _init()
    {
    }

    /**
     * 自定义方法 返回用户人数
     */
    public static function get_total($id)
    {
        // 获取team_id标记为当前team的用户数
        return db::select('COUNT AS `count`')->from('#PB#_user')->where('team_id', $id)->as_field()->execute();
    }
}</code></pre>

        <p>然后就可以在代码中调用了，例如一个标记团队vip等级的功能，如下：</p>
        <pre class="code">// 获取team数据模型
if (mod_team::get_total($id)) > 100)
{
    mod_team::vip_level = 1;
}</pre>
        <p><code>注意</code>：类名，文件名，两者者需要保持一致，否者系统会找不到对应的模型。</p>

        <div style="height: 200px"></div>
    </div>

</div>
<{if !$is_mobile}>
<div class="col-md-3" role="complementary">
    <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm">
        <ul class="nav bs-docs-sidenav">

            <li>
                <a href="#overview">概览</a>
                <ul class="nav">
                    <li><a href="#overview-introduce">介绍</a></li>
                    <li><a href="#overview-files">目录结构</a></li>
                    <li><a href="#overview-level">调用关系</a></li>
                    <li><a href="#overview-index">环境配置</a></li>
                </ul>
            </li>
            <li>
                <a href="#router">路由</a>
                <ul class="nav">
                    <li><a href="#router-rule">默认路由</a></li>
                    <li><a href="#router-custom">自定义路由</a></li>
                    <li><a href="#router-ajax">异步请求</a></li>
                    <li><a href="#router-restful">Restful</a></li>
                    <li><a href="#router-param">参数获取</a></li>
                    <li><a href="#router-check">权限验证</a></li>
                </ul>
            </li>
            <li>
                <a href="#config">配置</a>
                <ul class="nav">
                    <li><a href="#config-system">系统配置</a></li>
                    <li><a href="#config-app">程序配置</a></li>
                    <li><a href="#config-db">数据库配置</a></li>
                    <li><a href="#config-env">环境配置</a></li>
                    <li><a href="#config-alias">别名使用</a></li>
                </ul>
            </li>
            <li>
                <a href="#dao">数据库使用</a>
                <ul class="nav">
                    <li><a href="#dao-connect">连接配置</a></li>
                    <li><a href="#dao-slave">主从操作</a></li>
                    <li><a href="#dao-simple">基础查询</a></li>
                    <li><a href="#dao-return">返回值</a></li>
                    <li><a href="#dao-select">查询数据</a></li>
                    <li><a href="#dao-insert">增加数据</a></li>
                    <li><a href="#dao-update">修改数据</a></li>
                    <li><a href="#dao-delete">删除数据</a></li>
                    <li><a href="#dao-join">多联表</a></li>
                    <li><a href="#dao-filter">选择器</a></li>
                    <li><a href="#dao-extracts">复杂选择</a></li>
                    <li><a href="#dao-group">其他条件</a></li>
                    <li><a href="#dao-expression">防止构建</a></li>
                    <li><a href="#dao-command">SQL模版</a></li>
                    <li><a href="#dao-cursor">游标数据</a></li>
                    <li><a href="#dao-transaction">事务处理</a></li>
                    <li><a href="#dao-cache">数据缓存</a></li>
                    <li><a href="#dao-log">语句调试</a></li>
                </ul>
            </li>
            <li>
                <a href="#view">页面渲染</a>
                <ul class="nav">
                    <li><a href="#view-param">渲染参数</a></li>
                    <li><a href="#view-func">自定义函数插件</a></li>
                    <li><a href="#view-block">自定义block标循环插件</a></li>
                    <li><a href="#view-xss">反XSS注入</a></li>
                </ul>
            </li>
            <li>
                <a href="#event">事件</a>
                <ul class="nav">
                    <li><a href="#event-init">定义事件</a></li>
                    <li><a href="#event-trigger">触发事件</a></li>
                </ul>
            </li>
            <li>
                <a href="#forms">表单验证</a>
                <ul class="nav">
                    <li><a href="#forms-type">验证类型</a></li>
                    <li><a href="#forms-array">数组方式</a></li>
                </ul>
            </li>
            <li>
                <a href="#debug">调试</a>
                <ul class="nav">
                    <li><a href="#debug-console">控制台调试</a></li>
                    <li><a href="#debug-log">日志调试</a></li>
                </ul>
            </li>
            <li>
                <a href="#shell">脚本执行</a>
                <ul class="nav">
                    <li><a href="#shell-router">脚本路由</a></li>
                    <li><a href="#shell-param">脚本参数</a></li>
                    <li><a href="#shell-log">脚本日志</a></li>
                    <li><a href="#shell-crond">定时任务</a></li>
                    <li><a href="#shell-socket">Socket框架</a></li>
                </ul>
            </li>
            <li>
                <a href="#other">其他</a>
                <ul class="nav">
                    <li><a href="#other-request">Request</a></li>
                    <li><a href="#other-lang">Lang</a></li>
                    <li><a href="#other-cache">Cache</a></li>
                    <li><a href="#other-redis">Redis</a></li>
                    <li><a href="#other-session">Session</a></li>
                    <li><a href="#other-cookie">Cookie</a></li>
                    <li><a href="#other-model">模型类</a></li>
                </ul>
            </li>

        </ul>
        <a class="back-to-top" href="#top">
            返回顶部
        </a>

    </nav>
</div>
<{/if}>

</div>
</div>

<{include file='document/footer.tpl'}>
<script type="text/javascript" src="static/js/document.js"></script>
