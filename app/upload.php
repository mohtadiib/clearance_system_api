<?php
if(isset($_FILES['image'])){
    $msg = $_FILES['image']['name']; 
    $uploadPath = "../uploads/".$msg;
    
    $isUploaded = move_uploaded_file($_FILES["image"]["tmp_name"],$uploadPath);
     if($isUploaded)
       $MSG = 'successfully file uploaded <br/>';
     else
       $MSG = 'something went wrong <br/>'; 

      //  $MSG = json_encode($_FILES['image']);
}else{
    $MSG = 'No File';
}


//header("Access-Control-Allow-Origin: *");
//header("Access-Control-Allow-Methods: GET, POST, PUT");
//header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
//
//$DIR = "/var/www/react-php-upload/";
//$httpPost = file_get_contents("php://input");
//$req = json_decode($httpPost);
//
//$file_chunks = explode(";base64,", $req->image);
//
//$fileType = explode("image/", $file_chunks[0]);
//$image_type = $fileType[1];
//$base64Img = base64_decode($file_chunks[1]);
//
//$file = $DIR . uniqid() . '.png';
//file_put_contents($file, $base64Img);

?>
