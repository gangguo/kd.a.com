<?php
/**
 * Kali is a fast, lightweight, community driven PHP 5.4+ framework.
 *
 * @package    KALI
 * @version    1.0.1
 * @author     KALI Development Team
 * @license    MIT License
 * @copyright  2010 - 2018 Kali Development Team
 * @link       http://kaliphp.com
 */

namespace kali\core;
use kali\core\kali;
use kali\core\lib\cls_chrome;

class event
{
    public static $config = [];

    /**
     * 事件句柄
     * @var int
     */
    private static $fh = 0;

    /**
     * 事件观察者
     * @var array
     */
    private static $monitors = [];

    public static function _init()
    {
        self::$config = config::instance('app_config')->get('log');
    }

    /**
     * 绑定事件
     * @param callable $method
     * @param $event
     * @param null $times
     * @return int
     * @throws TXException
     */
    public static function bind($method, $event, $times=null)
    {
        if (!is_callable($method))
        {
            throw new \Exception(isset($method[1]) ? $method[1] : 'null', 5003);
        }
        $fh = ++self::$fh;
        self::$monitors[$event][$fh] = ['m'=>$method, 't'=>$times];
        return $fh;
    }

    /**
     * 绑定永久事件
     * @param callable $method
     * @param $event
     * @return int
     */
    public static function on($event, $method=null)
    {
        $method = $method ?: ['\kali\core\log', 'debug'];
        return self::bind($method, $event);
    }

    /**
     * 绑定一次事件
     * @param callable $method
     * @param $event
     * @return int
     */
    public static function one($event, $method=null)
    {
        $method = $method ?: ['\kali\core\log', 'debug'];
        return self::bind($method, $event, 1);
    }

    /**
     * 解绑事件
     * @param $event
     * @param $fh
     * @return bool
     */
    public static function off($event, $fh=null)
    {
        if ($fh)
        {
            if (isset(self::$monitors[$event][$fh]))
            {
                unset(self::$monitors[$event][$fh]);
                return true;
            } 
            else 
            {
                return false;
            }
        } 
        else 
        {
            unset(self::$monitors[$event]);
            return true;
        }
    }

    /**
     * 触发事件
     * @param $event
     * @param array $params
     * @return bool
     */
    public static function trigger($event, $params=[])
    {
        if (!isset(self::$monitors[$event]))
        {
            return false;
        }
        array_unshift($params, $event);
        foreach (self::$monitors[$event] as $fh => &$value)
        {
            $method = $value['m'];
            call_user_func_array($method, $params);
            if (isset($value['t']) && --$value['t'] <= 0)
            {
                unset(self::$monitors[$event][$fh]);
            }
        }
        unset($value);
        return true;
    }

    /**
     * 启动类
     */
    public static function start()
    {
        event::on(onException, ['kali\core\event', 'on_exception']);
        event::on(onRequest, ['kali\core\event', 'on_request']);
        event::on(onSql, ['kali\core\event', 'on_sql']);
    }

    /**
     * 异常错误
     * @param $event
     * @param $code
     * @param $params
     */
    public static function on_exception($event, $code, $params)
    {
        log::error("ERROR CODE: $code\n".join("\n", $params));
    }

    /**
     * 请求入口
     * @param $event
     * @param $request TXRequest
     */
    public static function on_request($event)
    {
        $url = sprintf("ct=%s&ac=%s", kali::$ct, kali::$ac);
        // 不在日志记录方法里面
        if ( !in_array(req::method(), self::$config['log_request_methods']) && !in_array('*', self::$config['log_request_methods'])) 
        {
            return;
        }

        // 不是日志记录请求
        if ( !in_array($url, self::$config['log_request_uris']) && !in_array('*', self::$config['log_request_uris']) ) 
        {
            return;
        }

        $forms = [
            'ct' => 'index',
            'ac' => 'index',
        ];
        $forms = array_merge($forms, req::$forms);
        log::notice(json_encode($forms));

        //log::info('request: '.$request->getHostInfo().$request->getUrl());
    }

    public static function on_sql($event, string $sql = null, string $db = null)
    {
        log::debug("{$db} - {$sql}", 'SQL query');
        if (SYS_CONSOLE)
        {
            cls_chrome::info('%c SQL语法 %c '.$sql.' ','color: white; background: #34495e; padding:5px 0;', 'background: #95a5a6; padding:5px 0;');
            $backtrace = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS);
            $step = 1;
            $filter_arr = ['kali\core\event::trigger','kali::run'];
            foreach ($backtrace as $val)
            {
                if(!isset($val['class']) || !isset($val['line'])) continue;
                if (strpos($val['file'],'kali.php') !== false) continue;
                $full_method = $val['class'] . $val['type'] . $val['function'];
                if (in_array($full_method,$filter_arr)) continue;
                if ($full_method !== 'kali\core\database\db_connection->execute')
                {
                    cls_chrome::info('%c 第 ' . $step . ' 层 %c ' .$val['class'] . $val['type'] . $val['function'] . ' ','color: white; background: #d35400; padding:5px 0;', 'background: #e67e22; padding:5px 0;');
                    ++ $step;
                }
                cls_chrome::info('%c 路径 %c ' .str_replace(array('%file','%line'), array($val['file'],$val['line']),SYS_EDITOR) . ' ','color: white; background: #27ae60; padding:5px 0;', 'background: #2ecc71; padding:5px 0;');

            }
        }
    }
}
