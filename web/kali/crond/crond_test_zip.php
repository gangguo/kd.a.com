<?php
ini_set('display_errors', 1);
$time_start = microtime(true);
require dirname(__FILE__).'/../core/call.php';

pub_zip::add(PATH_ROOT.'/222');
pub_zip::add(PATH_ROOT.'/111.jpg');
pub_zip::zip(PATH_ROOT.'/222.zip');
pub_zip::close();

var_dump(file_exists(PATH_ROOT.'/222.zip'));

$size = memory_get_usage();
$unit = array('b','kb','mb','gb','tb','pb'); 
$memory = @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i]; 
$time = microtime(true) - $time_start;
echo "Done in $time seconds\t $memory\n";
