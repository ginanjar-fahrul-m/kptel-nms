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

function addDevice(groupid,devtype,devname,devlng,devlat,cactiid,devdesc){
	var getparam = {
		action: 'device_add',
		data: {
			group_id: groupid,
			device_type_id: devtype,
			name: devname,
			description: devdesc,
			longitude: devlng,
			latitude: devlat,
			cacti_id: cactiid
		}
	}
	$.getJSON(url_device, getparam, function(data) {
		if(data == 0) {alert("Add Device failed");}
		else {
			actionAddDevice(data,groupid,devtype,devname,devlng,devlat,cactiid,devdesc);
			alert("Add Device success");
		}
	});
}

function deleteDevice(id) {
	var getparam = {
		action: 'device_delete',
		data: {
			device_id: id
		}
	}
	
	$.getJSON(url_device, getparam, function(data){
		if(data==1){
			actionDeleteDevice(id);
			alert("Device has successfully deleted");
		}else{alert('delete failed');}
	});
}