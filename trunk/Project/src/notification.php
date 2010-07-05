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
	
	$i = 0;
	$notifications = array();
	while($row = mysql_fetch_assoc($result)) {
		$notifications[$i] = $row;
		$i++;
	}
	
	return $notifications;
}

?>