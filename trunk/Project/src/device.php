<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

function device_add($group_id, $device_type, $name, $description, $longitude, $latitude, $cacti_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	$device_type = mysql_real_escape_string($device_type);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "INSERT INTO `device` (
				`group_id`,
				`device_type_id`,
				`name`,
				`description`,
				`longitude`,
				`latitude`,
				`cacti_id`)
			VALUES (
				".$group_id.",
				".$device_type_id.",
				'".$name."',
				'".$description."', 
				".$longitude.",
				".$latitude.",
				".$cacti_id.")";
	
	session_get($config['session']['app_db_sess'])->query($sql);
}

function device_update($device_id, $group_id, $device_type, $name, $description, $longitude, $latitude, $cacti_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	$group_id = mysql_real_escape_string($group_id);
	$device_type = mysql_real_escape_string($device_type);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "UPDATE `device` 
			SET
				`group_id` = ".$group_id.",
				`device_type_id` = ".$device_type_id.",
				`name` = '".$name."',
				`description` = '".$description."',
				`longitude` = ".$longitude.",
				`latitude` = ".$latitude.",
				`cacti_id` = ".$cacti_id."
			WHERE `device_id` = ".$device_id;
	
	session_get($config['session']['app_db_sess'])->query($sql);
}

function device_delete($device_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	
	$sql = "DELETE FROM `device`
			WHERE `device_id` = ".$device_id;
	
	session_get($config['session']['app_db_sess'])->query($sql);
}

function device_get($device_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	
	$sql = "SELECT * FROM `device` WHERE `device_id` = ".$device_id;
	$result = session_get($config['session']['app_db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

function device_get_all() {
	global $config;
	
	$sql = "SELECT * FROM `device` ORDER BY `name` ASC";
	$result = session_get($config['session']['app_db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$device_list[$i] = $row;
		$i++;
	}
	
	return $device_list;
}

?>