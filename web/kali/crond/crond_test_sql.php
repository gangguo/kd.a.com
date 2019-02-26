<?php
ini_set('display_errors', 1);
$time_start = microtime(true);
require dirname(__FILE__).'/../core/call.php';


pub_potato::send('3549903814','333830', 'login');
exit;
// 从原来的表读取数据
$rows = db::select('id, name')->from("call_member")
    ->execute();

foreach ($rows as $row) 
{
    $id = $row['id'];
    unset($row['id']);
    db::update('call_member')->set($row)->where('id','=',$id)
        // 换一个key加密后修改数据
        ->crypt_key("abcd")
        ->crypt_fields("name")
        ->execute();
}
//echo db::last_query();
//var_dump($count);
//exit("\n");
//$group = array('age', 'sex');
//echo db::select(array('age', db::expr('count(*) as count')))->from('users')->where(db::expr('name=1'))->crypt_key("aaaa")->get_compiled_sql();
//exit;
//$sql = "Select * from `call_users`";
//$rows = db::query($sql)->get_one();
//print_r($rows);
//echo "\n";
//exit;
//$sql = db::delete('#PB#_users')->where('name', 'like', '%@example.com')->compile();
//exit($sql."\n");
//$result = db::delete('#PB#_users')->where('email', 'like', '%@example.com')->execute();
//exit;
echo $result = db::update('call_member')
    ->set(array(
        'name'  => "Peter Griffon",
    ))
    ->where('id', '=', '1')
    ->crypt_key("aaaa")
    ->crypt_fields(array('name'))
    ->get_compiled_sql();
exit;

//exit;
//$rows = db::select('sum(price) as price, email, password')->from('#PB#_users')->where('name', 'like', '%John%')
//$rows = db::select('SUM(price) AS `price`, name')->from('#PB#_users')->where('name', 'like', '%John%')
    //->compile();
//print_r($rows);
//exit;
    ////->get_one();
//exit("\n");

echo $sql = db::insert('#PB#_users')->set(array(
    'name' => 'John Random',
    'email' => 'john@example.com',
    'password' => 's0_s3cr3t',
))
->compile();
//->execute();
exit;

//exit;

echo db::insert('#PB#_users')->columns(array(
    'name', 'email', 'password', 'price'
))->values(array(
    array(
        'John Random', 'john@example.com', 's0_s3cr3t', '1'
    ),
    array(
        'John Random', 'john@example.com', 's0_s3cr3t', '2'
    ),
))
//->compile();
->execute();
exit("\n");
//exit;
//$data = array(
    //'name' => '1111',
    //'sex' => '1',
//);
//db::insert('#PB#_users')->set(array(
    //'name' => '1111',
    //'sex' => '1',
//))
//->execute();
//exit;

echo db::delete('#PB#_users')
->where('id', 'in', array(2,3))->execute();

exit;
echo db::update('#PB#_users')->set(array(
    'name' => '1111',
    'email' => '1',
))
->where('id', '=', '1')
//->compile();
->execute();

exit;
//$rsid = db::select()->from('#PB#_users')->query();
//while ($row = db::fetch_one($rsid)) 
//{
    //print_r($row);
//}
//$result = db::select('`id`, users.name as name2, sum(`price`)')->from('users')->where('id', 'jjj')->order_by('name')->execute();
//$result = db::select('`id`, users.name as name2, sum(`price`)')->from('#PB#_users')->join('#PB#_roles','LEFT')->on('roles.id', '=', 'users.role_id')->execute();
exit;
//db::select()->from('users')->where('id', 'between', array(1, 10))->execute();

$result = db::select()->from('users')->where_open()
    ->where('name', 'John')
    ->and_where('email', 'john@example.com')
->where_close()
->or_where_open()
    ->where('name', 'mike')
    ->or_where('name', 'dirk')
->or_where_close()->execute();

db::select()->from('users')->where('name', 'in', array('john', 'simon', 'dirk'))->execute();
//$columns = array('id', 'name');
//$result = db::select_array($columns)->from('users')->execute();

$result = db::select(array('name','the_name'))->from('users')->execute();

$users = db::select('name')->from('users')->distinct(true)->execute();


$size = memory_get_usage();
$unit = array('b','kb','mb','gb','tb','pb'); 
$memory = @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i]; 
$time = microtime(true) - $time_start;
echo "Done in $time seconds\t $memory\n";
