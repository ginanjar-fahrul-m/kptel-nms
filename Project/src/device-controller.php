<?php

/* File   : device-controller.php
 * Role   : Controller (MVC)
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * Controller ini menerima aksi dari View dan memanggil fungsi
 * dari Model yang sesuai.
 */

require_once('includes/config.php');
require_once('device.php');
require_once('account.php');

session_init();

if($_GET) {
	$action = $_GET['action'];
	@$data = $_GET['data'];
	
	switch($action) {
		case 'device_get':
			echo json_encode(device_get($data['device_id']));
			break;
		
		case 'device_get_by_cacti_id':
			echo json_encode(device_get_by_cacti_id($data['cacti_id']));
			break;
		
		case 'device_get_all':
			echo json_encode(device_get_all());
			break;
		
		case 'device_add':
			if(!account_is_logged_in()) {
				echo $config['function']['return']['failure'];
			} else {
				echo device_add(
					$data['group_id'],
					$data['device_type_id'],
					$data['name'],
					$data['description'],
					$data['longitude'],
					$data['latitude'],
					$data['cacti_id']
				);
			}
			
			break;
		
		case 'device_update':
			if(!account_is_logged_in()) {
				echo $config['function']['return']['failure'];
			} else {
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
			}
			
			break;
		
		case 'device_delete':
			if(!account_is_logged_in()) {
				echo $config['function']['return']['failure'];
			} else {
				echo device_delete($data['device_id']);
			}
			
			break;
			
		case 'device_cacti_get':
			echo json_encode(device_cacti_get($data['cacti_id']));
			break;
		
		case 'device_cacti_get_all':
			echo json_encode(device_cacti_get_all());
			break;
		
		case 'device_cacti_get_all_unlisted':
			echo json_encode(device_cacti_get_all_unlisted());
			break;

		
		case 'device_cacti_get_monitoring_graph':
			echo device_cacti_get_monitoring_graph($data['cacti_id']);
			break;
		
		case 'device_cacti_detail_url':
			header('Location: '.device_cacti_detail_url($data['cacti_id']));
			break;
		
		case 'device_jump_to_cacti':
			header('Location: '.$config['db']['cacti']['url']);
			break;
		
		case 'device_cacti_get_graph_list':
			echo json_encode(device_cacti_get_graph_list($data['cacti_id']));
			break;
	}
}

?>