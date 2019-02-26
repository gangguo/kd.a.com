<?php
namespace app\model;


/**
 * @ClassName: mod_down_log
 * @Author: Gangkui
 * @Date: 2019-01-21 11:03:24
 */
class mod_down_log extends mod_base
{

    public static $_table = '#PB#_down_log';

    public static $_pk = 'down_log_id';

    public static $_field = [
        'down_log_id', 'down_file_id', 'ip', 'year', 'month', 'day', 'agent',
        'create_user', 'create_time', 'update_user', 'update_time', 'delete_user', 'delete_time'
    ];


}