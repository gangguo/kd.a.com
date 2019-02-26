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
class ctl_public
{



    /**
     * 用户登录
     */
    public function login()
    {
        $username = req::item('username', '');
        $password = req::item('password', '');
        $validate = req::item('validate', '');
        $remember = req::item('remember', 0);

        $gourl = req::item('gourl', '');
        $errmsg = '';

        if ( req::method() == 'POST' )
        {
            try
            {
                // 如果开启了图片验证码验证
                if ( self::$config['image_code'] )
                {
                    $vdimg = new cls_securimage();
                    if( empty($validate) || !$vdimg->check($validate) )
                    {
                        throw new \Exception('请输入正确的验证码！');
                    }
                }

                if( $user = kali::$auth->check_user( $username, $password, $remember ) )
                {
                    if ( $user['is_first_login'] )
                    {
                        $_SESSION['uid'] = $user['uid'];
                        $jumpurl = '?ct=index&ac=reset_pwd';
                        exit(header("location: {$jumpurl}"));
                    }
                    // 启动强制MFA认证 并且 用户未绑定，进行绑定流程
                    elseif ( self::$config['mfa_code'] && empty($user['otp_authcode']) )
                    {
                        $secret = cls_google_auth::create_secret();
                        $_SESSION['otp_username'] = $username;
                        $_SESSION['otp_authcode'] = $secret;

                        $jumpurl = '?ct=otp_enable&ac=authentication';
                        exit(header("location: {$jumpurl}"));
                    }
                    else
                    {
                        if ( self::$config['mfa_code'] )
                        {
                            $_SESSION['otp_uid']      = $user['uid'];
                            $_SESSION['otp_remember'] = $remember;
                            $_SESSION['otp_username'] = $username;
                            $_SESSION['otp_authcode'] = $user['otp_authcode'];
                            $jumpurl = '?ct=index&ac=login_otp';
                            exit(header("location: {$jumpurl}"));
                        }
                        else
                        {
                            // 保存用户ID到COOKIE和SESSION
                            kali::$auth->auth_user( $user );
                            $jumpurl = empty($gourl) ? '?ct=index' : $gourl;
                            cls_msgbox::show('成功登录', '成功登录，正在重定向你访问的页面', $jumpurl);
                        }
                    }
                }
            }
            catch ( \Exception $e )
            {
                $errmsg = $e->getMessage();
            }
        }

        tpl::assign('username', $username );
        tpl::assign('password', $password );
        tpl::assign('remember', $remember );
        tpl::assign('errmsg', $errmsg );
        //tpl::assign('image_code', self::$config['image_code'] );
        //tpl::assign('third_login', self::$config['third_login'] );
        tpl::display('login.tpl');
    }

    /**
     * 退出
     */
    public function logout()
    {
        kali::$auth->logout();
        cls_msgbox::show('注销登录', '成功退出登录！', './');
        exit();
    }

	public function regist()
	{
        tpl::display('regist.tpl');
	}
}