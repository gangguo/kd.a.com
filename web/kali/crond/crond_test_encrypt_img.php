<?php
ini_set('display_errors', 1);
$time_start = microtime(true);
require dirname(__FILE__).'/../core/call.php';

// 生成32位的key
$key = util::random('unique');

// 加密
$source = PATH_ROOT.'/111.jpg';
$encrypt_file = PATH_ROOT.'/111_enc.jpg';
cls_file_crypt::encrypt($source, $encrypt_file, $key);          // encrypt

// 删除真实图片
//unlink(PATH_ROOT.'/111.jpg');

// 解密
$decrypt_file = PATH_ROOT.'/111_dec.jpg';
cls_file_crypt::encrypt($encrypt_file, $decrypt_file, $key);          // encrypt


$size = memory_get_usage();
$unit = array('b','kb','mb','gb','tb','pb'); 
$memory = @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i]; 
$time = microtime(true) - $time_start;
echo "Done in $time seconds\t $memory\n";
