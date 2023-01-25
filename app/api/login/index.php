<?php
require '../../db.php';
if(isset($postdata) && !empty($postdata))
{
  $request = json_decode($postdata);

    $email = $request->email;
    $password = $request->password;
  // Sanitize.
$sql = "SELECT `id`,`email`,`password`,`admin`,`employee_id` , `name` FROM `employees` where `email` = '{$email}'
          and `password` = '{$password}'";
$result = mysqli_query($conn, $sql);

  $rowcount=mysqli_num_rows($result);
           $row = mysqli_fetch_array($result);

           $id = $row['id'];
           $admin = $row['admin'];
           $employee_id = $row['employee_id'];

if( $rowcount > 0){
   $policy = [
        'id' => $id,
        'name' => $row['name'],
        'admin' => $admin,
        'employee_id' => $employee_id,
      ];
      echo json_encode($policy);
  }else{
    $policy = [
          'id' => null,
        ];
        echo json_encode($policy);

  }

mysqli_close($conn);
}
?>


