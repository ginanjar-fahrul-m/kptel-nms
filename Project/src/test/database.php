<?php

require_once('../includes/config.class.php');
require_once('../includes/database.class.php');

$config = new Configuration();

$conn_a = new Connection($config->get_db_hostname(), $config->get_db_username(), $config->get_db_password(), $config->get_app_db());

$conn_a->open();

$res = $conn_a->query("SELECT * FROM `user`");
while($data = mysql_fetch_assoc($res)) {
	echo $data['username']."\n";
}

$conn_a->close();


?>