<?php
// 注意：请一定一定不要在外围操作db和cache
use Workerman\Worker;
use kali\core\kali;
use kali\core\db;
use kali\core\cache;
use kali\core\req;
use kali\core\log;
use kali\core\session;
use kali\core\config;
use kali\core\lib\cls_auth;
use kali\core\lib\cls_crypt;

//require_once __DIR__ . '/workerman/Autoloader.php';
require_once __DIR__ . '/kali/core/autoloader.php';
require_once __DIR__ . '/channel/src/Server.php';
require_once __DIR__ . '/channel/src/Client.php';

define('RUN_SHELL', true);
define('SYS_DEBUG', true);
//dev pre pub
define('SYS_ENV', 'dev');

kali::registry();

// 请求链接
//http://127.0.0.1:9528/?event=sysmessage&uid=1&title=title&text=text&url=urlencode('?ct=category&ac=index')

//// 证书最好是申请的证书
//$context = array(
    //'ssl' => array(
        //// 使用绝对路径
        //'local_cert'  => '/etc/nginx/ssl/personmanage.com.crt', // 也可以是crt文件
        //'local_pk'    => '/etc/nginx/ssl/personmanage.com.key',
        //'verify_peer' => false,
    //)
//);
//// 这里设置的是websocket协议
//$worker = new Worker("websocket://0.0.0.0:9527", $context);
//// 设置transport开启ssl，websocket+ssl即wss
//$worker->transport = 'ssl';

/*
 *---------------------------------------------------------------
 * 初始化一个Channel服务端
 *---------------------------------------------------------------
 *
 * 用来传递HTTP SERVER消息到WEBSOCKET SERVER
 */
$channel_server = new Channel\Server('0.0.0.0', 9526);

/*
 *---------------------------------------------------------------
 * WEBSOCKET服务端
 *---------------------------------------------------------------
 *
 * 用来接受浏览器连接请求，当HTTP SERVER有消息传递过来时，向浏览器推送消息
 */
$worker = new Worker("websocket://0.0.0.0:9527");

// 启动4个进程对外提供服务
$worker->count = 1;
$worker->name = 'pusher';

$worker->onWorkerStart = function($worker)
{
    Worker::log("Worker starting...");

    // Channel客户端连接到Channel服务端
    Channel\Client::connect('127.0.0.1', 9526);

    // 订阅广播事件，收到广播消息会触发
    Channel\Client::on('broadcast', function($data) use ($worker) 
    {
        $req_data = [];
        foreach ($data as $k=>$v) 
        {
            $req_data[$k] = [$k, $v];
        }

        // 把指定数据转化为路由数据
        req::assign_values($req_data);
        // 运行MVC框架
        //kali::run();
        // 要清空，否则下次请求还继续带着上次的数据呢
        $_GET = req::$gets = [];

        $data = req::item('data');

        $api_key = config::instance()->get('api_key');
        $data = cls_crypt::decode($data, $api_key);
        $data = json_decode($data, true);
        if ( !isset($data['event']) || !isset($data['data'])) 
        {
            return;
        }

        $event = $data['event'];
        $data = $data['data'];
        $message = array(
            'Event' => $event,
            'Data'  => [
                'title' => $data['title'],
                'text'  => $data['text'],
                'url'   => $data['url'],
                'time'  => date("Y-m-d H:i:s"),
            ]
        );

        //print_r($message);
        // json_encode 里面中文标点符号、英文关键词都会导致js AES解码不成功，需要先urlencode 
        //$message['Data']['title'] = urlencode($message['Data']['title']);
        //$message['Data']['text'] = urlencode($message['Data']['text']);
        $message['Data']['url'] = urlencode($message['Data']['url']);
        //print_r($message);

        $message = json_encode($message);

        // 广播，所有用户都会收到
        if ( $event == 'broadcast' ) 
        {
            foreach ($worker->connections as $conn) 
            {
                $conn->send($message);
            }
        }
        else 
        {
            $uids = explode(',', $data['uids']);
            if (empty($uids)) 
            {
                return;
            }
            foreach ($uids as $uid) 
            {
                // 多个worker的情况下
                if ( isset($worker->uidConnections[$uid]) ) 
                {
                    foreach ($worker->uidConnections[$uid] as $conns) 
                    {
                        $conn = $worker->connections[$conns['id']];
                        $conn->send(cls_crypt::encode($message,  $conns['key']));
                    }
                }
            }
        }
    });

};

// 新增加一个属性，用来保存uid到connection的映射
$worker->uidConnections = array();

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

        // Workerman 支持通过 $_GET 获取请求参数，实在是太牛比了
        if ( empty($_GET['data'])) 
        {
            log::error('Data cannot be empty');
            $connection->close();
            return;
        }
        $api_key = config::instance()->get('api_key');
        $data = cls_crypt::decode($_GET['data'], $api_key);
        $data = json_decode($data, true);
        if ( empty($data['key']) || empty($data['uid']) || empty($data['session_id']) || empty($data['ip']) || $data['ip'] !== $ip ) 
        {
            log::error('Wrong data');
            $connection->close();
            return;
        }
        // 通过session判断用户是否登陆，nginx 做反向代理不行
        //if ( empty(session::read($data['session_id'])))
        //{
            //log::error('User not logged in');
            //$connection->close();
            //return;
        //}    

        $uid = $data['uid'];
        $key = $data['key'];
        $connection->uid = $uid;
        /* 保存uid到connection的映射，这样可以方便的通过uid查找connection，
         * 实现针对特定uid推送数据
         */
        $worker->uidConnections[$uid][$connection->id] = [
            'id' => $connection->id,
            'key' => $key,
        ];
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
    Worker::log("connection closed from ip " . $connection->getRemoteIp());
    if( isset($connection->uid))
    {
        // 连接断开时删除映射
        unset($worker->uidConnections[$connection->uid][$connection->id]);
        if ( empty($worker->uidConnections[$connection->uid])) 
        {
            unset($worker->uidConnections[$connection->uid]);
        }
    }
};

/*
 *---------------------------------------------------------------
 * HTTP SERVER
 *---------------------------------------------------------------
 *
 * 用来处理HTTP请求
 * 1、通过channel传输给WEBSOCKET SERVER 
 * 2、WEBSOCKET SERVER向指定的CLIENT推送数据
 */
$http_worker = new Worker('http://0.0.0.0:9528');
$http_worker->name = 'publisher';
$http_worker->onWorkerStart = function()
{
    Channel\Client::connect('127.0.0.1', 9526);
};
$http_worker->onMessage = function($connection, $data)
{
    if ( $_SERVER['REQUEST_URI'] === '/favicon.ico') 
    {
        return;
    }
    $connection->send('ok');

    // 直接广播
    Channel\Client::publish('broadcast', $_POST);
};

// 运行worker
Worker::runAll();



