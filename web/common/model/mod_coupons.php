<?php
namespace common\model;


/**
 * @ClassName: mod_coupons
 * @Author: Gangkui
 * @Date: 2019-01-21 11:03:24
 */
class mod_coupons extends mod_base
{

    public static $_table = '#PB#_coupons';

    public static $_pk = 'cpns_id';

    public static $_field = [
        'cpns_id', 'cpns_code', 'cpns_prefix', 'cpns_key', 'cpns_status', 'cpns_limit', 'expire_time','cpns_type',
        'create_user', 'create_time', 'update_user', 'update_time', 'delete_user', 'delete_time'
    ];

    public static $cpns_status = [
        1   => '未使用',
        2   => '已使用',
    ];

    public static $cpns_type = [
        1   => '充值卡',
        2   => '月卡',
        3   => '年卡',
    ];








}