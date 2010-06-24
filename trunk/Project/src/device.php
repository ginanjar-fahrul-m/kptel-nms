<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

/* status: ok
 * tester: jiwo
 */
function device_add($group_id, $device_type_id, $name, $description, $longitude, $latitude, $cacti_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	$device_type_id = mysql_real_escape_string($device_type_id);
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
	
	if(session_get($config['session']['app_db_sess'])->query($sql)) {
		return true;
	} else {
		return false;
	}
}

/* status: ok
 * tester: jiwo
 */
function device_update($device_id, $group_id, $device_type_id, $name, $description, $longitude, $latitude, $cacti_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	$group_id = mysql_real_escape_string($group_id);
	$device_type_id = mysql_real_escape_string($device_type_id);
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
	
	if(session_get($config['session']['app_db_sess'])->query($sql)) {
		return true;
	} else {
		return false;
	}
}

/* status: ok
 * tester: jiwo
 */
function device_delete($device_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	
	$sql = "DELETE FROM `device`
			WHERE `device_id` = ".$device_id;
	
	if(session_get($config['session']['app_db_sess'])->query($sql)) {
		return true;
	} else {
		return false;
	}
}

/* status: ok
 * tester: jiwo
 */
function device_get($device_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	
	$sql = "SELECT * FROM `device` WHERE `device_id` = ".$device_id;
	$result = session_get($config['session']['app_db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

/* status: ok
 * tester: jiwo
 */
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

/* status: ok
 * tester: jiwo
 */
function device_cacti_get($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "SELECT 
				`id`,
				`description`,
				`hostname`,
				`monitor`,
				`status`,
				`status_fail_date`,
				`status_rec_date`,
				`status_last_error`,
				`availability`
			FROM `host`
			WHERE `id` = ".$cacti_id;
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

/* status: ok
 * tester: jiwo
 */
function device_cacti_get_all() {
	global $config;
	
	$sql = "SELECT 
				`id`,
				`description`,
				`hostname`,
				`monitor`,
				`status`,
				`status_fail_date`,
				`status_rec_date`,
				`status_last_error`,
				`availability`
			FROM `host`
			ORDER BY `description` ASC";
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$device_list[$i] = $row;
		$i++;
	}
	
	return $device_list;
}

function device_cacti_get_monitoring_data_simple($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "SELECT 
				`id`,
				`description`,
				`hostname`,
				`monitor`,
				`status`,
				`status_fail_date`,
				`status_rec_date`,
				`status_last_error`,
				`availability`
			FROM `host`
			WHERE `id` = ".$cacti_id;
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

?>