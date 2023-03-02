<?php
require '../../../../../db.php';
require '../../../../../mysql.php';
require '../../../../../functions.php';


if(isset($postdata) && !empty($postdata))
{
    // Extract the data.
    $request = json_decode($postdata,true);
    $step_id = $request["step_id"];


    $service = selectRecord("services", "id", $step_id, $conn);

    $res['msg'] = 'Error , IN your syntac , check ur params';
    $resultData = array();
    if ($service){
        $steps = json_decode("[".$service["steps"]."]");

        foreach ($steps as $step) {
            $stepRow = selectRecord("clearance_steps", "id", $step, $conn);
            $nessData[] = json_decode("[".$stepRow["necessary_data"]."]");

            $necessary_data = array();
            foreach ($nessData as $nessDatItem){
                foreach ($nessDatItem as $nessItem){
                    $necessary_data[] = $nessItem;
                }
            }

            $arr = array_unique($necessary_data);
            $dataUniqueArray = array_values($arr);
        }

        foreach ($dataUniqueArray as $value){
            $resultData[] = selectRecord("clearance_data", "id", $value, $conn);
        }
    }

    if($resultData){
        $res = $resultData;
    }
}else{
    $res['msg'] = 'Error , Didn\'t receive data ..';
}
echo json_encode($res);
mysqli_close($conn);


?>
