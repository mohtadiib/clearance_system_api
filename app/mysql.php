<?php

/// FOR COMPLIX QUERIES !!!!
// Query from given sql query ..
function query($sql, $conn){
    $result = mysqli_query($conn, $sql);
    if(mysqli_query($conn,$sql)) return true;
    return false;
}

// Query All Rows from sql query ..
function query_result($sql, $conn){
    $result = mysqli_query($conn, $sql);
    $arr = array();
    while( $row = mysqli_fetch_assoc($result)){
        $arr[] = $row;
    }
    return $arr;
}

/// ..

// Fetch All Rows from given table_name ..
function fetch_all($table, $conn){
    $sql = "SELECT * FROM $table ORDER BY id DESC";
    $result = mysqli_query($conn, $sql);
     $arr = array();
    while( $row = mysqli_fetch_assoc($result)){
        $row["key"] = $row["id"];
        $arr[] = $row;
    }
    return $arr;
}

// Fetch Row from given table_name & table_id ..
function fetch_by_id($table,$id , $conn){
    $sql = "SELECT * FROM $table WHERE `id` = $id";
    $result = mysqli_query($conn, $sql);
    $arr = array();
     while( $row = mysqli_fetch_assoc($result)){
        $arr[] = $row;
    }
    return $arr;
}

// delete from table by id
function delete_by_id($table,$id, $conn){
    $sql = "DELETE FROM $table WHERE `id` = $id";
    if(mysqli_query($conn,$sql)) return true;
    return false;
}

// prepare Keys for insert 
function get_keys(Array $data,$method = "INSERT"){    
    $dataset = "";
    if($method == "INSERT"){
        foreach($data as $val) {
                $dataset .=  "$val,";          
        }
    }else{
        foreach($data as $x => $val) {        
            if(is_string($val)){
                $dataset .=  "$x = \"$val\", ";    
               }else{
                   $dataset .=  "$x = $val, ";
               }  
        }
    }
    return $dataset = rtrim($dataset, ', ');
}

// prepare date for insert 
function get_values(Array $data,$method = "INSERT"){
    
    $dataset = "";
    if($method == "INSERT"){
        foreach($data as $val) {
                $dataset .=  "\"$val\",";          
        }
    }else{
        foreach($data as $x => $val) {            
            if(is_string($val)){
             $dataset .=  "$x = \"$val\", ";    
            }else{
                $dataset .=  "$x = $val, ";
            }
        }
    }
    return $dataset = rtrim($dataset, ', ');
}

// insert into Table with data ..
function insert($table, $data , $conn){

    $datekey = get_keys(array_keys($data));
    $datavalues = get_values(array_values($data));

    $sql = "INSERT INTO $table (";
    
    $sql .= $datekey;
    
    $sql .= ") VALUES (";

    $sql .= $datavalues;
    
    $sql .= ")";

    if(mysqli_query($conn,$sql)) return true;
    return false;
}

// insert("users", array("user"=>"35", "username"=>"37", "age"=>"43"));
// echo "\n";

// Multi insert into Table with data ..
function insertAll($table, $data , $conn){

    $query = '';

    foreach($data as $val){
        
    $datekey = get_keys(array_keys($val));
    $datavalues = get_values(array_values($val));

    $sql = "INSERT INTO $table (";    
    $sql .= $datekey;    
    $sql .= ") VALUES (";
    $sql .= $datavalues;    
    $sql .= ");";
        
    $query .= $sql;
    }

    // print($query);
    if(mysqli_multi_query($conn,$query)) return true;
    return false;
}

// insertAll("users", [["user"=>"35", "username"=>"37", "age"=>"43"],["user"=>"55", "username"=>"77", "age"=>"44"]],$conn);
// echo "\n";

// Update Table with data ..
function update($table, $id ,Array $data , $conn){

    $dataset =  get_keys($data , "UPDATE");

    $sql = "UPDATE $table SET ";

    $sql .= $dataset;
    
    $sql .= " WHERE id = $id ";

    if(mysqli_query($conn,$sql)) return true;
    return false;
}

// update("users",1, array("user"=>"35", "username"=>"37", "age"=>"43"));


// Multi update Table with data ..
function updateAll($table, $data , $conn){

    $query = '';

    foreach($data as $val){
        
    $dataset =  get_keys($val , "UPDATE");

    $sql = "UPDATE $table SET ";

    $sql .= $dataset;
    
    $id = $val['id'];
    $sql .= "WHERE id = $id ; ";
        
    $query .= $sql;
    }

    // print($query);
    if(mysqli_multi_query($conn,$query)) return true;
    return false;
}


function checkToken(){

}


function innerSelect($firstTable,$fieldF,$idF,$secondTable,$fieldS, $conn){
    $newItems = array();
    $items = fetch_all($firstTable, $conn);
    if ($fieldF){
    $items = selectArrayRecord($firstTable,$fieldF, $idF, $conn);
    }
    foreach ($items as $item){
        $itemRow = selectRecord($secondTable, "id",$item[$fieldS], $conn);
        $item[$fieldS] = $itemRow["name"];
        $item["key"] = $itemRow["id"];
        $newItems[] = $item;
    }
    return $newItems;
}
function innerSelectDeep($table_1,$field_1,$id_1,
                         $table_2,$field_2,$table_3,$field_3, $conn){
    $items = fetch_all($table_1, $conn);
    if ($field_1){
    $items = selectArrayRecord($table_1,$field_1, $id_1, $conn);
    }
    if ($table_2){
        $itemTemp =  $items;
        $items = [];
        foreach ($itemTemp as $item){
            $itemRow = selectRecord($table_2, "id",$item[$field_2], $conn);
            $item[$field_2] = $itemRow["name"];
            $item["key"] = $item["id"];
            $items[] = $item;
        }
//        $items[] = $item;
    }
    if ($field_3){
        $itemTemp =  $items;
        $items = [];
        foreach ($itemTemp as $newItem){
            $itemRow = selectRecord($table_3, "id",$newItem[$field_3], $conn);
            $newItem[$field_3] = $itemRow["name"];
            $items[] = $newItem;
        }
    }
    return $items;
}

function selectRecord($table, $field, $value, $conn){
    $sql = "SELECT * FROM $table WHERE $field = $value";
    $result = mysqli_query($conn, $sql);
    return mysqli_fetch_assoc($result);
}

function selectArrayRecord($table, $field, $value, $conn): array
{
    $sql = "SELECT * FROM $table WHERE $field = $value ORDER BY id DESC";
    return query_result($sql, $conn);
}


// updateAll("users", [["id"=> 1,"user"=>"35", "username"=>"37", "age"=>"43"],["id"=>2,"user"=>"55", "username"=>"77", "age"=>"44"]],null);
// echo "\n";
?>
