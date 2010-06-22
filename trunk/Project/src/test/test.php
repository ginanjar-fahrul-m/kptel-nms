<?php

require_once('../includes/config.php');
require_once('../includes/connection.class.php');
require_once('../includes/security.php');
require_once('../includes/session.php');
require_once('../device.php');

session_init();

/* CONNECTION.CLASS.PHP TEST BEGIN */
echo "Testing class: Connection...\n";
session_set($config['session']['app_db_sess'], new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']));
session_set($config['session']['cacti_db_sess'], new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['cacti_db']));

echo "Do open()...\n";
session_get($config['session']['app_db_sess'])->open();
session_get($config['session']['cacti_db_sess'])->open();

$sql = "SELECT * FROM `user`";
echo "Do query(\"$sql\")...\n";
$res = session_get($config['session']['app_db_sess'])->query($sql);
echo "Results:\n";

while($data = mysql_fetch_assoc($res)) {
	echo $data['username']."\n";
}

$sql = "SELECT * FROM `host`";
echo "Do query(\"$sql\")...\n";
$res = session_get($config['session']['cacti_db_sess'])->query($sql);
echo "Results:\n";

while($data = mysql_fetch_assoc($res)) {
	echo $data['description']."\n";
}
/* CONNECTION.CLASS.PHP TEST END */

/* SECURITY.PHP TEST BEGIN */
$key = 'jiwandono';
echo "Testing security functions...\n";
echo "Get hash string from \"$key\"...\n";
echo "Result: ".($key = get_hash($key))."\n";
/* SECURITY.PHP TEST END */

/* SESSION.PHP TEST BEGIN */
echo "Session test...\n";
session_set('username', 'jiwandono');
echo "Session index \"username\" is \"".session_get('username')."\"\n";
/* SESSION.PHP TEST END */

/* DEVICE.PHP TEST BEGIN */
$device = new Device();

$device->group_id = 1;
$device->device_type_id = 0;
$device->name = 'EMS D5 MADIUN';
$device->description = 'Element Management System DIVRE V Madiun';
$device->longitude = 111.516;
$device->latitude = 7.616;
$device->cacti_id = 40;
//$device->add();

$device = new Device();
$device->device_id = 31;
$device->get();

$device->name = 'EMS D5 MADIUN edit';
$device->update();
/* DEVICE.PHP TEST END */

session_get($config['session']['app_db_sess'])->close();
session_get($config['session']['cacti_db_sess'])->close();
?>