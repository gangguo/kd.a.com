<?php
header('Content-Type: text/html; charset=utf-8');

require_once __DIR__ . '/kali/core/autoloader.php';

use kali\core\kali;

define('SYS_DEBUG', true);
//dev pre pub
define('SYS_ENV', 'dev');

kali::registry();
// 运行MVC
kali::run();
