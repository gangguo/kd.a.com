<?php
/**
 * Kali is a fast, lightweight, community driven PHP 5.4+ framework.
 *
 * @package    KALI
 * @version    1.0.1
 * @author     KALI Development Team
 * @license    MIT License
 * @copyright  2010 - 2018 Kali Development Team
 * @link       http://kaliphp.com
 */

namespace kali\core\lib;

/**
 * 发送短信, 非有效IP登录，必须要输入验证码
 *
 * @version $Id$  
 */
class cls_sms
{
    /**
     * 发送验证码
     */
    public static function send_sms($phone, $content, $sendtime=0)
    {
        $url='http://api.sms.testin.cn/sms';
        $data['apiKey'] = 'd8645b8050c15880a965eacb5bfe47a8';
        $data['content'] = $content;
        $data['op'] = "Sms.send";
        $data['phone'] = $phone;
        $data['templateId'] = "1120";
        $data['ts'] = floor((microtime(true)*1000));

        //array_multisort($data,SORT_ASC);
        $str = '';
        foreach ($data as $k => $v)
        {
            $str .= $k.'='.$v;
        }$str .= 'A8DD99B524AFD923';
        //var_dump($str);
        $data['sig'] = md5($str);


        $params = json_encode($data);
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_VERBOSE, 0);

        $user_agent = "Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)";
        //curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json', 'Content-Length: ' . strlen($params)) );

        curl_setopt($ch, CURLOPT_POSTFIELDS,$params);
        curl_setopt($ch, CURLOPT_USERAGENT, $user_agent);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);//抓取跳转后的页面
        curl_setopt($ch, CURLOPT_TIMEOUT, 25);    // Timeout

        $return = curl_exec($ch);
        $return_array['STATUS'] = curl_getinfo($ch);
        $return_array['ERROR']  = curl_error($ch);
        $return_array['ERRNO'] = curl_errno($ch);
        curl_close($ch);
        if($return_array['ERRNO'] > 0 || $return_array['ERROR'])
        {
            $log_data = array(
                'POSTFIELDS' => $params,
                'return' =>var_export($return_array,TRUE)."\r\n"
            );
            log::write('cls_sms_error', json_encode($log_data));
            return FALSE;
        }
        log::write('cls_sms_succ', $params . ' --- ' . json_encode($return_array));
        return true;
    }

}

