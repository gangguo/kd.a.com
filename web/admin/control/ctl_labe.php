<?php

namespace  admin\control;

use kali\core\kali;
use kali\core\tpl;
use kali\core\req;
use kali\core\util;
use kali\core\lib\cls_msgbox;

use common\model\mod_labe;


class ctl_labe
{

    public function index()
    {
        setcookie('type_index_back_url', req::cururl());
        $data = mod_labe::getlist('','','','','','', true);

        tpl::assign('shows', mod_labe::$show);
        tpl::assign('list', $data['list']);
        tpl::assign('pages', $data['pages']);
        tpl::display('labe.index.tpl');
    }

    public function add()
    {
        tpl::assign('back_url', mod_labe::cookie('type_index_back_url'));
        tpl::assign('shows', mod_labe::$show);
        tpl::display('labe.add.tpl');
    }

    public function edit()
    {
        $id = req::item('id', '0');

        $data = mod_labe::getdump([[mod_labe::$_pk, '=', $id]]);

        tpl::assign('data', $data);
        tpl::assign('shows', mod_labe::$show);
        tpl::assign('back_url', mod_labe::cookie('type_index_back_url'));


        tpl::display('labe.edit.tpl');
    }

    public function del()
    {
        $id = req::item('id', '0');

        if(mod_labe::del($id))
        {
            cls_msgbox::show('系统提示', '删除成功', mod_labe::cookie('type_index_back_url'));
        }
        cls_msgbox::show('系统提示', '删除失败', '-1');

    }

    public function save()
    {
        if(mod_labe::save(req::$posts))
        {
            cls_msgbox::show('系统提示', '操作成功', mod_labe::cookie('type_index_back_url'));
        }
        cls_msgbox::show('系统提示', '操作失败', '-1');

        tpl::display('labe.index.tpl');
    }
}