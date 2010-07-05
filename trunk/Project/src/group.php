<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

/* status: ok
 * tester: jiwo
 */
function group_add($parent_id, $name, $description, $longitude, $latitude) {
	global $config;
	
	/* Never trust user input :P */
	$parent_id = mysql_real_escape_string($parent_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	
	$sql = "INSERT INTO `".$config['db']['app_db']."`.`group` (
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
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return session_get($config['session']['db_sess'])->get_last_insert_id();;
	} else {
		return 0;
	}
}

/* status: ok
 * tester: jiwo
 */
function group_update($group_id, $parent_id, $name, $description, $longitude, $latitude) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	$parent_id = mysql_real_escape_string($parent_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	
	$sql = "UPDATE `".$config['db']['app_db']."`.`group` 
			SET
				`group_id` = ".$group_id.",
				`parent_id` = ".$parent_id.",
				`name` = '".$name."',
				`description` = '".$description."',
				`longitude` = ".$longitude.",
				`latitude` = ".$latitude." 
			WHERE `group_id` = ".$group_id;
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return 1;
	} else {
		return 0;
	}
}

/* status: ok
 * tester: jiwo
 */
function group_delete($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	// Delete children devices
	$sql = "DELETE FROM `".$config['db']['app_db']."`.`device`
			WHERE `group_id` = ".$group_id;
	if(!session_get($config['session']['db_sess'])->query($sql)) {
		return 0;
	}
	
	// Recursively delete children groups
	$sql = "SELECT `group_id`
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `parent_id` = ".$group_id;
	if(!$result = session_get($config['session']['db_sess'])->query($sql)) {
		return 0;
	}
	
	while($data = mysql_fetch_assoc($result)) {
		group_delete($data['group_id']);
	}
	
	// Finally, delete parent group
	$sql = "DELETE FROM `".$config['db']['app_db']."`.`group`
			WHERE `group_id` = ".$group_id;
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return 1;
	} else {
		return 0;
	}
}

/* status: ok
 * tester: jiwo
 */
function group_get($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `group_id` = ".$group_id;
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

/* status: ok
 * tester: jiwo
 */
function group_get_all() {
	global $config;
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			ORDER BY `name` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$group_list[$i] = $row;
		$i++;
	}
	
	return $group_list;
}

?>