<?php
require '../../../../db.php';
require '../../../../mysql.php';
require '../../../../functions.php';

if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);

    $fileId = $request["fileId"];
    $data = $request["data"];

    $res = updateCurrentStep($fileId,$data,$conn);


}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);

?>
