var url = "../device-controller.php";

function alert_device(data) {
	alert(vardump(data, 5));
}

function get_device() {
	alert("get device id " + document.getElementById("device_id").value);
	
	var getparam = {
		action: 'getdevice',
		data: {
			device_id: document.getElementById("device_id").value
		}
	}
	
	$.getJSON(url, getparam, alert_device);
}

function get_device_list() {
	var getparam = {
		action: 'getdevicelist',
		data: {
		
		}
	}
	
	$.getJSON(url, getparam, alert_device);
}

function get_cacti_device() {
	alert("get cacti host id " + document.getElementById("cacti_id").value);
	
	var getparam = {
		action: 'getcactidevice',
		data: {
			cacti_id: document.getElementById("cacti_id").value
		}
	}
	
	$.getJSON(url, getparam, alert_device);
}

function get_monitoring_graph() {
	alert("get monitoring graph cacti id " + document.getElementById("cacti_id").value);
	
	var getparam = {
		action: 'getcactimonitoringgraph',
		data: {
			cacti_id: document.getElementById("cacti_id").value
		}
	}
	
	$.get(url, getparam, function(data) {
		document.getElementById('monitoring_graph').innerHTML = data;
	});
}

function get_cacti_device_list() {
	var getparam = {
		action: 'getcactidevicelist',
		data: {
			
		}
	}
	
	$.getJSON(url, getparam, alert_device);
}

function add_device() {
	var getparam = {
		action: 'adddevice',
		data: {
			group_id: 1,
			device_type_id: 0,
			name: 'Mencoba',
			description: 'ini adalah grup coba-coba',
			longitude: 110,
			latitude: 7.4,
			cacti_id: 2
		}
	}
	
	$.getJSON(url, getparam, alert_device);
}

function update_device() {
	var getparam = {
		action: 'updatedevice',
		data: {
			device_id: 1,
			group_id: 1,
			device_type_id: 0,
			name: 'Mencobax',
			description: 'ini adalah device coba-coba',
			longitude: 110,
			latitude: 7.4,
			cacti_id: 2
		}
	}
	
	$.getJSON(url, getparam, alert_device);
}

function delete_device() {
	var getparam = {
		action: 'deletedevice',
		data: {
			device_id: 1
		}
	}
	
	$.getJSON(url, getparam, alert_device);
}