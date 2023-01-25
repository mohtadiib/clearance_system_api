<?php
require 'header.php';

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "clearance";
//$servername = "localhost";
//$username = "ozsjmcmy_talabatk";
//$password = "ozsjmcmy_talabatk9933##$$";
//$dbname = "ozsjmcmy_talabatk";

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
