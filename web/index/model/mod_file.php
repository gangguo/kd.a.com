<?php
namespace app\model;


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
        'file_id', 'title', 'inter', 'aip_pass', 'image_cover', 'realname', 'filepath','size','down_url',
        'praise', 'browse_num','type','area_id','cate_id',
        'create_user', 'create_time', 'update_user', 'update_time', 'delete_user', 'delete_time'
    ];

    public static $type = [
        1   => '压缩文件',
        2   => '图片',
        3   => '视频',
    ];



    



}