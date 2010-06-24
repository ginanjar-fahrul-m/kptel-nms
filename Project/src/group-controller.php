<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');
require_once('group.php');

session_init();

if($_GET) {
	$action = $_GET['action'];
	@$data = $_GET['data'];
	
	session_db_open();
	
	switch($action) {
		case 'getgroup':
			echo json_encode(group_get($data['group_id']));
			break;
		
		case 'getgrouplist':
			echo json_encode(group_get_all());
			break;
		
		case 'addgroup':
			echo group_add(
				$data['parent_id'],
				$data['name'],
				$data['description'],
				$data['longitude'],
				$data['latitude']
			);
			break;
		
		case 'updategroup':
			echo group_update(
				$data['group_id'],
				$data['parent_id'],
				$data['name'],
				$data['description'],
				$data['longitude'],
				$data['latitude']
			);
			break;
		
		case 'deletegroup':
			echo group_delete($data['group_id']);
			break;
	}
	
	session_db_close();
}

?>