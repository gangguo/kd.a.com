<?php
namespace common\model;

/**
 * @ClassName: mod_down_file_type
 * @Author: Gangkui
 * @Date: 2019-01-21 11:03:24
 */
class mod_cate extends mod_base
{

    public static $_table = '#PB#_cate';

    public static $_pk = 'cate_id';

    public static $_field = [
        'cate_id', 'name', 'sort', 'show',
        'create_user', 'create_time', 'update_user', 'update_time', 'delete_user', 'delete_time'
    ];

    public static $show = [
        1 => '显示',
        2 => '不显示',
    ];

}