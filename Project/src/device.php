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
		return session_get($config['session']['app_db_sess'])->get_last_insert_id();
	} else {
		return 0;
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
		return 1;
	} else {
		return 0;
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
		return 1;
	} else {
		return 0;
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
function device_get_by_cacti_id($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "SELECT * FROM `device` WHERE `cacti_id` = ".$cacti_id;
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
				`availability`,
				`cur_time`
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
				`availability`,
				`cur_time`
			FROM `cacti`.`host`
			ORDER BY `description` ASC";
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
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
function device_cacti_get_all_unlisted() {
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
				`availability`,
				`cur_time`
			FROM `cacti`.`host`
			WHERE `id` NOT IN (
				SELECT `cacti_id` AS `id`
				FROM `".$config['db']['app_db']."`.`device`
			)
			ORDER BY `description` ASC";
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
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
function device_cacti_get_monitoring_graph($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "SELECT `id`
			FROM `graph_local`
			WHERE `host_id` = ".$cacti_id;
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
	$graph_start = strtotime('now -1 day');
	$graph_end = strtotime('now');
	echo '<center>';
	while($row = mysql_fetch_assoc($result)) {
		echo '<img src="', $config['cacti']['url'], '/graph_image.php?local_graph_id=', $row['id'], '&rra_id=0&view_type=tree&graph_start=', $graph_start, '&graph_end=', $graph_end, '"></img><br />';
	}
	echo '</center>';
}

function device_cacti_detail_url($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "SELECT `id`, `graph_tree_id`
			FROM `graph_tree_items`
			WHERE `host_id` = ".$cacti_id."
			LIMIT 1";
	$url = '';
	
	if($result = session_get($config['session']['cacti_db_sess'])->query($sql)) {
		if($row = mysql_fetch_assoc($result)) {
			$url = $config['cacti']['url'].'/graph_view.php?action=tree&tree_id='.$row['graph_tree_id'].'&leaf_id='.$row['id'];
		}
	}
	
	return $url;
}

function device_cacti_get_graph_list($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "SELECT `graph_local`.`id` AS `local_graph_id`, `graph_templates`.`name`
			FROM `graph_local`, `graph_templates`
			WHERE `graph_local`.`graph_template_id` = `graph_templates`.`id` AND `graph_local`.`host_id` = ".$cacti_id."
			ORDER BY `graph_templates`.`name` ASC";
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$graph_list[$i] = $row;
		$graph_list[$i]['realtime_url'] = $config['cacti']['url'].'/plugins/realtime/graph_popup_rt.php?local_graph_id='.$row['local_graph_id'];
		
		$sql = "SELECT rra.id, rra.name
				FROM (
					graph_templates_item,
					data_template_data_rra,
					data_template_rrd,
					data_template_data,
					rra
				)
				WHERE graph_templates_item.task_item_id = data_template_rrd.id
					AND data_template_rrd.local_data_id = data_template_data.local_data_id
					AND data_template_data.id = data_template_data_rra.data_template_data_id
					AND data_template_data_rra.rra_id = rra.id
					AND graph_templates_item.local_graph_id = ".$row['local_graph_id']."
				GROUP BY rra.id
				ORDER BY rra.timespan";
		$result2 = session_get($config['session']['cacti_db_sess'])->query($sql);
		
		$j = 0;
		while($row2 = mysql_fetch_assoc($result2)) {
			$rra['url'] = $config['cacti']['url'].'/graph_image.php?action=view&local_graph_id='.$row['local_graph_id'].'&rra_id='.$row2['id'];
			$rra['name'] = $row2['name'];
			$graph_list[$i]['rra_url'][$j] = $rra;
			$j++;
		}
		
		$i++;
	}
	
	return $graph_list;
}

?>