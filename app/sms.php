<?php
require 'header.php';

$PhoneNumber = '249920749357';//$row['phone'];

$txt = 'test 22';
$url = 'https://mazinhost.com/smsv1/sms/api?action=send-sms&api_key=bW9oZWxub3JAZ21haWwuY29tOnFGJDIwcGtuVFc=&to='.$PhoneNumber.'&from=NowrSeenZns&sms='.$txt.'';

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url); 
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/6.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.7) Gecko/20050414 Firefox/1.0.3");
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER,1); 
$result = curl_exec ($ch); 
curl_close ($ch);


?>

