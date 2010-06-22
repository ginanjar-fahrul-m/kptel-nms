<?php

require_once('includes/config.php');
require_once('includes/session.php');

session_init();

if($_POST) {
	$action = $_POST['action'];
	$data = $_POST['data'][$action];
	
	switch($_POST['a']) {
		case 'login':
			echo 'login';
			break;
	}
}

?>