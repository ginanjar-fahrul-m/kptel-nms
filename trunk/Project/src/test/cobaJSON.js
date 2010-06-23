function get_device_list_JSON() {
	var getparam = {
		action: 'getdevicelist',
		data: {
			
		}
	}
	
	$.getJSON("../device-controller.php", getparam, process_device_list);
}

function process_device_list(data) {
	document.getElementById("hasilJSON").innerHTML = data[1]['device_id'];
}