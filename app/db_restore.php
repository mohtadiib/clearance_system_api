<?php
define("BACKUP_PATH", "db_backup/");

$server_name   = "localhost";
$username      = "root";
$password      = "root1234";
$database_name = "world_copy";
$date_string   = "20140306";

$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} > " . BACKUP_PATH . "{$date_string}_{$database_name}.sql";

exec($cmd);
// echo exec('echo "Hi"');

// $restore_file  =  BACKUP_PATH ."20140306_world_copy.sql";

// $cmd = "mysql -h {$server_name} -u {$username} -p{$password} {$database_name} < $restore_file";
// exec($cmd);
?>