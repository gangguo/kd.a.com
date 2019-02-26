<?php

namespace app\model;
use app;
use kali\core\db;
use kali\core\session;
use kali\core\lib\cls_auth;

/**
 * SESSION模块
 *
 * @version $Id$
 */
class mod_session
{
    public static function del_user_session($uid)
    {
        $session_id = db::select('session_id')
            ->from('#PB#_admin')
            ->where('uid', $uid)
            ->as_field()
            ->execute();

        // 删除服务器上session数据
        session::del( $session_id );

        // 删除session_id值
        db::update('#PB#_admin')
            ->set([
                'session_id' => ''
            ])
            ->where('uid', $uid)
            ->execute();
    }
}
