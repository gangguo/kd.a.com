<?php
namespace common\model;
use kali\core\req;
use kali\core\util;
use kali\core\db;
use function Sodium\crypto_box_seal;


/**
 * @ClassName: mod_down_file
 * @Author: Gangkui
 * @Date: 2019-01-21 11:03:24
 */
class mod_file extends mod_base
{

    public static $_table = '#PB#_file';

    public static $_pk = 'file_id';

    public static $_field = [
        'file_id', 'member_id', 'title', 'inter', 'cate_id', 'type', 'image','praise','score','car_num',
        'browse_num','show','fee_time','size', 'make_time',
        'create_user', 'create_time', 'update_user', 'update_time', 'delete_user', 'delete_time'
    ];

    public static $type = [
        1   => '种子',
        2   => '压缩文件',
        3   => '网盘',
        4   => '视频',
    ];


    public static $show = [
        1 => '显示',
        2 => '不显示',
    ];

    public static function incre_browse($file_id = 0)
    {
        if($file_id <= 0)
        {
            return false;
        }

        return db::query("update vd_file set browse_num = browse_num+1 where id = {$file_id}");
    }

    public static function incre_praise($file_id = 0)
    {
        if($file_id <= 0)
        {
            return false;
        }

        return db::query("update vd_file set praise = praise+1 where id = {$file_id}");
    }


    public static function getdump($where, $field = [], $join = [])
    {
        $data = parent::getdump($where, $field, $join);

        return self::data_format($data);
    }

    public static function data_format($data)
    {
        if (empty($data))
        {
            return $data;
        }

        $data_ = is_array(current($data)) ? $data : [$data];

        foreach ($data_ as $k=>$v)
        {
            if(!empty($v['cate_id']))
            {
                $data_[$k]['cate_name'] = mod_cate::getfiled([[mod_cate::$_pk, '=', $v['cate_id']]],'name');
            }

            $data_[$k]['labes'] = mod_file_labe::getlist(
                [
                    [mod_file_labe::$_table . '.file_id', '=', $v[self::$_pk]],
                ],
                [
                    mod_file_labe::$_table . '.labe_id',
                    mod_labe::$_table . '.name AS labe_name',
                ],
                [
                    'table' => mod_labe::$_table,
                    'type'  =>  'left',
                    'where' => [mod_file_labe::$_table . '.labe_id', '=', mod_labe::$_table . '.' . mod_labe::$_pk],
                ]
            );

            $data_[$k]['urls'] = mod_file_url::getlist(
                [
                    [mod_file_url::$_table . '.file_id', '=', $v[self::$_pk]],
                ]
            );

        }

        return is_array(current($data)) ? $data_ : current($data_);
    }
    public static function getlist($where = [], $field = [], $join = [], $order = [], $offset = 0, $limit = 0, $total = false)
    {

        $data = parent::getlist($where, $field, $join, $order, $offset, $limit, $total);

        $list = $total ? $data['list'] : $data;

        if(empty($list) || !is_array($list))
        {
            return $data;
        }

        $list = self::data_format($list);

        if($total)
        {
            $data['list'] = $list;
        }
        else
        {
            $data = $list;
        }

        return $data;
    }



    public static function save($data, $where = [])
    {
        $url_data = empty($data['url']) ?  [] : $data['url'];
        $labe_data = empty($data['labe_id']) ? [] : $data['labe_id'];
        unset($data['url'], $data['labe_id']);
        $res = 0;

        if(!empty($data[self::$_pk]))
        {
            $where[] = [self::$_pk, '=', $data[self::$_pk]];
        }

        db::start();

        while (true)
        {
            if(false == $file_id = parent::save($data, $where))
            {
                $res = -1;
                break;
            }

            if(!empty($url_data))
            {
                if(!empty($where) && !empty($where))
                {
                    mod_file_url::del($where);
                }
                $urld = [];
                foreach ($url_data as $k=>$v)
                {
                    $urld[$k]['file_id'] = empty($data[self::$_pk]) ? $file_id : $data[self::$_pk];
                    $urld[$k]['url'] = $v;
                }

                if(false === mod_file_url::save($urld))
                {
                    $res = -2;
                    break;
                }
            }

            if(!empty($labe_data))
            {
                if(!empty($labe_data) && !empty($where))
                {
                    mod_file_labe::del($where);
                }
                $labed = [];
                foreach ($labe_data as $k=>$v)
                {
                    $labed[$k]['file_id'] = empty($data[self::$_pk]) ? $file_id : $data[self::$_pk];
                    $labed[$k]['labe_id'] = $v;
                }

                if(false === mod_file_labe::save($labed))
                {
                    $res = -3;
                    break;
                }
            }


            break;
        }


        $res < 0 ? db::rollback() : db::commit();
        db::end();

        return $res < 0 ? $res : $file_id;
    }

}