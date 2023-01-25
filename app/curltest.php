<?php
// Get info from another PAGE . 
$curl = curl_init('http://talabatk-awamer.com/apis/tickets/single/');
curl_setopt($curl, CURLOPT_FAILONERROR, true);
curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);  
$result = curl_exec($curl);
echo $result;

// Post info to another PAGE . 
?>