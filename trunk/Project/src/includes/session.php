<?php

require_once('config.php');
require_once('connection.class.php');

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

function session_db_init() {
	global $config;
	
	session_set($config['session']['app_db_sess'], new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']));
	session_set($config['session']['cacti_db_sess'], new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['cacti_db']));
}

function session_db_open() {
	global $config;
	
	session_get($config['session']['app_db_sess'])->open();
	session_get($config['session']['cacti_db_sess'])->open();
}

function session_db_close() {
	global $config;
	
	session_get($config['session']['app_db_sess'])->close();
	session_get($config['session']['cacti_db_sess'])->close();
}

?>