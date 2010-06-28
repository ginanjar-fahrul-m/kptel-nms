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
		<script type="text/javascript" src="auth-test.js"></script>
	</head>
	
	<body>
		Username: <input type="text" id="username" /><br />
		Password: <input type="password" id="password" /><br />
		E-Mail: <input type="text" id="email" /><br />
		Full Name: <input type="text" id="fullname" /><br />
		<button onclick="add_account()">Add Account</button><br />
		<button onclick="login()">Login</button><br />
		<button onclick="is_logged_in()">Is logged in?</button><br />
		<button onclick="logout()">Logout</button><br />
	</body>
</html>