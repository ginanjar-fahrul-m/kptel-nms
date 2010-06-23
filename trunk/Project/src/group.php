<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

function group_add($parent_id, $name, $description, $longitude, $latitude) {
	global $config;
	
	$parent_id = mysql_real_escape_string($parent_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	
	$sql = "INSERT INTO `group` (
				`parent_id`,
				`name`,
				`description`,
				`longitude`,
				`latitude`)
			VALUES (
				".$parent_id.",
				'".$name."',
				'".$description."', 
				".$longitude.",
				".$latitude.")";
	
	session_get($config['session']['app_db_sess'])->query($sql);
}

function group_update($group_id, $parent_id, $name, $description, $longitude, $latitude) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	$parent_id = mysql_real_escape_string($parent_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	
	$sql = "UPDATE `group` 
			SET
				`group_id` = ".$group_id.",
				`parent_id` = ".$device_type_id.",
				`name` = '".$name."',
				`description` = '".$description."',
				`longitude` = ".$longitude.",
				`latitude` = ".$latitude." 
			WHERE `group_id` = ".$group_id;
	
	session_get($config['session']['app_db_sess'])->query($sql);
}

function group_delete($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	$sql = "DELETE FROM `group`
			WHERE `group_id` = ".$group_id;
	
	session_get($config['session']['app_db_sess'])->query($sql);
}

function group_get($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	$sql = "SELECT * FROM `group` WHERE `group_id` = ".$group_id;
	$result = session_get($config['session']['app_db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

function group_get_all() {
	global $config;
	
	$sql = "SELECT * FROM `group` ORDER BY `name` ASC";
	$result = session_get($config['session']['app_db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$group_list[$i] = $row;
		$i++;
	}
	
	return $group_list;
}

?>