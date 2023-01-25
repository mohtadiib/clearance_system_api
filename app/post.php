<?php
// 'content'=>http_build_query(json_decode(array('id'=> 1)))
$options = array(
    'http'=>array(
      'method'=>"POST",
      'header'=>
        "Accept-language: en\r\n".
      "Content-type: application/x-www-form-urlencoded\r\n",
      'content'=>http_build_query(array('xx'=> 1))
  ));

$context = stream_context_create($options);
$fp = fopen('http://localhost/lab/api', 'r', false, $context);
$response = @stream_get_contents($fp);
if ($response === false) {
    throw new Exception("Problem reading data from " . $url . ", " . $php_errormsg);
}
echo $response;
// fpassthru($fp);
// fclose($fp);

function do_post_request($url, $postdata, $files = NULL)
{
    $data = "";
    $boundary = "---------------------" . substr(md5(rand(0, 32000)), 0, 10);
    if (is_array($postdata)) {
        foreach ($postdata as $key => $val) {
            $data .= "--" . $boundary . "\n";
            $data .= "Content-Disposition: form-data; name=" . $key . "\n\n" . $val . "\n";
        }
    }
    $data .= "--" . $boundary . "\n";
    if (is_array($files)) {
        foreach ($files as $key => $file) {
            $fileContents = file_get_contents($file['tmp_name']);
            $data .= "Content-Disposition: form-data; name=" . $key . "; filename=" . $file['name'] . "\n";
            $data .= "Content-Type: application/x-bittorrent\n";
            $data .= "Content-Transfer-Encoding: binary\n\n";
            $data .= $fileContents . "\n";
            $data .= "--" . $boundary . "--\n";
        }
    }
    $params = array('http' => array('method' => 'POST', 'header' => 'Content-Type: multipart/form-data; boundary=' . $boundary, 'content' => $data));
    $ctx = stream_context_create($params);
    $fp = @fopen($url, 'rb', false, $ctx);
    if (!$fp) {
        throw new Exception("Problem with " . $url . ", " . $php_errormsg);
    }
    $response = @stream_get_contents($fp);
    if ($response === false) {
        throw new Exception("Problem reading data from " . $url . ", " . $php_errormsg);
    }
    return $response;
}


?>