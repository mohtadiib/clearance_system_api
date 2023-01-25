<?php
require '../../../db.php';
require '../../../mysql.php';
require '../../../functions.php';

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
$request = json_decode($postdata,true);

$data = is_assoc($request["data"]);
$table = $request["table"];
$result = insertAll($table, $data, $conn);

$res['msg'] = 'Error , IN your syntac , check ur params';

if($result){
    $res['msg'] = $result;
}
}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($result);
mysqli_close($conn);
?>