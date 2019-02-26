<?php

namespace  admin\control;

use kali\core\kali;
use kali\core\tpl;
use kali\core\req;
use kali\core\util;
use kali\core\lib\cls_msgbox;

use common\model\mod_member;
use common\model\mod_send_goods;



class ctl_member
{

    public function index()
    {
        $where = [];
        $keyword = req::item('keyword', '');
        if(!empty($keyword))
        {
            $where['or'][] = ['mobile', 'like', "{$keyword}%"];
            $where['or'][] = ['company_name', 'like', "{$keyword}%"];
            $where['or'][] = ['username', 'like', "{$keyword}%"];
        }
        setcookie('type_index_back_url', req::cururl());
        $data = mod_member::getlist($where,'','','','','', true);

        tpl::assign('sexs', mod_member::$sex);
        tpl::assign('status', mod_member::$status);
        tpl::assign('list', $data['list']);
        tpl::assign('pages', $data['pages']);
        tpl::display('member.index.tpl');
    }

    public function send_goods()
    {
        if(empty(req::$posts))
        {
            $member_id = req::item('id', 0);
            if(empty($member_id))
            {
                cls_msgbox::show('系统提示', '没有选择客户', '-1');
            }

            tpl::assign('back_url', mod_member::cookie('type_index_back_url'));
            tpl::display('member.send_goods.tpl');
            exit;
        }

        $data = req::$posts;
        $data['go_off'] = strtotime($data['go_off']);
        if(mod_send_goods::save($data))
        {
            cls_msgbox::show('系统提示', '发货成功，已成功通知对方', mod_member::cookie('type_index_back_url'));
        }
        cls_msgbox::show('系统提示', '发货失败', '-1');
    }

    public function add()
    {

        tpl::assign('back_url', mod_member::cookie('type_index_back_url'));
        tpl::assign('sexs', mod_member::$sex);
        tpl::assign('status', mod_member::$status);
        tpl::display('member.add.tpl');
    }

    public function edit()
    {
        $id = req::item('id', '0');

        $data = mod_member::getdump([[mod_member::$_pk, '=', $id]]);
        tpl::assign('data', $data);
        tpl::assign('sexs', mod_member::$sex);
        tpl::assign('status', mod_member::$status);
        tpl::assign('back_url', mod_member::cookie('type_index_back_url'));


        tpl::assign('sexs', mod_member::$sex);
        tpl::assign('status', mod_member::$status);

        tpl::display('member.edit.tpl');
    }

    public function del()
    {
        $id = req::item('id', '0');

        if(mod_member::del($id))
        {
            cls_msgbox::show('系统提示', '删除成功', mod_member::cookie('type_index_back_url'));
        }
        cls_msgbox::show('系统提示', '删除失败', '-1');

    }

    public function save()
    {
        echo '<pre>';
        print_r(req::$posts);
        echo '</pre>';
        unset(req::$posts['file']);
        if(mod_member::save(req::$posts))
        {
            cls_msgbox::show('系统提示', '操作成功', mod_member::cookie('type_index_back_url'));
        }
        cls_msgbox::show('系统提示', '操作失败', '-1');

        tpl::display('member.index.tpl');
    }
}