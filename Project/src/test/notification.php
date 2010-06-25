<?php

require_once('../includes/config.php');
require_once('../includes/connection.class.php');
require_once('../includes/session.php');

session_init();
session_db_init();
session_db_open();

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
echo '<pre>';
while($row = mysql_fetch_assoc($result)) {
	echo $row['status_fail_date'], ' ', $row['status'], ' ', $row['hostname'], ' - ', $row['description'], ' - ', $row['status_last_error'], "\n";
	$i++;
}
echo '</pre>';

session_db_close();
	
?>