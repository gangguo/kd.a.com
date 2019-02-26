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
 * 测试
 *
 * @version $Id$
 */
class ctl_demo
{
    public function __construct()
    {
    }

    public function index()
    {
        tpl::display('demo.index.tpl');
    }

}
