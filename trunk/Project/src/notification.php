<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

function notification_get_status() {
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
			FROM `".$config['db']['cacti_db']."`.`host`
			WHERE
				NOT(`status` = 3) AND
				`disabled` = '' AND
				`monitor` = 'on' AND
				`id` IN (
					SELECT `cacti_id` AS `id`
					FROM `".$config['db']['app_db']."`.`device`
				)
			ORDER BY `status_fail_date` DESC, `status` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$notifications = array();
	while($row = mysql_fetch_assoc($result)) {
		$notifications[] = $row;
	}
	
	return $notifications;
}

function notification_threshold_status() {
	global $config;
	
	$sql = "SELECT
				`host_id` AS `id`,
				`name`,
				`thold_hi`,
				`thold_low`,
				`lastread`
			FROM `".$config['db']['cacti_db']."`.`thold_data`
			WHERE
				`host_id` IN (
					SELECT `cacti_id` AS `id`
					FROM `".$config['db']['app_db']."`.`device`
				)
			ORDER BY `id` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$notifications = array();
	while($row = mysql_fetch_assoc($result)) {
		$notifications[] = $row;
	}
	
	return $notifications;
}

?>