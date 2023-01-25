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

// updateAll("users", [["id"=> 1,"user"=>"35", "username"=>"37", "age"=>"43"],["id"=>2,"user"=>"55", "username"=>"77", "age"=>"44"]],null);
// echo "\n";
?>
