<?php
return [

    'api_key' => 'rMzaXTUgMpRRXnWrXRQRstr8F7krLfNg',

    //路由配置
    'router' => [
        'controller'    => 'index/index',            // 默认控制器方法
        '404_override'  => 'errors/page_missing',    // 404错误页面
        //是否重写
        'use_rewrite'   => false,
        //静态化配置
        'route_rule'    => [
            //            '<method:\w+>/test/<id:\d+>.html' => 'test/<method>',
            //            'rest/<rid:[\d]+>/<method:\w+>/<mid:\d+>' => 'rest/<method>',
        ]
    ],

    //请求配置
    'request' => [
        'csrf_token_on'     => true,               // 是否开启令牌验证
        'csrf_token_name'   => 'csrf_token_name',   // 令牌验证的表单隐藏字段名称
        'csrf_token_reset'  => true,                // 令牌验证出错后是否重置令牌 默认为true
        'csrf_cookie_name'  => 'csrf_cookie_name',  // 令牌存放的cookie名称
        'csrf_expire'       => 86400,               // 令牌过期时间，一天
        'csrf_white_ips'    => [                    // csrf IP白名单
            '127.0.0.1/24'
        ],
        'csrf_exclude_uris' => [                    // csrf URL白名单
        ],   
        // 约定 user_ip 字段 X_REAL_IP
        'user_ip' => '',
        'global_xss_filtering' => true,
    ],

    // COOKIE设置
    'cookie' => [
        'prefix'   => 'kali_',                  // cookie前缀
        'pwd'      => 'VKghmkBjpipoX',          // cookie加密码，密码前缀
        'expire'   => 7200,                     // cookie超时时间
        'path'     => '/',                      // cookie路径
        'domain'   => null,                     // 正式环境中如果要考虑二级域名问题的应该用 .xxx.com
        'secure'   => false, 
        'httponly' => false,
    ],

    //响应配置
    'response' => [
        'jsonContentType' => 'application/json',
        'objectEncode'    => true, //object对象是否转义
    ],

    // 日志相关配置
    'log' => [
        // 自定义日志记录方法
        'send_log' => ['common', 'send_log']
    ],

    // 程序分析
    'profiler' => [
        'benchmarks'         => true,
        'config'             => true,
        'controller_info'    => true,
        'http_headers'       => true,
        'uri_string'         => true,
        'get'                => true,
        'post'               => true,
        'cookie_data'        => true,
        'session_data'       => true,
        'memory_usage'       => true,
        'queries'            => true,
        'query_toggle_count' => 25,
    ],

    // 默认时区，上海时区，东八区
    'timezone_set' => 'Asia/Shanghai',
    // 默认需要转化的时区，东七区是柬埔寨时间 
    'to_timezone' => 'ETC/GMT-7',

    //异常配置
    'exception' => [
        //返回页面
        'exception_tpl' => 'error/exception',
        'error_tpl' => 'error/msg',

        'messages' => [
            500 => '网站有一个异常，请稍候再试',
            404 => '您访问的页面不存在',
            403 => '权限不足，无法访问'
        ]
    ]
];
