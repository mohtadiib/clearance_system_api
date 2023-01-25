<?php
date_default_timezone_set('Africa/Cairo');
ini_set('date.timezone', 'Africa/Cairo');

$date = new DateTime();
$curTime = $date->getTimestamp();

// echo "\n";
$date = date("Ymdhis");
$random = (string) rand(01, 39);
$code = $date.$random;
?>