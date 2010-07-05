<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');
require_once('account.php');

session_init();

if($_GET) {
	$action = $_GET['action'];
	@$data = $_GET['data'];
	
	session_db_open();
	
	switch($action) {
		case 'accountlogin':
			echo account_login($data['username'], $data['password']);
			break;
		
		case 'accountlogout':
			account_logout();
			break;
		
		case 'accountisloggedin':
			echo account_is_logged_in();
			break;
	}
	
	session_db_close();
}

?>