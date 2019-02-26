<?php
return [

    'webroot' => '@web@',

    // 安全相关配置
    'security' => [
        // 登录相关的安全
        'validate' => [
            'image_code'  => false,
            'mfa_code'    => false,
            'third_login' => false,
        ],

        // 指定某些IP允许开启调试，数组格式为 ['ip1', 'ip2'...]
        'safe_client_ip' => [
            '127.0.0.1',
            '101.1.18.36'
        ],
        // IP白名单
        'ip_whitelist' => [],
        // IP黑名单
        'ip_blacklist' => [],
        // 国家白名单
        'country_whitelist' => [],
        // 国家黑名单
        'country_blacklist' => ['CN'],
        // 伪密码登录可以查看的栏目
        'seclogin' => 'content-index,content-add,content-edit,content-del,category-index,category-add,category-edit,category-del,member-index,member-add,member-edit,member-del,admin-editpwd,admin-mypurview'
    ],

    // 缓存相关配置
    'cache' => [
        'enable'     => true,
        'prefix'     => 'mc_df_',
        'cache_type' => 'file',
        'cache_time' => 7200,
        'cache_name' => 'cfc_data',
        // 开启redis自动序列化存储
        'serialize'  => true,
        'memcache' => [
            'servers' => [
                ['host' => '127.0.0.1', 'port' => 11211, 'weight' => 1, 'keep-alive' => false],
            ]
        ],
        // redis目前只支持单台服务器，使用短连接，长链接在php7以上有问题，经常会被莫名回收
        'redis' => [
            'server' => ['host' => '192.168.83.45', 'port' => 6379, 'pass' => '', 'keep-alive' => false, 'dbindex' => 1]
        ],

        'session' => [
            'type'   => 'cache',      // session类型 default || cache || mysql
            'expire' => 1440,         // session 回收时间 默认24分钟:1440、一天:86400
        ]
    ],

    // 日志相关配置
    'log' => [
        //错误类型
        'log_type'          => 'file',
        //错误级别
        //'log_threshold'     => ERROR,
        'log_threshold'     => [ERROR, WARNING, NOTICE, DEBUG, INFO],
        //错误日期格式
        'log_date_format'   => 'Y-m-d H:i:s',
        'log_chrome'        => false,
        // 那些请求方法提交的数据会被记录
        'log_request_methods'  => [
            'POST',
            //'*',
            //'GET', 'POST', 'PUT', 'DELETE',
        ],
        // 那些请求URL提交的数据会被记录
        'log_request_uris'  => [
            '*',
            //'ct=index&ac=index',
        ],
        //MYSQL慢查询阀值
        'slow_query'        => 1000,
    ],

    // 发送Potato消息
    'potato' => [
        'bot_token'  => '10000170:Krd0i9cCAevijCCPZ0BNJgEU',
        'text_tpl'   => [
            'login' => '【系统】登陆验证码: {{code}} 验证码5分钟内有效。为了保障您的账号安全，请勿向他人泄漏验证码信息。',
        ]
    ],

    // 发送邮箱
    'send_email' => [
        'host' => 'smtp.sina.cn',
        'user' => 'smtptester2@sina.cn',
        'pass' => 'test123456',
        'name' => '鼎盛互动',
        'html' => "
<p>亲爱的鼎盛互动用户{{username}}，您好！</p>
<p>您的验证码是: {{code}} <br/>
此验证码将用于验证身份，修改密码密保等。请勿将验证码透露给其他人。</p>
<p>本邮件由系统自动发送，请勿直接回复！<br/>
感谢您的访问，祝您使用愉快</p>
"],

    'websocket' => [
        'enable' => false,           // 是否打开websocket功能
        'scheme' => 'ws',           // ws、wss
        'host'   => '127.0.0.1',    // wss.phpcall.org
        'port'   => '9527',         // 端口
        //'url'  => 'wss://wss.phpcall.org:9528',
    ],

    // 语言包设置
    'language' => [
        'default'  => 'en',     // 默认语言包
        'fallback' => 'en',     // 默认语言包不存在的情况下调用这个语言包
        'locale'   => 'en_US',
        'always_load' => [      // 总是自动加载
            'common', 'form_validate', 'upload', 'menu', 'content'
        ]
    ],

    // 访问权限设置
    'purview' => [
        // 权限池，已经抛弃
        //'allowpool' => 'admin',
        // 验证类型: session、cookie
        'auttype'    => 'session',
        // 未登录跳转地址
        'login_url'  => '?ct=public&ac=login',
        // 手工指定登录后跳转到的地址
        'return_url' => '?ct=index&ac=index',
        // 公开的控制器，不需登录就能访问
        'public'     => [
            'index' => [
                //'index', 'list', 'logout', 'validate_image', 'send_code', 'reset_pwd', 'login_otp',
                //'demo'
            ],
            'public' => [
                'login', 'regist', 'logout'
            ],
        ],
        // 保护的控制器，会员登录后都能访问
        'protected'  => [
            'index' => [
                'index', 'adminmsg'
            ],
            'admin' => [
                'editpwd', 'mypurview'
            ]
        ],
        // 隐私的控制器，会员登录后拥有权限的可以访问
        'private'    => [],
    ],

    // 框架版本标识
    'common'  => [
        'frame_name' => 'KaliPHP',
        'frame_ui'   => '2',
        'frame_ver'  => '2.6',
    ]
];
