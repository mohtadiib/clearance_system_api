<?php
require '../../../db.php';
require '../../../mysql.php';

$row = ['err'=>'Error No Feilds'];

if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);
    $tables = $request;
    $dataList = [];
    foreach ($tables as $table) {
        $dataList[$table] = count(fetch_all($table,$conn));
    }

}
echo json_encode($dataList);
mysqli_close($conn);
?>
