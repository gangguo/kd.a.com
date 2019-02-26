<?php
namespace common\model;

/**
 * @ClassName: mod_down_file_type
 * @Author: Gangkui
 * @Date: 2019-01-21 11:03:24
 */
class mod_member extends mod_base
{

    public static $_table = '#PB#_member';

    public static $_pk = 'member_id';

    public static $_field = [
        'member_id', 'username', 'nickname', 'password', 'balance','sex','email', 'avator','status',
        'create_user', 'create_time', 'update_user', 'update_time'
    ];

    public static $status = [
        1 => '启用',
        2 => '禁用',
    ];

    public static $sex = [
        1 => '男',
        2 => '女',
        3 => '其他'
    ];

}