<?php

require_once('config.php');

function session_init() {
	session_start();
}

function session_set($index, $content) {
	global $config;
	
	$_SESSION[$config['session']['prefix'].$index] = $content;
}

function session_get($index) {
	global $config;
	
	return $_SESSION[$config['session']['prefix'].$index];
}

function session_del($index) {
	global $config;
	
	unset($_SESSION[$config['session']['prefix'].$index]);
}

?>