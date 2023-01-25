<?php
require '../../db.php';
require '../../mysql.php';

$result = ['msg'=>'Error No Feilds'];

if(isset($postdata) && !empty($postdata))
{
 // Extract the data.
 $request = json_decode($postdata,true);

 $table = "users";   
 
//  $email = mysqli_real_escape_string($conn, $request["email"]);
 $phone = mysqli_real_escape_string($conn, $request["phone"]);;
 $password = mysqli_real_escape_string($conn, $request["password"]);

//  $sql = "SELECT * FROM `users` WHERE (phone = $phone or email = $email) AND password = $password";
 $sql = "SELECT * FROM `users` WHERE phone = '$phone' AND password = '$password'";
 $row = query_result($sql, $conn);
 
 if(isset($row) && !empty($row)){
    $active = $row[0]['active'];
    $count = count($row);
 // If result matched $myusername and $mypassword, table row must be 1 row
 if($count == 1) {
  $msg = "success";
  if($active != 1){
    $msg = "disabled";
    $row = [];
  }
  $result = ['msg'=> $msg, 'user'=> $row[0]];
 }
 }else {
  $msg = "error";
  $result = ['msg'=> $msg, 'user'=> []];
 }
}
 
echo json_encode($result);
mysqli_close($conn);
?>