<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');
require_once('notification.php');

session_init();

if($_GET) {
	$action = $_GET['action'];
	@$data = $_GET['data'];
	
	session_db_open();
	
	switch($action) {
		case 'getstatusnotification':
			echo json_encode(notification_get_status());
			break;
	}
	
	session_db_close();
}

?>