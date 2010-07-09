<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');
require_once('group.php');
require_once('account.php');

session_init();

if($_GET) {
	$action = $_GET['action'];
	@$data = $_GET['data'];
	
	session_db_open();
	
	switch($action) {
		case 'group_get':
			echo json_encode(group_get($data['group_id']));
			break;
		
		case 'group_get_all':
			echo json_encode(group_get_all());
			break;
		
		case 'group_add':
			if(!account_is_logged_in()) {
				echo $config['function']['return']['fail'];
			} else {
				echo group_add(
					$data['parent_id'],
					$data['name'],
					$data['description'],
					$data['longitude'],
					$data['latitude']
				);
			}
			break;
		
		case 'group_update':
			if(!account_is_logged_in()) {
				echo $config['function']['return']['fail'];
			} else {
				echo group_update(
					$data['group_id'],
					$data['parent_id'],
					$data['name'],
					$data['description'],
					$data['longitude'],
					$data['latitude']
				);
			}
			
			break;
		
		case 'group_delete':
			if(!account_is_logged_in()) {
				echo $config['function']['return']['fail'];
			} else {
				echo group_delete($data['group_id']);
			}
			
			break;
		
		case 'group_get_possible_parent_list':
			echo json_encode(group_get_possible_parent_list($data['group_id']));
			break;
	}
	
	session_db_close();
}

?>