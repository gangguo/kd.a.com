<?php
ini_set('display_errors', 1);
$time_start = microtime(true);
require dirname(__FILE__).'/../core/call.php';

$username = "yangzetao";
$code = "100";
// 发送邮箱验证码
$html = str_replace("{{username}}", $username, $GLOBALS['config']['send_email']['html']);
$html = str_replace("{{code}}", $code, $html);
$sendmail = new cls_mail();
//$sendmail->debug = true;

$host = $GLOBALS['config']['send_email']['host'];
$user = $GLOBALS['config']['send_email']['user'];
$pass = $GLOBALS['config']['send_email']['pass'];
$name = $GLOBALS['config']['send_email']['name'];

$mail = "seatle@foxmail.com";
$sendmail->setServer($host, $user, $pass);      // 设置smtp服务器，普通连接方式
$sendmail->setFrom($user);                      // 设置发件人
$sendmail->setEmailName($name);                 // 设置邮箱昵称
$sendmail->setReceiver($mail);                  // 设置收件人，多个收件人，调用多次
$sendmail->setMail("账号登录验证", $html);      // 设置邮件主题、内容
if (!$sendmail->sendMail())
{
    exit("邮件发送失败，请联系相关负责人！");
}                

echo "邮件发送成功\n";





$size = memory_get_usage();
$unit = array('b','kb','mb','gb','tb','pb'); 
$memory = @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i]; 
$time = microtime(true) - $time_start;
echo "Done in $time seconds\t $memory\n";
