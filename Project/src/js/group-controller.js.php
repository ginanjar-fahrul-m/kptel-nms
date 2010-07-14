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

var url_group = "group-controller.php";

function getGroup(id, callback) {
	var getparam = {
		action: 'group_get',
		data: {
			group_id: id
		}
	}	
	$.getJSON(url_group, getparam, callback);
}

function getGroupList(callback) {
	var getparam = {
		action: 'group_get_all',

		data: {}
	}
	$.getJSON(url_group, getparam, callback);
}

function getPossibleParentList(groupid, callback) {
	var getparam = {
		action: 'group_get_possible_parent_list',
		data: {
			group_id: groupid
		}
	}
	
	$.getJSON(url_group, getparam, callback);
}

function addGroup(parentid, grpname, grplng, grplat, grpdesc) {
	var getparam = {
		action: 'group_add',
		data: {
			parent_id: parentid,
			name: grpname,
			description: grpdesc,
			longitude: grplng,
			latitude: grplat
		}
	}
	$.getJSON(url_group, getparam, function(data) {
		if(data == 0){openDialogBox('Add Failed');}
		else{
			actionAddGroup(data, parentid, grpname, grplng, grplat, grpdesc);
			openDialogBox('Add Group success');
		}
	});
}

function updateGroup(groupid, parentid, named, desc, longi, lati) {
	var getparam = {
		action: 'group_update',
		data: {
			group_id: groupid,
			parent_id: parentid,
			name: named,
			description: desc,
			longitude: longi,
			latitude: lati
		}
	}

	$.getJSON(url_group, getparam, function(data) {
		if(data == 0) {openDialogBox("Edit Group failed");}
		else {
			actionUpdateGroup(groupid, parentid, named, desc, longi, lati);
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
	$.getJSON(url_group, getparam, function(data){
		if(data == 1) {
			actionDeleteGroup(id);
			openDialogBox("Group and its child have successfully deleted");
		}
		else{openDialogBox('delete failed');}
	});
}