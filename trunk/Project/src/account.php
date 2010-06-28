<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');
require_once('includes/security.php');

function account_login($username, $password) {
	global $config;
	
	$username = mysql_real_escape_string($username);
	$password = mysql_real_escape_string($password);
	$hash = security_hash($password);
	
	$sql = "SELECT *
			FROM `user`
			WHERE `username` = '".$username."' AND `password` = '".$hash."'
			LIMIT 1";
	
	if($result = session_get($config['session']['app_db_sess'])->query($sql)) {
		if($row = mysql_fetch_assoc($result)) {
			session_set('userid', $row['user_id']);
			session_set('username', $username);
			session_set('hash', $hash);
			
			return 1;
		} else {
			return 0;
		}
	} else {
		return 0;
	}
}

function account_logout() {
	session_del('username');
	session_del('hash');
}

function account_is_logged_in() {
	if(session_get('username') && session_get('hash')) {
		return 1;
	} else {
		return 0;
	}
}

function account_add($username, $password, $email, $fullname) {
	global $config;
	
	$username = mysql_real_escape_string($username);
	$password = mysql_real_escape_string($password);
	$email = mysql_real_escape_string($email);
	$fullname = mysql_real_escape_string($fullname);
	$hash = security_hash($password);
	
	$sql = "INSERT INTO `user` (
				`username`,
				`password`,
				`email`,
				`fullname`)
			VALUES(
				'".$username."',
				'".$hash."',
				'".$email."',
				'".$fullname."')";
	
	if(session_get($config['session']['app_db_sess'])->query($sql)) {
		return 1;
	} else {
		return 0;
	}
}
	
?>