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
		<script type="text/javascript" src="vardump.js"></script>
		<script type="text/javascript" src="device-test.js"></script>
	</head>
	
	<body>
		Device ID: <input type="text" id="device_id" /><button onclick="get_device()">Get Device</button><br />
		<button onclick="get_device_list()">Get Device List</button><br />
		Cacti ID: <input type="text" id="cacti_id" /><button onclick="get_device_by_cacti_id()">Get Device by Cacti ID</button><button onclick="get_cacti_device()">Get Cacti Host</button><br />
		<button onclick="get_cacti_device_list()">Get Cacti Host List</button><br />
		<button onclick="get_cacti_unlisted_device_list()">Get Cacti Unlisted Host List</button><br />
		<button onclick="add_device()">Add Device</button><br />
		<button onclick="update_device()">Update Device</button><br />
		<button onclick="delete_device()">Delete Device</button><br />
		<button onclick="get_monitoring_graph()">Get Monitoring Graph</button><br />
		<h2>Monitoring Graph</h2><br />
		<div id="monitoring_graph"></div><br />
	</body>
</html>