<?php
/* File   : notification-controller.js
 * Role   : Controller (MVC)
 * Author : Ginanjar Fahrul M (gin)
 * E-Mail : ginanjar.fahrul.m@gmail.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * AJAX notification-controller.
 *
 */
?>

var urlNotif = "notification-controller.php";

function getStatusNotification(callback) {
	var getparam = {
		action: 'notification_get_status',
		data: {
		
		}
	}
	$.getJSON(urlNotif, getparam, callback);
}

function getThresholdNotification(callback) {
	var getparam = {
		action: 'notification_threshold_status',
		data: {
		
		}
	}
	$.getJSON(urlNotif, getparam, callback);
}
