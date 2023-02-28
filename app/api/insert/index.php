<?php
require '../../db.php';
require '../../mysql.php';
require '../../functions.php';

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
$request = json_decode($postdata,true);

$table = $request["table"];
$data = is_assoc($request["data"]);
$result = insertAll($table, $data, $conn);

$res['msg'] = 'Error , IN your syntac , check ur params';

if($result){
    $res['msg'] = $result;
}
}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);
?>
