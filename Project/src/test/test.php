<?php

require_once('../includes/config.php');
require_once('../includes/connection.class.php');
require_once('../includes/security.php');
require_once('../includes/session.php');

session_init();

echo "Testing class: Connection...\n";
$conn_a = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);

echo "Do open()...\n";
$conn_a->open();

$sql = "SELECT * FROM `user`";
echo "Do query(\"$sql\")...\n";
$res = $conn_a->query($sql);
echo "Results:\n";

while($data = mysql_fetch_assoc($res)) {
	echo $data['username']."\n";
}

echo "Do close()...\n";
$conn_a->close();

$key = 'jiwandono';
echo "Testing security functions...\n";
echo "Get hash string from \"$key\"...\n";
echo "Result: ".get_hash($key)."\n";

echo "Session test...\n";
session_set('username', 'jiwandono');
echo "Session index \"username\" is \"".session_get('username')."\"\n";

?>