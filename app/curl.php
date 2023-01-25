<?php

// set post fields
$post = [
    'xx' => 'mohtady',
];

$ch = curl_init('http://localhost/lab/api/index.php');
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
// curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

curl_setopt($ch, CURLOPT_POSTFIELDS, 
         http_build_query($post));

// execute!
$response = curl_exec($ch);

// close the connection, release resources used
curl_close($ch);

// do anything you want with your response
// var_dump($response);

$res = json_decode($response);

// Further processing ...
if ($res->status == "OK") { 
    echo $res->xx;
 }
?>