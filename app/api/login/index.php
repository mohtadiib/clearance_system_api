<?php
require '../../db.php';
require '../../mysql.php';
if(isset($postdata) && !empty($postdata))
{
  $request = json_decode($postdata);

    $phone = $request->phone;
    $password = $request->password;
//  // Sanitize.
$sql = "SELECT * FROM `users` where `phone` = '{$phone}'
          and `password` = '{$password}'";
$result = mysqli_query($conn, $sql);

   $rowcount=mysqli_num_rows($result);
   $row = mysqli_fetch_assoc($result);
    $token = bin2hex(random_bytes(30));
    $sessionData = [
        "user_id" => $row["id"],
        "token" => $token,
    ];

if($row){
    $result = insert("sessions", $sessionData, $conn);
    if ($result){
       $admin = checkAdmin($row["status"]);
       $row["found"] = true;
       $row["admin"] = $admin;

        $headers = apache_request_headers();
        header("user_auth: ".$token);

    }else{
        $row["found"] = false;
    }
}else{
    $row["found"] = false;
 }
  echo json_encode($row);

mysqli_close($conn);
}


function checkAdmin($userStatus):bool{
    if ($userStatus == 1) {
    return true;
     }else {
        return false;
    }
}

?>


