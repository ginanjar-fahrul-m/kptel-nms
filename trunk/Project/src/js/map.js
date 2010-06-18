function kptel_init() {
	var latlng = new google.maps.LatLng(-1, 118);
	
	var myOptions = {
		zoom: 5,
		center: latlng,
		
		mapTypeControl: false,
		
		navigationControl: false,
		
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	
	var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
}