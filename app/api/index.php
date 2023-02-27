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

 if (isset($request["table2"]) && isset($request["filed"])){
   $table2 = $request["table2"];
   $row = innerSelect($table,$request["table2"],$request["filed"],$conn);
 }

}

echo json_encode($row);
mysqli_close($conn);
?>
