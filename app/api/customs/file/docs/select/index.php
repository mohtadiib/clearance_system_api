<?php
require '../../../../../db.php';
require '../../../../../mysql.php';
require '../../../../../functions.php';


if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);
    $fileId = $request["file_id"];
    $docId = $request["doc_id"];


    $result = selectRecord($fileId, $docId, $conn);

    $res['msg'] = 'Error , IN your syntac , check ur params';

    if($result){
        $res['msg'] = $result;
    }
}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($result);
mysqli_close($conn);


function selectRecord($fileId, $docId, $conn){
    $sql = "SELECT * FROM file_docs WHERE file_id = $fileId and doc_id = $docId";

    $result = mysqli_query($conn, $sql);

    return mysqli_fetch_assoc($result);
}

?>
