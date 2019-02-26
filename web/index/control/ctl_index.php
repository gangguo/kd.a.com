<?php
namespace index\control;

use kali\core\kali;
use kali\core\db;
use kali\core\req;
use kali\core\tpl;
use kali\core\log;
use kali\core\config;
use kali\core\util;
use kali\core\lang;
use kali\core\lib\cls_msgbox;
use kali\core\lib\cls_page;
use kali\core\lib\cls_menu;
use kali\core\lib\cls_auth;
use admin\model\mod_user;
use admin\model\mod_session;
/**
 *
 */
class ctl_index
{

	public function __construct()
	{
		# code...
	}



	public function index()
	{


        tpl::display('index.tpl');

	}


	public function detail()
	{
        tpl::display('detail.tpl');
	}

	public function list()
	{
        tpl::display('list.tpl');
	}
}