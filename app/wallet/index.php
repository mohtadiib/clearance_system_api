<?php
require 'functions.php';
require '../db.php';

parse_str($postdata, $output);

// wallet update page
$user = (int) $output['user'];
$type =     $output['type'];
$cash =     (int) $output['amount'];
$source = $output['source'];
$reason = $output['reason'];
$role = $output['role'];
$trans_id = $output['trans'];


$msg = ['fields' => $output, 'err' => 'check your fields ..'];

if (isset($type) && $type == 'add') {
    $msg = deposit($conn, $user, $cash, $source, $reason);
} else if (isset($type) && $type == 'take') {
    $msg = withdraw($conn, $user, $cash, $source, $reason);
}

if (isset($role)) {
    $msg = role_back($conn, $trans_id);
}

echo json_encode($msg);
