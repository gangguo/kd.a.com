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
use kali\core\lib\cls_filecache;

/**
 * 默认缓存类
 *
 * 使用缓存应该比较注意的问题，没特殊原因一般都使用memcache或memcached作为缓存类型，对于很小规模的应用， 可以考虑用 file 作为缓存，
 * 不同网址要设置不同的前缀[df_prifix]，实际上系统最终得到的 key 是 base64_encode( self::df_prefix.'_'.$key )
 * 为什么要这样做呢？
 * 因为memcache或memcached对应用缓存服务器群通常是很多网站一起使用的，如果没前缀区分，很容易会错把目标网站的同名缓存给clear掉
 *
 * @author seatle<seatle@foxmail.com>
 * @version 2.0
 */
class cache
{
    public static $config = [];

    // 缓存记录内存变量
    private static $_caches = [];

    // 文件缓存系统或memcache游标
    public static $handle = null;

    // 缓存类型（file|memcache|memcached|redis）
    public static $cache_type = 'file';

    // key默认前缀
    private static $df_prefix = 'mc_df_';

    // 默认缓存时间 2 小时，单位是秒
    private static $cache_time = 7200;

    // 是否使用内存数组
    public static $need_mem = true;

    /**
     * 初始化缓存
     */
    public static function _init()
    {
        self::$config = config::instance('app_config')->get('cache');
        if( ! self::$config['enable'] )
        {
            return;
        }

        // 记得每个项目配置不同的前缀，避免不同项目混用一个memcache造成clear的事情
        if ( !empty(self::$config['prefix']))
        {
            self::$df_prefix  = self::$config['prefix'];
        }
        self::$cache_time = self::$config['cache_time'];
        self::$cache_type = self::$config['cache_type'];
        if( self::$cache_type == 'file' )
        {
            self::$handle = cls_filecache::factory( kali::$cache_root.DS.self::$config['cache_name'] );
        }
        else if( self::$cache_type == 'redis' )
        {
            $config = self::$config['redis']['server'];
            self::$handle = new \Redis();
            if (isset($config['keep-alive']) && $config['keep-alive'])
            {
                self::$handle->pconnect($config['host'], $config['port'], 60);
                self::$handle->setOption(\Redis::OPT_READ_TIMEOUT, -1);
            }
            else
            {
                self::$handle->connect($config['host'], $config['port']);
            }
            if ( !empty($config['pass']) )
            {
                if ( !self::$handle->auth($config['pass']) )
                {
                    trigger_error("Redis Server authentication failed!!");
                }
            }
        }
        else if( self::$cache_type == 'memcached' )
        {
            self::$handle = new \Memcached();
            $servers = array();
            foreach ( self::$config['memcache']['servers'] as $mc )
            {
                $servers[] = array($mc["host"], $mc["port"], $mc["weight"]);
            }
            if ( self::$config['serialize'])
            {
            }
            // 压缩数据
            //self::$handle->setOption(\Memcached::OPT_COMPRESSION, true);
            self::$handle->setOption(\Memcached::OPT_CONNECT_TIMEOUT, 60);
            //self::$handle->setOption(\Memcached::OPT_BINARY_PROTOCOL, true); // 支持redis
            //self::$handle->setSaslAuthData($mc['user'], $mc['pass']);
            self::$handle->addServers( $servers );
        }
        else if( self::$cache_type == 'memcache' )
        {
            self::$handle = new \Memcache();
            foreach ( self::$config['memcache']['servers'] as $mc )
            {
                self::$handle->addServer($mc["host"], $mc["port"], false, $mc["weight"], 60);
            }
        }
    }

    /**
     * 获取key
     */
    protected static function _get_key($key)
    {
        $key = md5(cache::$df_prefix.'_'.$key);
        return $key;
    }

    /**
     * 增加/修改一个缓存
     * @parem $key        键(key=md5(self::$df_prefix.'_'.$key))
     * @param $value      值
     * @parem $cachetime  有效时间，单位是秒(0不限, -1使用系统默认)
     * @return void
     */
    public static function set($key, $value, $cachetime = -1)
    {
        if( $cachetime == -1 )
        {
            $cachetime = self::$cache_time;
        }

        $cachekey = self::_get_key($key);

        if( self::$need_mem )
        {
            self::$_caches[ $cachekey ] = $value;
        }

        // redis 扩展无法跟memcached、memcache一样直接传数组，所以需要先转json
        if( self::$cache_type == 'redis' )
        {
            $value = self::$config['serialize'] ? serialize($value) : $value;
            if ( $cachetime == 0 )
            {
                return self::$handle->set($cachekey, $value);
            }
            else
            {
                return self::$handle->setex($cachekey, $cachetime, $value);
            }
        }
        // memcached
        elseif( self::$cache_type == 'memcached' )
        {
            return self::$handle->set($cachekey, $value, $cachetime);
        }
        // memcache、file
        else
        {
            return self::$handle->set($cachekey, $value, 0, $cachetime);
        }
    }

    /**
     * 删除缓存
     * @parem $key        键
     * @return int        0|1
     */
    public static function del($key)
    {
        $cachekey = self::_get_key($key);

        if( isset(self::$_caches[ $cachekey ]) )
        {
            unset(self::$_caches[ $cachekey ]);
        }

        return self::$handle->delete( $cachekey );
    }

    /**
     * 读取缓存
     * @parem $key        键
     * @return string|array
     */
    public static function get($key)
    {
        //全局禁用cache(调试使用的情况)
        if( ! self::$config['enable'] )
        {
            return false;
        }

        $cachekey = self::_get_key($key);

        if( isset(self::$_caches[ $cachekey ]) )
        {
            return self::$_caches[ $cachekey ];
        }
        if( self::$cache_type == 'redis' )
        {
            $value = self::$handle->get( $cachekey );
            //if ( empty($value))
            //{
                //log::error('empty redis value - '.$cachekey);
                //log::error("Server is running: " . self::$handle->ping());
            //}
            return self::$config['serialize'] ? unserialize($value) : $value;
        }
        else
        {
            return self::$handle->get( $cachekey );
        }
    }

    /**
     * 读取缓存过期时间
     * @parem $key        键
     * @return void
     */
    public static function ttl($key)
    {
        //全局禁用cache(调试使用的情况)
        if( ! self::$config['enable'] )
        {
            return false;
        }

        $cachekey = self::_get_key($key);

        if( in_array(self::$cache_type, array('memcached', 'memcache')) )
        {
            // memcache无法获取key的过期时间
            $value = self::$handle->get( $cachekey );
            $expire = empty($value['expire']) ? 0 : $value['expire'];
            return $expire;
        }
        else
        {
            return self::$handle->ttl( $cachekey );
        }
    }

    public static function has($key)
    {
        return static::get($key) ? true : false;
    }

    /**
     * 自增缓存（针对数值缓存）
     * @access public
     * @param  string $name 缓存变量名
     * @param  int    $step 步长
     * @return false|int
     */
    public static function inc($key, $step = 1)
    {
        $cachekey = self::_get_key($key);
        if( in_array(self::$cache_type, array('memcached', 'memcache')) )
        {
            if (!self::has($key))
            {
                self::set($key, 0);
            }
            return self::$handle->increment( $cachekey, $step );
        }
        elseif( self::$cache_type == 'redis' )
        {
            return self::$handle->incrby( $cachekey, $step );
        }
        else
        {
            $value = (int)self::get($key) + $step;
            return self::set($key, $value, 0) ? $value : false;
        }
    }

    /**
     * 自减缓存（针对数值缓存）
     * @access public
     * @param  string $name 缓存变量名
     * @param  int    $step 步长
     * @return false|int
     */
    public static function dec($key, $step = 1)
    {
        $cachekey = self::_get_key($key);

        if( in_array(self::$cache_type, array('memcached', 'memcache')) )
        {
            if (!self::has($key))
            {
                self::set($key, 0);
            }
            return self::$handle->decrement( $cachekey, $step );
        }
        elseif( self::$cache_type == 'redis' )
        {
            return self::$handle->decrby( $cachekey, $step );
        }
        else
        {
            $value = (int)self::get($key) - $step;
            return self::set($key, $value, 0) ? $value : false;
        }
    }

    /**
     * 清除保存在缓存类的缓存
     * @return void
     */
    public static function free_mem($flush_memc = false)
    {
        if( isset(self::$_caches) )
        {
            self::$_caches = array();
        }

        if ($flush_memc)
        {
            return self::$handle->flush();
        }

        return true;
    }

    /**
     * 关闭链接
     * @return void
     */
    public static function free()
    {
        // 前面没有初始化成功，就不要在去初始化了，这里都要关闭连接了还去初始化
        if( self::$handle == null )
        {
            return false;
        }
        if( self::$cache_type == 'memcached' )
        {
            self::$handle->quit();
        }
        else
        {
            self::$handle->close();
        }
    }

    /**
     * 调用 Redis、Memcache 除了 set、get 的其他方法
     * @param $method
     * @param $arguments
     * @return mixed
     */
    public static function __callstatic($method, $arguments)
    {
        return call_user_func_array([self::$handle, $method], $arguments);
    }

}

/* vim: set expandtab: */
