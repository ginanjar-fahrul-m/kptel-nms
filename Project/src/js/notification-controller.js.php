<?php
/* File   : notification-controller.js
 * Role   : Controller (MVC)
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * AJAX notification-controller.
 *
 */
?>

var url_notif = "notification-controller.php";

function getStatusNotification(callback) {
	var getparam = {
		action: 'notification_get_status',
		data: {
		
		}
	}
	$.getJSON(url_notif, getparam, callback);
}

function getThresholdNotification(callback) {
	var getparam = {
		action: 'notification_threshold_status',
		data: {
		
		}
	}
	$.getJSON(url_notif, getparam, callback);
}
