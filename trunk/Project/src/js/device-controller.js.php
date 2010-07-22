<?php
/* File   : device-controller.js
 * Role   : Controller (MVC)
 * Author : Ginanjar Fahrul M (gin)
 *			Mohammad Rizky Adrian
 * E-Mail : ginanjar.fahrul.m@gmail.com
 *			moh.rizkya@yahoo.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * AJAX device-controller.
 *
 */
?>

var urlDevice = "device-controller.php";

function getDevice(id,callback) {	
	var getparam = {
		action: 'device_get',
		data: {
			device_id: id
		}
	}
	$.getJSON(urlDevice, getparam, callback);
}

function getDeviceByCactiId(cacid,callback) {
	var getparam = {
		action: 'device_get_by_cacti_id',
		data: {
			cacti_id: cacid
		}
	}
	$.getJSON(urlDevice, getparam, callback);
}

function getDeviceList(callback) {
	var getparam = {
		action: 'device_get_all',
		data: {	}
	}
	$.getJSON(urlDevice, getparam, callback);
}

function getCactiDevice(cactiId,callback) {	
	var getparam = {
		action: 'device_cacti_get',
		data: {
			cacti_id: cactiId
		}
	}
	$.getJSON(urlDevice, getparam, callback);
}

function getCactiDeviceList(callback) {
	var getparam = {
		action: 'device_cacti_get_all',
		data: {
			
		}
	}
	
	$.getJSON(urlDevice, getparam, callback);
}

function getCactiUnlistedDeviceList(callback) {
	var getparam = {
		action: 'device_cacti_get_all_unlisted',
		data: {
			
		}
	}
	
	$.getJSON(urlDevice, getparam, callback);
}


function getMonitoringGraph(cactiId, callback) {
	var getparam = {
		action: 'device_cacti_get_monitoring_graph',
		data: {
			cacti_id: cactiId
		}
	}
	$.get(urlDevice, getparam, callback);
}

function getCactiGraphList(cactiId, callback){
	var getparam = {
		action: 'device_cacti_get_graph_list',
		data: {
			cacti_id: cactiId
		}
	}
	$.getJSON(urlDevice, getparam, callback);
}

function addDevice(groupId,devType,devName,devLng,devLat,cactiId,devDesc){
	var getparam = {
		action: 'device_add',
		data: {
			group_id: groupId,
			device_type_id: devType,
			name: devName,
			description: devDesc,
			longitude: devLng,
			latitude: devLat,
			cacti_id: cactiId
		}
	}
	$.getJSON(urlDevice, getparam, function(data) {
		if(data == 0) {openDialogBox("Add Device failed");}
		else {
			actionAddDevice(data,groupId,devType,devName,devLng,devLat,cactiId,devDesc);
			openDialogBox("Add Device success");
		}
	});
}

function updateDevice(devId, groupId, devType, devName, devDesc, devLng, devLat, cactiId) {
	var getparam = {
		action: 'device_update',
		data: {
			device_id: devId,
			group_id: groupId,
			device_type_id: devType,
			name: devName,
			description: devDesc,
			longitude: devLng,
			latitude: devLat,
			cacti_id: cactiId
		}
	}
	$.getJSON(urlDevice, getparam, function(data) {
		if(data == 0) {openDialogBox("Edit Device failed");}
		else {
			actionUpdateDevice(devId, groupId, devType, devName, devDesc, devLng, devLat, cactiId);
			openDialogBox("Edit Device success");
		}
	});
}

function deleteDevice(devId) {
	var getparam = {
		action: 'device_delete',
		data: {
			device_id: devId
		}
	}
	$.getJSON(urlDevice, getparam, function(data){
		if(data==1){
			actionDeleteDevice(devId);
			openDialogBox("Device has successfully deleted");
		}else{openDialogBox('delete failed');}
	});
}