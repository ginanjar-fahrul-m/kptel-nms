<?php

require_once('../includes/config.class.php');
require_once('../includes/database.class.php');

$config = new Configuration();

$conn_c = new Connection('127.0.0.1', 'kptel', 'kptel', $config->get_cacti_database);
$conn_c->open();
$conn_c->close();


?>