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

 if (isset($request["field1"]) ){
     $field_1 = $request["field1"];
     $id_1 = $request["id"];
     $row = innerSelectDeep("$table","$field_1","$id_1",
         "","","","", $conn);
 }
 if (isset($request["table2"]) ){
     $field_1 = $request["field1"];
     $id_1 = $request["id"];
     $table2 = $request["table2"];
     $field2 = $request["field2"];
     $row = innerSelectDeep("$table","$field_1","$id_1",
         "$table2","$field2","","", $conn);
//     $row = [];
 }
 if (isset($request["table3"]) ){
     $field_1 = $request["field1"];
     $id_1 = $request["id"];
     $table2 = $request["table2"];
     $field2 = $request["field2"];
     $table3 = $request["table3"];
     $field3 = $request["field3"];
     $row = innerSelectDeep("$table","$field_1","$id_1",
         "$table2","$field2","$table3","$field3", $conn);
 }


}

echo json_encode($row);
mysqli_close($conn);
?>
