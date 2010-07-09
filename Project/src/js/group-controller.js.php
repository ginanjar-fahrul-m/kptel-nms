<?php
/* File   : group-controller.js
 * Role   : Controller (MVC)
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
		action: 'group_add',
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

function deleteGroup(id, callback) {
	var getparam = {
		action: 'group_delete',
		data: {
			group_id: id
		}
	}	
	$.getJSON(url_group, getparam, callback);
}