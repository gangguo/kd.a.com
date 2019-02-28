<?php

header('Content-Type: text/html; charset=utf-8');

require_once __DIR__.'/../kali/core/autoloader.php';

use kali\core\kali;
use kali\core\req;
use kali\core\config;
use kali\core\util;
use kali\core\lib\cls_profiler;
use kali\core\lib\cls_crypt;

// vim
//define('SYS_EDITOR', 'mvim://open?url=file://%file&line=%line');
// sublime
//define('SYS_EDITOR', 'subl://open?url=file://%file&line=%line');
// phpstorm
//define('SYS_EDITOR', 'idea://open?file=%file&line=%line');

define('SYS_DEBUG', true);
define('SYS_CONSOLE', false);
//dev pre pub
define('SYS_ENV', 'dev');

# 权限控制程序信息
$purview_config = [
    'auto_check'        => true,                        // 自动加载权限检查（此项为true时，自动执行$app->check_purview(1)模式）
    'menu_file'         => 'admin_menu.xml',            // 获取菜单和用户权限配置
    'login_url'         => '?ct=index&ac=login',        // 用户登录入口地址
];

# APP信息
$app_config = [
    'app_title'         => 'KALIPHP',                   // APP标题
    'app_name'          => 'admin',                       // APP名称，app代码和模版都受到这个控制
    'session_start'     => true,                        // 是否启用session
    'purview_config'    => $purview_config,             // 权限控制程序信息
];

kali::registry( $app_config );

//cls_profiler::instance()->enable_profiler(true);
if ( !(req::item('ct') == 'index' && req::item('ac') == 'index') )
{
    // 所有访问开启程序分析器
    //cls_profiler::instance()->enable_profiler(true);
}
// 运行MVC
kali::run();
