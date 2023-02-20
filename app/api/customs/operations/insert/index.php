<?php
require '../../../../db.php';
require '../../../../mysql.php';
require '../../../../functions.php';

$date = date("Ymdhms");
$random = (string) rand(100, 999);
$operationId = $date.$random;

if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);
    $baseData = $request["base_data"];
    $fileData = is_assoc($request["files"]);
    foreach ($fileData as $file){
        $files[] = array("file_id"=>$file,"operation_id"=>$operationId,"total"=>0);
    }
    $baseData["operation_id"] = $operationId;
    $result = insert("operations", $baseData, $conn);
    if($result){
        $result = insertAll("operation_files", $files, $conn);
    }

    $res['msg'] = 'Error , IN your syntac , check ur params';

    if($result){
        $res['msg'] = $result;
    }

}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);
?>
