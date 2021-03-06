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

/**
 * 语言类
 */
class lang
{
    public static $config = [];

    /**
     * List of translations
     *
     * @var array
     */
    public static $language  = array();

    /**
     * List of loaded language files
     *
     * @var array
     */
    public static $is_loaded = array();

    public static function _init()
    {
        self::$config = config::instance('app_config')->get('language');

        if ( !empty(self::$config['always_load'])) 
        {
            self::load(self::$config['always_load'], self::$config['default']);
        }
    }

    /**
     * Load a language file
     * 
     * @param   mixed   $langfile   Language file name
     * @param   string  $idiom      Language name (english, etc.)
     * @return void
     * @author seatle <seatle@foxmail.com> 
     * @created time :2017-12-07 17:17
     */
    public static function load($langfile, $idiom = '')
    {
        if (is_array($langfile))
        {
            foreach ($langfile as $value)
            {
                self::load($value, $idiom);
            }

            return;
        }

        $langfile = str_replace('.ini', '', $langfile);
        $langfile = preg_replace('/_lang$/', '', $langfile);
        $langfile .= '.ini';

        // Load the base file, so any others found can override it
        $basepath = kali::$base_root.'/lang/'.$idiom.'/'.$langfile;
        if (empty($idiom) OR ! preg_match('/^[a-z_-]+$/i', $idiom) || !file_exists($basepath) )
        {
            $idiom = empty(self::$config['default']) ? 'en' : self::$config['default'];
            $basepath = kali::$base_root.'/lang/'.$idiom.'/'.$langfile;
            // 默认的语言包不存在就调用回调语言包
            if ( !file_exists($basepath) && !empty(self::$config['fallback']) )
            {
                $idiom = self::$config['fallback'];
                $basepath = kali::$base_root.'/lang/'.$idiom.'/'.$langfile;
            }
        }
        
        if (file_exists($basepath))
        {
            //include($basepath);
            $lang = parse_ini_file($basepath);

            self::$is_loaded[$langfile] = $idiom;
            self::$language = array_merge(self::$language, $lang);
            // 将数组的所有的键都转换为大写字母或小写字母
            self::$language = array_change_key_case(self::$language);
            return true;
        }

        return false;
    }

    public static function set($key, $value)
    {
        if ( empty($key) || empty($value) ) 
        {
            return false;
        }

        self::$language[$key] = $value;
    }

    /**
     * Language get
     *
     * Fetches a single line of text from the language array
     *
     * @param   string  $key            Language line key
     * @param   string  $defaultvalue   key不存在时的默认值
     * @param   array   $replace        替换的模版
     * @param   bool    $log_errors     如果key对应的语言找不到，是否提示警告信息
     * @return  string  Translation
     */
    public static function get($key, $defaultvalue = null, $replace = array(), $log_errors = true)
    {
        $value = isset(self::$language[$key]) ? self::$language[$key] : null;

        // 模版中找不到变量定义
        if ( $value === null )
        {
            if ( $defaultvalue === null && $log_errors === true ) 
            {
                trigger_error("Could not find the language line {$key}", E_USER_WARNING);
            }
            else 
            {
                $value = $defaultvalue;
            }
        }

        if ( $replace ) 
        {
            if (util::is_ordinal_array($replace))
            {
                $value = vsprintf($value, $replace);
            }
            else
            {
                $srh = $rep = [];
                foreach ($replace as $k => $v)
                {
                    $srh[] = '{'. $k .'}';
                    $rep[] = $v;
                }
                $value = str_replace($srh, $rep, $value);
            }
        }
        return $value;
    }

    /**
     * 替换数据库中存在的语言模版
     * 
     * @param string $str
     * @return void
     */
    public static function tpl_change($str)
    {
        if (empty($str)) 
        {
            return $str;
        }

        if ( strpos($str, '{lang.') !== false ) 
        {
            if ( preg_match_all('#\{lang\.(.*?)\}#', $str, $out) )
            {
                $array = array();
                $count = count($out[0]);
                for ($i = 0; $i < $count; $i++) 
                {
                    $array[] = array(
                        'old_str' => $out[0][$i],
                        'key' => $out[1][$i],
                    );
                }
                foreach ($array as $arr) 
                {
                    $old_str = $arr['old_str'];
                    $key = $arr['key'];

                    $new_str = lang::get($key, null, false);
                    if ( !empty($new_str) ) 
                    {
                        $str = str_replace($old_str, $new_str, $str);
                    }
                }
            }
        }
        return $str;
    }
}

/* vim: set expandtab: */

