<?php
/* File   : group-controller.js
 * Role   : Controller (MVC)
 * Author : Ginanjar Fahrul M (gin)
 * E-Mail : ginanjar.fahrul.m@gmail.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * AJAX group-controller.
 *
 */
?>

var urlGroup = "group-controller.php";

function getGroup(id, callback) {
	var getparam = {
		action: 'group_get',
		data: {
			group_id: id
		}
	}	
	$.getJSON(urlGroup, getparam, callback);
}

function getGroupList(callback) {
	var getparam = {
		action: 'group_get_all',

		data: {}
	}
	$.getJSON(urlGroup, getparam, callback);
}

function getPossibleParentList(groupId, callback) {
	var getparam = {
		action: 'group_get_possible_parent_list',
		data: {
			group_id: groupId
		}
	}
	
	$.getJSON(urlGroup, getparam, callback);
}

function addGroup(parentId, grpName, grpLng, grpLat, grpDesc) {
	var getparam = {
		action: 'group_add',
		data: {
			parent_id: parentId,
			name: grpName,
			description: grpDesc,
			longitude: grpLng,
			latitude: grpLat
		}
	}
	$.getJSON(urlGroup, getparam, function(data) {
		if(data == 0){openDialogBox('Add Failed');}
		else{
			actionAddGroup(data, parentId, grpName, grpLng, grpLat, grpDesc);
			openDialogBox('Add Group success');
		}
	});
}

function updateGroup(groupId, parentId, grpName, grpDesc, grpLng, grpLat) {
	var getparam = {
		action: 'group_update',
		data: {
			group_id: groupId,
			parent_id: parentId,
			name: grpName,
			description: grpDesc,
			longitude: grpLng,
			latitude: grpLat
		}
	}

	$.getJSON(urlGroup, getparam, function(data) {
		if(data == 0) {openDialogBox("Edit Group failed");}
		else {
			actionUpdateGroup(groupId, parentId, grpName, grpDesc, grpLng, grpLat);
			openDialogBox("Edit Group success");
		}
	});
}

function deleteGroup(id) {
	var getparam = {
		action: 'group_delete',
		data: {
			group_id: id
		}
	}	
	$.getJSON(urlGroup, getparam, function(data){
		if(data == 1) {
			actionDeleteGroup(id);
			openDialogBox("Group and its child have successfully deleted");
		}
		else{openDialogBox('delete failed');}
	});
}