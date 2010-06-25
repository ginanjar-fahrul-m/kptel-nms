var url = "../notification-controller.php";

function alert_group(data) {
	alert(vardump(data, 5));
}

function get_status_notification() {
	var getparam = {
		action: 'getstatusnotification',
		data: {
		
		}
	}
	
	$.getJSON(url, getparam, alert_group);
}