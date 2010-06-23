<?php

require_once('../includes/config.php');
require_once('../includes/connection.class.php');
require_once('../includes/session.php');

session_init();
session_db_init();

?>

<html>
	<head>
		<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="cobaJSON.js"></script>
	</head>
	
	<body>
		<input type="text" id="device_id" />
		<a onclick="get_device_list_JSON()">klik di sini untuk mendapatkan device dengan id disamping</a><br />
		<div id="hasilJSON"></div><br />
		<div id="hasilprosesJSON"></div><br />
		<a onclick="add_device_JSON()">klik untuk add device</a>
	</body>
</html>