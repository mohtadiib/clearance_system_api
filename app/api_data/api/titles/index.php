<?php
header('Content-Type: application/json');
require '../../db.php';

    //fetch table rows from mysql db
    $sql = "SELECT * FROM `titles`";
    $result = mysqli_query($conn, $sql) or die("Error in Selecting " . mysqli_error($connection));

    //create an array
    $emparray = array();
    while($row =mysqli_fetch_assoc($result))
    {
        $emparray[] = $row;
    }
    echo json_encode($emparray);

    //close the db connection
    mysqli_close($conn);
?>