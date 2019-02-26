<?php
ini_set('display_errors', 1);
$time_start = microtime(true);
require dirname(__FILE__).'/../core/call.php';

//$source = '111.jpg';
//$encrypt_file = '111_enc.jpg';
//$decrypt_file = '111_dec.jpg';
//$key = 'D89475D32EA8BBE933DBD299599EEA3E';
//cls_file_crypt::encrypt($source, $encrypt_file, $key);          // encrypt
//cls_file_crypt::encrypt($encrypt_file, $decrypt_file, $key);    // decrypt

pub_zip::add(PATH_ROOT.'/222');
pub_zip::add(PATH_ROOT.'/111.jpg');
pub_zip::zip(PATH_ROOT.'/222.zip');
pub_zip::close();

// 生成32位的key
$key = util::random('unique');

// 加密
$source = PATH_ROOT.'/222.zip';
$encrypt_file = PATH_ROOT.'/222_enc.zip';
cls_file_crypt::encrypt($source, $encrypt_file, $key);          // encrypt

// 删除真实ZIP
//unlink(PATH_ROOT.'/222.zip');

// 解密
$decrypt_file = PATH_ROOT.'/222_dec.zip';
cls_file_crypt::encrypt($encrypt_file, $decrypt_file, $key);          // encrypt

//header("zip");
//echo $plaintext;


$size = memory_get_usage();
$unit = array('b','kb','mb','gb','tb','pb'); 
$memory = @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i]; 
$time = microtime(true) - $time_start;
echo "Done in $time seconds\t $memory\n";
