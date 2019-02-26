<?php
ini_set('display_errors', 1);
$time_start = microtime(true);
require dirname(__FILE__).'/../core/call.php';

$client = new websocket_client();
$client->connect("127.0.0.1", 9527, '/json?utma=jjj&uid=1&name=yangzetao');

for ($i = 0; $i < 10; $i++) 
{
    $payload = json_encode(array(
        'Users' => '1,2',
        'Event' => 'UserMessage',
        'Msg' => 'Hello'
    ));
    $rs = $client->send_data($payload);

    if( $rs !== true )
    {
        echo "send data error...\n";
    }
    else
    {
        echo "ok\n";
    }
    $client->recv_data();
}




$size = memory_get_usage();
$unit = array('b','kb','mb','gb','tb','pb'); 
$memory = @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i]; 
$time = microtime(true) - $time_start;
echo "Done in $time seconds\t $memory\n";
