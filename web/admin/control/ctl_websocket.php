<?php
namespace admin\control;
use kali\core\kali;
use kali\core\db;
use kali\core\req;
use kali\core\log;
use kali\core\config;
use kali\core\cache;
use kali\core\util;

/**
 * WebSocket
 */
class ctl_websocket
{
    public static $config = [];

    public static function _init()
    {
        //self::$config = config::instance('app_config')->get('websocket');
    }

    public function connect()
    {

    }

    public function onopen()
    {
        req::item('connection')->send(json_encode(array(
            'Event'  => 'sysmessage',
            'Data'   => [
                'title' => '系统消息',
                'text'  => 'Hello ' . req::item('name'),
                'url'   => '',
                'time'  => date('Y-m-d H:i:s'),
            ]
        )));

        //echo req::item('connection')->realIP."\n";
    }

    public function demo()
    {
        echo __method__."\n";
        print_r(req::$gets);
        echo __method__."\n";
    }

}
