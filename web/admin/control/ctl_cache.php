<?php
namespace admin\control;
use kali\core\kali;
use kali\core\db;
use kali\core\req;
use kali\core\tpl;
use kali\core\log;
use kali\core\config;
use kali\core\util;
use kali\core\lib\cls_msgbox;
use kali\core\lib\cls_page;
use kali\core\lib\cls_redis;
use admin\model\mod_cache;

/**
 * 缓存管理控制器
 *
 * @version $Id$
 */
class ctl_cache
{
    public static $cache_types = array(
        'user' => '用户管理',
        'task' => '任务管理',
        'site' => '网址站群',
        'guonei' => '网址导航',
    );

    public function __construct()
    {
    }

    public function index()
    {
        tpl::display('cache.index.tpl');
    }

    /**
     * redis_info Redis服务器信息
     *
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2015-12-18 11:28
     */
    public function redis_info()
    {
        $keyword = req::item('keyword', '');
        $list = cls_redis::instance()->info();
        if (!empty($keyword))
        {
            $list_tmp = array();
            foreach ($list as $k=>$v)
            {
                if (strpos($k, $keyword) !== false)
                {
                    $k = str_replace($keyword, "<font color='red'>{$keyword}</font>", $k);
                    $list_tmp[$k] = $v;
                }
            }
            $list = $list_tmp;
        }
        tpl::assign('list', $list);
        tpl::display('cache.redis_info.tpl');
    }

    /**
     * 根据keys查询
     *
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2015-12-18 11:28
     */
    public function redis_keys()
    {
        $keyword = req::item('keyword');
        $list = array();
        if (!empty($keyword))
        {
            $keys = cls_redis::instance()->keys($keyword);
            $list = array();
            foreach ($keys as $key)
            {
                //$key  = str_replace(cls_redis::$prefix.":", "", $key);
                $len  = cls_redis::instance()->lsize($key);
                $ttl  = cls_redis::instance()->ttl($key);
                $type = cls_redis::instance()->type($key);
                $list[] = array(
                    'key'  => $key,
                    'len'  => $len,
                    'ttl'  => $ttl,
                    'type' => $type,
                );
            }
            ksort($list);
        }

        tpl::assign( 'list', $list );
        tpl::display( 'cache.redis_keys.tpl' );
    }

    /**
     * 显示缓存内容
     *
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2015-12-18 11:28
     */
    public function show_cache()
    {
        $key  = req::item('key', '');
        $type = cls_redis::instance()->type($key);
        //$types = array(
            //'0' => 'set',
            //'1' => 'string',
            //'3' => 'list',
        //);

        // 如果是队列
        if ($type == 3)
        {
            $val = cls_redis::instance()->rpop($key);
        }
        else
        {
            $val = cls_redis::instance()->get($key);
        }
        if (empty($val))
        {
            exit("The value of {$key} does not exist");
        }
        if (util::is_json($val))
        {
            $val = cls_redis::instance()->decode($val);
        }
        echo '<pre>';print_r($val);echo '</pre>';
    }

    /**
     * 删除Redis对应Key的内容
     *
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2015-12-18 11:28
     */
    public function del()
    {
        $keys = req::item('keys', '');

        foreach ($keys as $key)
        {
            cls_redis::instance()->del($key);
        }

        kali::$auth->save_admin_log("删除Redis缓存 ".implode(",", $keys));

        cls_msgbox::show('系统提示', "删除成功", req::forword());
    }

    /**
     * 清除缓存
     *
     * @return void
     * @author seatle <seatle@foxmail.com>
     * @created time :2016-09-02 12:05
     */
    public function clear()
    {
        $type = req::item("type", "user");
        $method = 'clear_'.$type;
        //mod_cache::$method();

        kali::$auth->save_admin_log("清除".self::$cache_types[$type]."缓存");

        cls_msgbox::show('系统提示', "清除".self::$cache_types[$type]."缓存成功", req::forword());
    }
}

