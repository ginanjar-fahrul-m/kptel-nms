var url = "../group-controller.php";

function alert_group(data) {
	alert(vardump(data, 5));
}

function get_group() {
	alert("get group id " + document.getElementById("group_id").value);
	
	var getparam = {
		action: 'getgroup',
		data: {
			group_id: document.getElementById("group_id").value
		}
	}
	
	$.getJSON(url, getparam, alert_group);
}

function get_group_list() {
	var getparam = {
		action: 'getgrouplist',
		data: {
		
		}
	}
	
	$.getJSON(url, getparam, alert_group);
}

function add_group() {
	var getparam = {
		action: 'addgroup',
		data: {
			parent_id: 1,
			name: 'Mencoba',
			description: 'ini adalah grup coba-coba',
			longitude: 110,
			latitude: 7.4
		}
	}
	
	$.getJSON(url, getparam, alert_group);
}

function update_group() {
	var getparam = {
		action: 'updategroup',
		data: {
			group_id: 0,
			parent_id: 1,
			name: 'Mencobax',
			description: 'ini adalah grup coba-coba',
			longitude: 110,
			latitude: 7.4
		}
	}
	
	$.getJSON(url, getparam, alert_group);
}

function delete_group() {
	var getparam = {
		action: 'deletegroup',
		data: {
			group_id: 5
		}
	}
	
	$.getJSON(url, getparam, alert_group);
}