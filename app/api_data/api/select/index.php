<?php
require '../../db.php';
require '../../mysql.php';

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
 $request = json_decode($postdata,true);
 $id = $request["id"];
 $table = $request["table"];

$result = fetch_by_id($table,$id,$conn);

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