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
		<script type="text/javascript" src="group-test.js"></script>
	</head>
	
	<body>
		Group ID: <input type="text" id="group_id" /><button onclick="get_group()">Get Group</button><br />
		<button onclick="get_group_list()">Get Group List</button><br />
		<button onclick="add_group()">Add Group</button><br />
		<button onclick="update_group()">Update Group</button><br />
		<button onclick="delete_group()">Delete Group</button><br />
		<button onclick="get_possible_parent_list()">Get Possible Parents</button><br />
	</body>
</html>