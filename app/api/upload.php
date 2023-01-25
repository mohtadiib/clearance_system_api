<?php
require '../db.php';
require '../mysql.php';
//require '../../assets/upload/';
$uploadPath = "../../assets/upload/";
$httpPost = file_get_contents("php://input");
$req = json_decode($httpPost);

if($req->image){

    $image = $req->image;
    $fileId = $req->file_id;
    $docId = $req->doc_id;
    $uniqName = $req->img_name;

    $file_chunks = explode(";base64,", $image);

    $fileType = explode("image/", $file_chunks[0]);
    $image_type = $fileType[1];
    $base64Img = base64_decode($file_chunks[1]);

//    $img_name = uniqid() . '.png';
    $img_name = $uniqName;
    $img_path_name = $uploadPath . $img_name;

    $isUploaded = file_put_contents($img_path_name, $base64Img);
     if($isUploaded){
//         {"id":"3","imag_path":null,"doc_id":"332","file_id":"23"}
         $fileds = array("img_path"=>$img_name,"doc_id"=>$docId,"file_id"=>$fileId);;
       $inserted =  insert("file_docs", $fileds, $conn);
       if ($inserted){
           $MSG["insert_db"] = true;

       }else{
         $MSG["insert_db"] = false;

       }

         $MSG["done"] = true;
         $MSG["msg"] = 'successfully file uploaded';

     }
     else{
    $MSG["done"] = false;
    $MSG["msg"] = 'something went wrong!';
     }

      //  $MSG = json_encode($_FILES['image']);
}else{
    $MSG["done"] = false;
    $MSG["msg"] = 'No File!';
}

echo json_encode($MSG);

?>
