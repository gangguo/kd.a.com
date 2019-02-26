<?php

echo base64_decode("WyJcdTRlMmRcdTU2ZmQiXQ");
exit("\n");
echo base64_encode(json_encode([
    '中国'
]));
exit;
$data = "hello\n";
$padding = ord($data[strlen($data) - 1]);
var_dump($padding);    
exit("\n");
