<?php
require '../../db.php';
require '../../mysql.php';

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
 $request = json_decode($postdata,true);
 $value = $request["value"];
 $field = $request["field"];
 $table = $request["table"];
 
 
 $sql = "SELECT * FROM $table WHERE $field = $value";

$result = query_result($sql, $conn);

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