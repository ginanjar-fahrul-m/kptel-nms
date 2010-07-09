<?php
/* File   : device-controller.js
 * Role   : Controller (MVC)
 * Author : Ginanjar Fahrul M (gin)
 * E-Mail : ginanjar.fahrul.m@gmail.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * AJAX device-controller.
 *
 */
?>

var url_device = "device-controller.php";

function getDevice(id,callback) {	
	var getparam = {
		action: 'device_get',
		data: {
			device_id: id
		}
	}
	$.getJSON(url_device, getparam, callback);
}

function getDeviceByCactiId(cacid,callback) {
	var getparam = {
		action: 'device_get_by_cacti_id',
		data: {
			cacti_id: cacid
		}
	}
	$.getJSON(url_device, getparam, callback);
}

function getDeviceList(callback) {
	var getparam = {
		action: 'device_get_all',
		data: {	}
	}
	$.getJSON(url_device, getparam, callback);
}

function getCactiDevice(id_cacti,callback) {	
	var getparam = {
		action: 'device_cacti_get',
		data: {
			cacti_id: id_cacti
		}
	}
	$.getJSON(url_device, getparam, callback);
}

function getCactiDeviceList(callback) {
	var getparam = {
		action: 'device_cacti_get_all',
		data: {
			
		}
	}
	
	$.getJSON(url_device, getparam, callback);
}

function getCactiUnlistedDeviceList(callback) {
	var getparam = {
		action: 'device_cacti_get_all_unlisted',
		data: {
			
		}
	}
	
	$.getJSON(url_device, getparam, callback);
}


function getMonitoringGraph(id_cacti, callback) {
	var getparam = {
		action: 'device_cacti_get_monitoring_graph',
		data: {
			cacti_id: id_cacti
		}
	}
	$.get(url_device, getparam, callback);
}

function getCactiGraphList(id_cacti, callback){
	var getparam = {
		action: 'device_cacti_get_graph_list',
		data: {
			cacti_id: id_cacti
		}
	}
	$.getJSON(url_device, getparam, callback);
}

