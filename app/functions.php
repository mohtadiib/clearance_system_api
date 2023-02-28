<?php
// Greater Password ...
function pwd($length = 8) {
    $pwd = substr(md5(rand(0, 32000)), 0, $length);
    return $pwd;
}

// Greater Password ...
function pwdCaps($length = 8) {
    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < $length; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

// Greater Password ...
function otp($length = 4) {
    $alphabet = '1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < $length; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

// check if String is Email
function checkemail(String $email){
    $email_exp = '/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/';

    if (!preg_match($email_exp, $email)) {
        return false;
    }
    return true;
}

//  check if it's name ..
function isName(String $name){    
    $string_exp = "/^[A-Za-z .'-]+$/";

    if (!preg_match($string_exp, $name)) {
        return false;
    }
    return true;
}

// create files names 
function namer($name){
    $date = date("Ymdhis");
    $name .= '_'.$date;
    return $name;
}

function is_assoc($data){
    if(array_keys($data) !== range(0, count($data) - 1)){
        $data = [$data];
    }
    return $data;
}

 function updateCurrentStep($fileId,$data,$conn){
    $file = selectRecord("files", "id", $fileId, $conn);
    $step = selectRecord("clearance_steps", "id", $data["current_step"], $conn);
    $docs = json_decode("[".$step["necessary_docs"]."]");

    $currentDocs = selectArrayRecord("file_docs", "file_id", $file["file_id"], $conn);
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
    if (count($missedDocs) == 0){
        $result = update("files", $fileId, $data, $conn);
        $res['msg'] = 'Error , IN your syntac , check ur params';
        $res["done"] = true;
        if($result){
            $res['msg'] = $missedDocs;
        }
    }else{
        $res["done"] = false;
        $res["missed"] = $missedDocs;
    }

    return $res;
}

//function selectArrayRecord($table, $field, $value, $conn): array
//{
//    $sql = "SELECT * FROM $table WHERE $field = $value";
//    return query_result($sql, $conn);
//}
//
//function selectRecord($table, $field, $value, $conn){
//    $sql = "SELECT * FROM $table WHERE $field = $value";
//    $result = mysqli_query($conn, $sql);
//    return mysqli_fetch_assoc($result);
//}
//
//function selectItems($fileId, $conn){
//    $newItems = array();
//    $items = selectArrayRecord("file_items","file_id", $fileId, $conn);
//    foreach ($items as $item){
//        $itemRow = selectRecord("clearance_items", "id", $item["item_id"], $conn);
//        $item["item_name"] = $itemRow["name"];
//        $item["key"] = $itemRow["id"];
//        $newItems[] = $item;
//    }
//    return $newItems;
//}
?>
