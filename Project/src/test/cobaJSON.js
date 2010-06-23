function get_device_list_JSON() {
	var getparam = {
		action: 'getdevice',
		data: {
			device_id: document.getElementById("device_id").value
		}
	}
	
	$.getJSON("../device-controller.php", getparam, process_device);
}

function process_device(data) {
	document.getElementById("hasilJSON").innerHTML = data['name'];
}

function add_device_JSON() {
	var getparam = {
		action: 'adddevice',
		data: {
			group_id: 4,
			device_type_id: 0,
			name: 'EMS D2 JAKARTA',
			description: 'letaknya di gambir',
			longitude: 106.82633566856381,
			latitude: -6.181883420023021,
			cacti_id: 27
		}
	}
	
	$.getJSON("../device-controller.php", getparam);
}

function get_cacti_device_JSON() {
	var getparam = {
		action: 'getcactidevice',
		data: {
			cacti_id: 27
		}
	}
	
	$.getJSON("../device-controller.php", getparam, cacti);
}

function cacti(data) {
	alert(data['hostname'] + " " + data['description']);
}

function get_cacti_device_all_JSON() {
	var getparam = {
		action: 'getcactidevicelist',
		data: {
			
		}
	}
	
	$.getJSON("../device-controller.php", getparam, cactiall);
}

function cactiall(data) {
	alert(data[1]['hostname']);
}