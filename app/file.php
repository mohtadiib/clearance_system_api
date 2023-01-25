<?php
echo readfile("index.php");

$myfile = fopen("index.php", "r") or die("Unable to open file!");

// echo fgets($myfile); # read first line .. 

echo fread($myfile,filesize("index.php"));

// fclose($myfile); # close the file 
?>