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
 * Potato短信发送类
 *
 * @version $Id$  
 */
class cls_potato
{
    /**
     * 发送验证码
     * @param $potato
     * @param array $params 变量，格式["field1" => "value1", "field2" => "value2"]
     * @param string $tpl
     * @param int $sendtime
     * @return bool
     * @throws Exception
     */
    public static function send( $potato, $params = [], $tpl = 'login', $sendtime = 0 )
    {
        $token = $GLOBALS['config']['potato']['bot_token'];
        $tpl   = $GLOBALS['config']['potato']['text_tpl'][$tpl];

        if (! is_array($params))
        {
            return false;
        }

        // 替换变量
        $find_arr    = [];
        $replace_arr = [];
        foreach ($params as $key => $param)
        {
            $find_arr[]    = '{{'. $key .'}}';
            $replace_arr[] = $param;
        }
        $text = str_replace($find_arr, $replace_arr, $tpl);

        $url = "https://api.potato.im:8443/{$token}/sendPhoneMessage";
        $data = array(
            "phone" => $potato,
            "token" => "bsrt12345",
            "text" => $text,
        );
        $json_str = json_encode($data);

        list($return_code, $return_content) = self::http_post_json($url, $json_str);  
        if ( $return_code == 200 ) 
        {
            log::write('potato_succ', $json_str);
            return true;
        }
        else
        {
            $data = json_decode($return_content, true);
            $msg = "Potato error ".$data['error_code']." ".$data['result'];
            log::write('potato_error', $msg);
            return false;
        }
    }

    public static function http_post_json($url, $data_string) 
    {  
        $ch = curl_init();  
        curl_setopt($ch, CURLOPT_POST, 1);  
        curl_setopt($ch, CURLOPT_URL, $url);  
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);  
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(  
            "Content-Type: application/json; charset=utf-8",  
            "Content-Length: " . strlen($data_string))  
        );  
        ob_start();  
        curl_exec($ch);  
        $return_content = ob_get_contents();  
        ob_end_clean();  
        $return_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);  
        return array($return_code, $return_content);  
    }  

}
