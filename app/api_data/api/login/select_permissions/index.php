<?php
require '../../../db.php';
if(isset($postdata) && !empty($postdata))
{
  $request = json_decode($postdata);
    $id = $request->employee_id;

$sql = "SELECT * FROM `employee_permissions` where employee_id = '{$id}'";
$result = mysqli_query($conn, $sql);

$arr = array();
while($row = mysqli_fetch_assoc($result)) {
    $arr[] = $row;
}
echo json_encode($arr);

mysqli_close($conn);
}
?>


