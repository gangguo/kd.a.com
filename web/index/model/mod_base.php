<?php

namespace app\model;

use kali\core\kali;
use kali\core\db;
use kali\core\cache;
use kali\core\config;
use kali\core\lib\cls_page;
use kali\core\lib\cls_filter;
use kali\core\lib\cls_validate;
use kali\core\lib\cls_auth;
use kali\core\req;
use kali\core\util;


/**
 * 基础模型
 * @ClassName: mod_base
 * @Author: Gangkui
 * @Date: 2018-11-21 10:13:49
 */
class mod_base
{
    /**
     * @var null 表名
     */
    public static $_table = null;

    /**
     * @var null 主键
     */
    public static $_pk = null;

    /**
     * @var array 数据表的字段
     */
    public static $_field = [];

    /**
     * @var bool 是否使用缓存
     */
    public static $_use_cache = false;
    /**
     * @var null 错误信息
     */
    public static $_error_msg = null;

    /**
     * @var array 字段验证规则
     */
    public static $_rule_field = [];

    /**
     * @var bool 是否操作主数据库
     */
    public static $_is_master = false;

    /**
     * @var int 默认分页显示的条数
     */
    public static $_page_size = 10;

    /**
     * 数据验证方法 各自自定义验证方法
     * @param $data
     * @return bool
     */
    public static function _field_verify($data)
    {
        //static::$_error_msg = '数据验证不合格';
        return true;
    }


    /**
     * 获取数据列表
     * @param array $where
     * @param array $field
     * @param array $join
     * @param array $order
     * @param int $offset
     * @param int $limit
     * @param bool $total
     * @return array|string
     */
    public static function getlist($where = [], $field = [], $join = [], $order = [], $offset = 0, $limit = 0, $total = false)
    {
        if(empty($field))
        {
            foreach (static::$_field as $f)
            {
                $fields[] = static::$_table . '.' .$f;
            }
        }
        else
        {
            $fields = $field;
        }

        if($total)
        {
            $count = static::count($where, $join);
            $pages = cls_page::make($count, req::item('page_size', static::$_page_size));
            $offset = $pages['offset'];
            $limit = $pages['page_size'];
        }

        if(static::$_use_cache)
        {
            $cache_key = md5('getlist' . serialize($where) . serialize($fields) . serialize($order) . serialize($join) . $offset . $limit . $total);
            $data = self::get_cache($cache_key);
            if(!empty($data))
            {
                return $data;
            }
        }

        $query = db::select($fields)->from(static::$_table);

        self::_complate_sql($query, $where, $join, $order);


        if(!empty($limit))
        {
            $query = $query->offset($offset);
            $query = $query->limit($limit);
        }

        $data = $query->execute(static::$_is_master);

        $data = $total ? ['list' => $data, 'pages'=>$pages['show']] : $data;

        if(static::$_use_cache)
        {
            self::set_cache($cache_key, $data);
        }

        return $data;
    }

    /**
     * 获取单挑数据
     * @param $where
     * @param array $field
     * @param array $join
     * @return mixed
     */
    public static function getdump($where, $field = [], $join = [])
    {
        $fields = empty($field) ? static::$_field : $field;

        if(static::$_use_cache)
        {
            $cache_key = md5('getdump' . serialize($where) . serialize($fields) . serialize($join) . static::$_table);
            $data = self::get_cache($cache_key);
            if(!empty($data))
            {
                return $data;
            }
        }

        $query = db::select($fields)->from(static::$_table);

        static::_complate_sql($query, $where, $join);

        $data =  $query->as_row()->execute(static::$_is_master);

        if(static::$_use_cache)
        {
            self::set_cache($cache_key, $data);
        }

        return $data;
    }

    /**
     * 获取某个字段等值
     * @param $where
     * @param $field
     * @param array $join
     * @return mixed
     */
    public static function getfiled($where, $field, $join = [])
    {
        $query = db::select($field)->from(static::$_table);

        static::_complate_sql($query, $where, $join);

        return $query->as_field()->execute(static::$_is_master);
    }

    /**
     * 数据保存
     * @param $data
     * @param array $where
     * @return bool
     */
    public static function save($data, $where = [])
    {
        unset($data['csrf_token_name']);
        if(empty($where) && empty($data[static::$_pk]) )
        {
            if(!static::_field_verify($data))
            {
                return false;
            }
            unset($data[static::$_pk]);

            //新增
            if(in_array('create_time', static::$_field))
            {
                $data['create_time'] = KALI_TIMESTAMP;
            }
            if(in_array('create_user', static::$_field))
            {
                $data['create_user'] = empty(kali::$auth) ? 0 : kali::$auth->uid;
            }

            if(in_array('update_time', static::$_field))
            {
                $data['update_time'] = '0';
            }
            if(in_array('update_user', static::$_field))
            {
                $data['update_user'] = '0';
            }

            $query = db::insert(static::$_table)->set($data);

            static::_complate_sql($query, $where);

            list($id, $rows) = $query->execute(static::$_is_master);

            self::del_cache();

            return $id;
        }
        elseif(!empty($where) || $data[static::$_pk] > 0)
        {
            //编辑
            if(in_array('update_time', static::$_field))
            {
                $data['update_time'] = KALI_TIMESTAMP;
            }
            if(in_array('update_user', static::$_field))
            {
                $data['update_user'] = empty(kali::$auth) ? 0 : kali::$auth->uid;
            }

            $query = db::update(static::$_table)->set($data);

            if(empty($where))
            {
                $query = $query->where(static::$_pk, $data[static::$_pk]);
            }
            else
            {
                static::_complate_sql($query, $where);
            }

            //var_dump($query->compile());exit;
            if($query->execute(static::$_is_master) === false)
            {
                self::$_error_msg = '编辑保存失败';
                return false;
            }

            self::del_cache();
            return true;
        }
    }


    /**
     * 删除
     * @param array $where
     * @return bool
     */
    public static function del($where)
    {
        if(empty($where))
        {
            self::$_error_msg = '删除条件为空';
            return false;
        }

        $data = [
            'delete_user'   => kali::$auth->uid,
            'delete_time'   => KALI_TIMESTAMP,
        ];

        if(is_numeric($where) || is_string($where))
        {
            $data[static::$_pk] = $where;
            $where = [];
        }

        if(self::save($data, $where))
        {
            return true;
        }

        return false;
    }

    /**
     * 获取总数
     * @param array $where
     * @param array $join
     * @return mixed
     */
    public static function count($where = [], $join = [])
    {
        $query = db::select('COUNT(*) AS count')
            ->from(static::$_table);

        static::_complate_sql($query, $where, $join);

        return $query->as_field()->execute(static::$_is_master);
    }

    /**
     * 根据uid 获取用户信息
     * @param $uid
     * @param string $field
     * @return mixed
     */
    public static function get_userinfo($uid, $field = '')
    {
        $info = db::select('status,session_id,potato,email,uid,realname,username,groups,#PB#_admin_group.name AS group_name')
            ->from('#PB#_admin')
            ->join('#PB#_admin_group', 'left')
            ->on('groups', '=', '#PB#_admin_group.id')
            ->where('uid', $uid)
            ->as_row()
            ->execute();

        return empty($field) ? $info : $info[$field];
    }

    /**
     * cookie url地址需要decode
     * @param string $key
     * @param string $default
     * @return array|string
     */
    public static function cookie($key = '', $default = '')
    {
        if(empty($key))
        {
            return req::$cookies;
        }
        $value = empty(req::$cookies[$key]) ? '' : req::$cookies[$key];
        if(empty($value))
        {
            $value = empty($default) ? 'javascript:history.go(-1)' : $default;
        }
        return htmlspecialchars_decode($value);

    }

    /**
     * 读取config表
     * @param $key
     * @return mixed
     */
    public static function config_get($key)
    {
        $val = db::select('value')
            ->from('#PB#_config')
            ->where('name', $key)
            ->as_field()
            ->execute();
        return empty($val) ? $val : json_decode($val, true);
    }

    /**
     * 存config 表
     * @param $key
     * @param $val
     * @return bool
     */
    public static function config_set($key, $val)
    {
        $data = [
            'name' => $key,
            'value' => json_encode($val, JSON_UNESCAPED_UNICODE),
        ];
        $val = db::insert('#PB#_config')
            ->set($data)
            ->dup($data)
            ->execute();
        return empty($val) ? false : true;
    }

    /**
     * 获取config配置文件的信息
     * @param string $key
     * @param string $type
     * @return mixed|null
     */
    public static function get_file_config_val($key = '', $type = 'upload')
    {
        switch ($type)
        {
            case 'upload':
                $config =  config::instance('app_config')->get('upload','upload');
                break;
            case 'database':
                $config = config::instance('app_config')->get('config', 'database');
                break;
            default:
                $config = config::instance('app_config')->get($type);
        }

        return empty($key) ? $config : $config[$key];
    }

    private static function _complate_sql(&$query, $where = [], $join = [], $order = [])
    {

        if(empty($where['and']) && empty($where['or']))
        {
            $query = $query->where($where);
        }

        if(!empty($where['and']))
        {
            $query = $query->where($where['and']);
        }


        if(!empty($where['or']))
        {
            $query->where_open();
            $query->or_where($where['or']);
            $query->where_close();

        }

        if(!empty($join) && !empty($join['table']))
        {
            $query = $query->join($join['table'], $join['type'])
                ->on($join['where'][0], $join['where'][1], $join['where'][2]);
        }
        elseif(!empty($join) && is_array($join[0]))
        {
            foreach ($join as $j)
            {
                $query = $query->join($j['table'], $j['type'])
                    ->on($j['where'][0], $j['where'][1], $j['where'][2]);
            }
        }

        if(empty($order))
        {
            $query->order_by(static::$_table . '.' . static::$_pk, 'desc');
        }
        elseif(is_string($order[0]))
        {
            $query->order_by($order[0], $order[1]);
        }
        elseif(is_array($order[0]))
        {
            foreach ($order as $o)
            {
                $query->order_by($o[0], $o[1]);
            }

        }
    }

    /**
     * 设置缓存，并保存缓存的key
     * @param $key
     * @param $val
     * @param int $time
     * @return bool
     */
    public static function set_cache($key, $val, $time = -1)
    {
        $mother_key = md5(static::$_table);
        $mother = self::get_cache($mother_key);

        if(empty($mother) || !in_array($key, $mother))
        {
            $mother[] = $key;
            cache::set($mother_key, json_encode($mother, JSON_UNESCAPED_UNICODE), $time);
        }

        cache::set($key, json_encode($val, JSON_UNESCAPED_UNICODE), $time);

    }

    /**
     * 读取缓存
     * @param $key
     * @return array|bool|mixed|string
     */
    public static function get_cache($key)
    {
        $data = cache::get($key);
        return empty($data) || is_array($data) ? $data : json_decode($data, true);
    }

    /**
     * 批量删除缓存，新增和修改后需要是批量删除缓存
     * @param string $table
     * @return bool
     */
    public static function del_cache($table = '')
    {
        if(!static::$_use_cache)
        {
            return true;
        }

        $mother = self::get_cache(md5(static::$_table));
        if(empty($mother) || !is_array($mother))
        {
            return true;
        }

        foreach ($mother as $val)
        {
            cache::del($val);
        }
        cache::del(md5(static::$_table));
    }

    public static function get_sql()
    {
        echo '<pre>';
        print_r(db::$queries);
        echo '</pre>';
    }

}