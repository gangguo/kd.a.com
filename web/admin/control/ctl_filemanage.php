<?php
namespace admin\control;
use kali\core\kali;
use kali\core\db;
use kali\core\req;
use kali\core\tpl;
use kali\core\log;
use kali\core\config;
use kali\core\lib\cls_msgbox;
use kali\core\lib\cls_page;

/**
 * 文件管理控制器
 *
 * @version $Id$
 */
class ctl_filemanage
{
    public static $config = [];

    public function __construct()
    {
        self::$config = config::instance('app_config')->get('upload', 'upload');
    }

   /**
    * 主入口
    */
    public function index()
    {
        $filepath = self::$config['filepath'] . "/file/";
        $files = glob($filepath."/*");
        $list = array();
        foreach ($files as $file)
        {
            $arr = explode("/", $file);
            $filename = end($arr);
            $list[] = array(
                'name'      => $filename,
                'filesize'  => util::convert(filesize(PATH_UPLOADS.'/file/'.$filename)),
                'url'       => URL_UPLOADS.'/file/'.$filename,
                'bcdn_url'  => 'http://bcdn.yiipol.com/'.$filename,
                'filemtime' => date("Y-m-d H:i:s", filemtime($file)),
            );
        }
        tpl::assign( 'list', $list );
        tpl::display('filemanage.index.tpl');
    }

    public function add()
    {
        $timestamp = time();
        $token = md5('unique_salt' . $timestamp);

        tpl::assign('timestamp', $timestamp);
        tpl::assign('token', $token);
        tpl::display('filemanage.add.tpl');
    }

    public function del()
    {
        $names = req::item('names', array());
        foreach ($names as $name)
        {
            $filename = PATH_UPLOADS.'/file/'.$name;
            unlink($filename);
        }

        kali::$auth->save_admin_log("文件删除 ".implode(",",$names));

        cls_msgbox::show("文件管理", "删除成功", req::forword());
    }

    public function refresh_cdn()
    {
        $bcdn_url = req::item('bcdn_url');
        $url = "http://next.su.baidu.com/seed_1460695969374/api/su/zones/561b691a7f60106ea44ebf6b/purge_cache/";
        // 全部刷新
        // $json = '{"purge_everything":true}';
        // 单个刷新
        $json = '{"files":["'.$bcdn_url.'"]}';
        $headers = array(
            "X-CSRF-Token:59acd5d71bb0db7f0a49e0895b2b51c5",
            "X-Http-Method-Override:DELETE",
            "X-Requested-With:XMLHttpRequest",
        );
        $cookie = 'BDUSS=R-SEt5M3F-MXF4OHYzUWVZRTNiZmJsOXpkdXFOMC1JcDV4YVdwSGFMbFctRU5XQVFBQUFBJCQAAAAAAAAAAAEAAABoLcEAeWFuZ3pldGFvODg4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFZrHFZWaxxWVD; SIGNIN_UC=70a2711cf1d3d9b1a82d2f87d633bd8a01958625011; __cas__rn__=195862501; Hm_lvt_1b322c6fd001de8cbc51f01b9b282fec=1452002536;';
        cls_curl::set_headers($headers);
        cls_curl::set_referer("http://next.su.baidu.com/website/host/control/");
        cls_curl::set_cookie($cookie);
        $ret_json = cls_curl::post($url, $json);
        $ret_data = json_decode($ret_json, true);
        if (!$ret_data['success'])
        {
            cls_msgbox::show("文件管理", "<span style='color:red'>CDN刷新失败</span>", req::forword());
        }
        cls_msgbox::show("文件管理", "CDN刷新成功", req::forword());
    }

}
