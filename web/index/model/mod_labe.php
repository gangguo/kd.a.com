<?php
namespace app\model;


/**
 * @ClassName: mod_down_file
 * @Author: Gangkui
 * @Date: 2019-01-21 11:03:24
 */
class mod_labe extends mod_base
{

    public static $_table = '#PB#_labe';

    public static $_pk = 'labe_id';

    public static $_field = [
        'labe_id', 'name', 'status', 'sort',
        'create_user', 'create_time', 'update_user', 'update_time', 'delete_user', 'delete_time'
    ];




}