<?php
require 'header.php';
// $servername = "localhost";
// $username = "nowrseen_pos-sys";
// $password = "82g;(9UZr#UK";
// $dbname = "nowrseen_pos-system";

$servername = "localhost";
$username = "root";
$password = "root1234";
$dbname = "spc_par";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
 mysqli_set_charset($conn,"utf8");
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
// Get the posted data.
$postdata = file_get_contents("php://input");

?>