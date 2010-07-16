<?php

/* File   : notification-controller.php
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
require_once('notification.php');

if($_GET) {
	$action = $_GET['action'];
	@$data = $_GET['data'];
	
	switch($action) {
		case 'notification_get_status':
			echo json_encode(notification_get_status());
			break;
		
		case 'notification_threshold_status':
			echo json_encode(notification_threshold_status());
			break;
	}
}

?>