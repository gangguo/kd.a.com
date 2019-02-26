<?php

namespace  admin\control;

use kali\core\kali;
use kali\core\tpl;
use kali\core\req;
use kali\core\util;
use kali\core\lib\cls_msgbox;

use common\model\mod_file;
use common\model\mod_cate;
use common\model\mod_labe;



class ctl_file
{

    public function index()
    {
        setcookie('type_index_back_url', req::cururl());
        $data = mod_file::getlist('','','','','','', true);

        tpl::assign('shows', mod_file::$show);
        tpl::assign('list', $data['list']);
        tpl::assign('pages', $data['pages']);
        tpl::display('file.index.tpl');
    }

    public function add()
    {
        $cates = mod_cate::getlist([['show', '=', '1']]);
        $labes = mod_labe::getlist([['show', '=', '1']]);

        tpl::assign('types', mod_file::$type);
        tpl::assign('back_url', mod_file::cookie('type_index_back_url'));
        tpl::assign('shows', mod_file::$show);
        tpl::assign('cates', array_column($cates,'name', 'cate_id'));
        tpl::assign('labes', empty($labes) ? [] : array_column($labes,'name', 'labe_id'));
        tpl::display('file.add.tpl');
    }

    public function edit()
    {
        $id = req::item('id', '0');

        $data = mod_file::getdump([[mod_file::$_pk, '=', $id]]);
        tpl::assign('data', $data);
        tpl::assign('shows', mod_file::$show);
        tpl::assign('back_url', mod_file::cookie('type_index_back_url'));

        $cates = mod_cate::getlist([['show', '=', '1']]);
        $labes = mod_labe::getlist([['show', '=', '1']]);
        tpl::assign('types', mod_file::$type);
        tpl::assign('cates', array_column($cates,'name', 'cate_id'));
        tpl::assign('labes', empty($labes) ? [] : array_column($labes,'name', 'labe_id'));

        tpl::display('file.edit.tpl');
    }

    public function del()
    {
        $id = req::item('id', '0');

        if(mod_file::del($id))
        {
            cls_msgbox::show('系统提示', '删除成功', mod_file::cookie('type_index_back_url'));
        }
        cls_msgbox::show('系统提示', '删除失败', '-1');

    }

    public function save()
    {
        echo '<pre>';
        print_r(req::$posts);
        echo '</pre>';
unset(req::$posts['file']);
        if(mod_file::save(req::$posts))
        {
            cls_msgbox::show('系统提示', '操作成功', mod_file::cookie('type_index_back_url'));
        }
        cls_msgbox::show('系统提示', '操作失败', '-1');

        tpl::display('file.index.tpl');
    }
}