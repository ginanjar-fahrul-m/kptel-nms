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
			FROM `host`
			WHERE `status` < 3 AND `disabled` = '' AND `monitor` = 'on'
			ORDER BY `status` ASC, `status_fail_date` DESC";
	$result = session_get($config['session']['cacti_db_sess'])->query($sql);
	
	$i = 0;
	$notifications = array();
	while($row = mysql_fetch_assoc($result)) {
		$notifications[$i] = $row;
		$i++;
	}
	
	return $notifications;
}

?>