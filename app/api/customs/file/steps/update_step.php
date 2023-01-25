<?php
require '../../../../db.php';
require '../../../../mysql.php';
require '../../../../functions.php';

if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);

    $table = $request["table"];
    $fileId = $request["fileId"];
    $data = $request["data"];

    $file = selectRecord("files", "id", $fileId, $conn);
    $step = selectRecord("clearance_steps", "id", $data["current_step"], $conn);
    $step = selectRecord("clearance_steps", "id", $data["current_step"], $conn);
    $docs = json_decode("[".$step["necessary_docs"]."]");

    $currentDocs = selectArrayRecord("file_docs", "file_id", $file["file_id"], $conn);
    foreach ($currentDocs as $currentDoc){
        $currentDocsIds[] = (int) $currentDoc["doc_id"];
    }

    foreach ($docs as $doc) {
        if (!in_array($doc,$currentDocsIds)){
            $missedDocs[] = selectRecord("clearance_docs", "id", $doc, $conn);
        }
    }
    if (count($missedDocs) == 0){
            $result = update($table, $fileId, $data, $conn);
            $res['msg'] = 'Error , IN your syntac , check ur params';
        $res["done"] = true;
        if($result){
                $res['msg'] = $missedDocs;
            }
        }else{
        $res["done"] = false;
        $res["missed"] = $missedDocs;
        }

}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);


function selectRecord($table, $field, $value, $conn){
    $sql = "SELECT * FROM $table WHERE $field = $value";
//    $sql = "SELECT * FROM clearance_steps WHERE id = 6";

    $result = mysqli_query($conn, $sql);

    return mysqli_fetch_assoc($result);
}

function selectArrayRecord($table, $field, $value, $conn): array
{
    $sql = "SELECT * FROM $table WHERE $field = $value";
    return query_result($sql, $conn);
}
?>
