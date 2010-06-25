<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');
require_once('device.php');

session_init();

if($_GET) {
	$action = $_GET['action'];
	@$data = $_GET['data'];
	
	session_db_open();
	
	switch($action) {
		case 'getdevice':
			echo json_encode(device_get($data['device_id']));
			break;
		
		case 'getdevicelist':
			echo json_encode(device_get_all());
			break;
		
		case 'getcactidevice':
			echo json_encode(device_cacti_get($data['cacti_id']));
			break;
		
		case 'getcactidevicelist':
			echo json_encode(device_cacti_get_all());
			break;
		
		case 'adddevice':
			echo device_add(
				$data['group_id'],
				$data['device_type_id'],
				$data['name'],
				$data['description'],
				$data['longitude'],
				$data['latitude'],
				$data['cacti_id']
			);
			break;
		
		case 'updatedevice':
			echo device_update(
				$data['device_id'],
				$data['group_id'],
				$data['device_type_id'],
				$data['name'],
				$data['description'],
				$data['longitude'],
				$data['latitude'],
				$data['cacti_id']
			);
			break;
		
		case 'deletedevice':
			echo device_delete($data['device_id']);
			break;
		
		case 'getcactimonitoringgraph':
			echo device_cacti_get_monitoring_graph($data['cacti_id']);
			break;
	}
	
	session_db_close();
}

?>