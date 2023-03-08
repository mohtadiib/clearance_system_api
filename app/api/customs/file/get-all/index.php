<?php
require '../../../../db.php';
require '../../../../mysql.php';

$rows = fetch_all("files",$conn);
$rowsFinal = [];
foreach ($rows as $row){
    if ($row["current_step"]){
        $step = selectRecord("clearance_steps", "id", $row["current_step"], $conn);
        $row["current_step"] = $step["name"];
    }else{
        if ($row["service_id"]){
            $service = selectRecord("services", "id", $row["service_id"], $conn);
            $steps = json_decode("[".$service["steps"]."]");
            $step = selectRecord("clearance_steps", "id", $steps[0], $conn);
            $row["current_step"] = $step["name"];
        }else{
            $row["current_step"] = "لم يحدد";
        }
    }
    $rowsFinal[] = $row;
}

echo json_encode($rowsFinal);
mysqli_close($conn);
?>
