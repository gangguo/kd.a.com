#!/usr/bin/env php
<?php
namespace kali\crond;

use kali\core\kali;


require_once __DIR__.'/../core/autoloader.php';

define('RUN_SHELL', true);
define('SYS_DEBUG', true);
//dev pre pub
define('SYS_ENV', 'dev');

kali::registry();
// 执行CROND
kali::crond();
