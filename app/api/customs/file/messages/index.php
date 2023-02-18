<?php
require '../../../../db.php';
require '../../../../mysql.php';
require '../../../../functions.php';

if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);

    $fileId = $request["fileId"];

    $res = getMissingDocs($fileId,$conn);


}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);


function getMissingDocs($fileId, $conn)
{
    $allMissedDocs = array();

    $row = selectRecord("files", "file_id", $fileId, $conn);
    if ($row){
        $row["service"] = selectRecord("services", "id", $row["service_id"], $conn);
        $steps = json_decode("[".$row["service"]["steps"]."]");
        foreach ($steps as $step){
            $allMissedDocs = checkDocs($fileId,$step,$conn);
        }

    }

    return $allMissedDocs;
}


function checkDocs($fileId,$stepId,$conn){

    $step = selectRecord("clearance_steps", "id", $stepId, $conn);
    $docs = json_decode("[".$step["necessary_docs"]."]");

    $currentDocs = selectArrayRecord("file_docs", "file_id", $fileId, $conn);
    $currentDocsIds = array();
    $missedDocs = array();
    foreach ($currentDocs as $currentDoc){
        $currentDocsIds[] = (int) $currentDoc["doc_id"];
    }
    foreach ($docs as $doc) {
        if (!in_array($doc,$currentDocsIds)){
            $missedDocs[] = selectRecord("clearance_docs", "id", $doc, $conn);
        }
    }
//    if (count($missedDocs) == 0){
//        $res["done"] = false;
//        $res['msg'] = $missedDocs;
//    }else{
//        $res["done"] = true;
//        $res["missed"] = $missedDocs;
//    }

    return $missedDocs;
}


?>
