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