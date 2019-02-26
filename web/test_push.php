<?php
header('Content-Type: text/html; charset=utf-8');

require_once __DIR__.'/kali/core/autoloader.php';

use kali\core\kali;
use kali\core\lib\cls_notice;
use kali\core\lib\cls_crypt;

define('SYS_DEBUG', true);
//dev pre pub
define('SYS_ENV', 'dev');

kali::registry();

$key = "2a8b5e7ac2e9476fc983889e54a88dd1";
echo cls_crypt::encode('hello world', $key);
exit("\n");
$uids = ['1'];
$demo_notices = [
    [
        '测试标题',
        '您有处理的订单派车失败，请重新派单',
        '?ct=order&ac=dispatch&id=1901121646290858269'
    ],
    //[
        //'测试标题',
        //'您目的地为Sofia Residence的实时订单已经派车成功。车辆信息：奇瑞 瑞虎1 JB10001 （金边1司机1 855 969069111）',
        //'?ct=order&ac=detail&id=1901121646290858269'
    //],
    //[
        //'测试标题',
        //'收到 新的预约订单，已自动派单给服务商（金边服务商1）',
        //''
    //],
    //[
        //'测试标题',
        //'您有新的实时订单，请查看',
        //''
    //],
    //[
        //'测试标题',
        //'乘客乐马775（+855 969061775）于01月08日 00:00:00前往Daun Penh Phnom Penh Khan Doun Penh Samdach Preah Thoamak Lekhet Ouk St. (184)的预约订单已经调度成功',
        //''
    //],
    //[
        //'测试标题',
        //'您目的地为Daun Penh Phnom Penh Khan Doun Penh Samdach Preah Thoamak Lekhet Ouk St. (184)的预约订单已经派车成功。车辆信息：奇瑞 瑞虎1 JB10001 （金边1司机1 855 969069111）',
        //''
    //]
];

//foreach ($demo_notices as $notices) 
//{
    //list($title, $text, $url) = $notices;  
    //echo cls_notice::websocket($uids, $title, $text, $url)."\n";
//}
//echo cls_notice::websocket($uids, '派车中心', '有一笔预约订单已%撤单', '?ct=order&ac=handle_order_detail&id=1901072115050822375');
echo cls_notice::websocket($uids, '测试标题', '您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单您有处理的订单派车失败，请重新派单', '?ct=order&ac=dispatch&id=1901121646290858269');
//echo cls_notice::websocket($uids, '调度中心', '！@#¥%……&*（）——+=-～·，、。/‘；《》？：“|」「【】1213AA怎的a😄收到一 笔新的预约订单申请，请处理', '?ct=order&ac=dispatch&id=1901072115050822375');
//echo cls_notice::websocket($uids, '派车中心', '有一笔预约订单已被撤单', '?ct=order&ac=handle_order_detail&id=1901072115050822375');
//echo cls_notice::websocket($uids, '消息提示', '这是一个消息提示', '?ct=order&ac=handle_order_detail&id=1901072115050822375');
//echo cls_notice::websocket($uids, '派车中心', '有一笔预约订单已被撤单', '?ct=order&ac=dispatch&id=1901072115050822375');
//echo cls_notice::websocket($uids, '派车中心', '您目的地为Sofia Residence的实时订单已经派车成功。车辆信息：奇瑞 瑞虎1 JB10001 （金边1司机1 855 969069111）', '?ct=order&ac=dispatch&id=1901072115050822375');
exit("\n");
