<?php
require 'api/banking.php';
require 'api/db.php';

$msg = 'Err';

    //  if (isset($_POST['user'])) {
    //         $cash = $_POST['cash'];
    //         $user = $_POST['user'];
    //         $msg =  withdraw($user ,$cash , $conn);
    //  }

     if(isset($_POST['user'])) {
        $user = $_POST['user'];
        $msg  = role_back( $conn,$user);
     }

echo json_encode($msg);
?>