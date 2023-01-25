<?php
require '../db.php';
require '../mysql.php';

$row = ['err'=>'Error No Feilds'];

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
 $request = json_decode($postdata,true);
 $table = $request["table"];
 $row = fetch_all($table,$conn);
}

echo json_encode($row);
mysqli_close($conn);
?>
