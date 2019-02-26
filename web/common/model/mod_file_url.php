<?php
namespace common\model;


/**
 * @ClassName: mod_down_file
 * @Author: Gangkui
 * @Date: 2019-01-21 11:03:24
 */
class mod_file_url extends mod_base
{

    public static $_table = '#PB#_file_url';

    public static $_pk = 'id';

    public static $_field = [
        'id', 'file_id', 'url','url_type'
    ];


}