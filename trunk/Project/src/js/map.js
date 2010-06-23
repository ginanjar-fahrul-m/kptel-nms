var map;
var mapmode = 0;
/*
	Mode 0 : mode peta biasa
	Mode 1 : mode ambil koordinat
*/
var placeMarkers = [];
var flagMarkers = [];
var iconDevice = 'images/form-device.png';
var iconGroup = 'images/form-group.png';

$(function(){
		// initialize map (create markers, infowindows and list)
		kptel_init();
		// "live" bind click event
		/*$("#markers a").live("click", function(){
			var i = $(this).attr("rel");
			// this next line closes all open infowindows before opening the selected one
			//for(x=0; x < arrInfoWindows.length; x++){ arrInfoWindows[x].close(); }
			arrInfoWindows[i].open(map, arrMarkers[i]);
		});*/
	});

function kptel_init() {
	var latlng = new google.maps.LatLng(-1, 118);
	var myOptions = {
		zoom: 5,
		center: latlng,
		mapTypeControl: false,
		navigationControl: false,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	dateTime();
	
	google.maps.event.addListener(map, 'zoom_changed', function() { 
		if (map.getZoom() < 5) { 
			map.setZoom(5); 
		};
    });
	
	google.maps.event.addListener(map, 'rightclick', function(event) {
      check_point(event.latLng);
    });
	
	/*
	//ADD DEVICE LOGO
	google.maps.event.addListener(map, 'click', function(event) {
      addDevice(event.latLng);
    });
	//ADD GROUP LOGO
	google.maps.event.addListener(map, 'rightclick', function(event) {
      addGroup(event.latLng);
    });*/
	
	init_device();
	//init_group();
}

function init_device(){
	var getparam = {
		action: 'getdevicelist',
		data: {}
	}
	$.getJSON("device-controller.php", getparam, render_init_device);
}

function render_init_device(data){
	$.each(data, function(index,datum){
		var newPos = new google.maps.LatLng(datum['latitude'], datum['longitude']);
		addDevice(newPos,datum['name']);
	});
}

function init_group(){
	/*var getparam = {
		action: 'getgrouplist',
		data: {}
	}
	$.getJSON("group-controller.php", getparam, render_init_group);*/
}

/*function render_init_device(data){
	$.each(data, function(index,datum){
		//alert(datum['latitude']+" "+datum['longitude']);
		var newPos = new google.maps.LatLng(datum['latitude'], datum['longitude']);
		addDevice(newPos);
	});
}*/

function addDevice(location,devname) {
    marker = new google.maps.Marker({
      position: location,
	  icon : iconDevice,
      map: map,
	  title : devname
    });
    placeMarkers.push(marker);
}

function addGroup(location,groupname){
marker = new google.maps.Marker({
      position: location,
	  icon : iconGroup,
      map: map,
	  title : groupname
    });
    placeMarkers.push(marker);
}

function check_point(position){
	alert("lat : " + position.lat() + ", lng : " + position.lng());
}

function dateTime() {
   var now      = new Date();
   var day      = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
   var d        = now.getDay();
   var date     = (now.getDate() < 10) ? "0" + now.getDate() : now.getDate();
   var month    = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
   var m        = now.getMonth();
   var year     = now.getFullYear();
   var hh       = (now.getHours() < 10) ? "0" + now.getHours() : now.getHours(); 
   var mm       = (now.getMinutes() < 10) ? "0" + now.getMinutes() : now.getMinutes(); 
   var ss       = (now.getSeconds() < 10) ? "0" + now.getSeconds() : now.getSeconds(); 
   var content = day[d] + ", " + month[m] + " " + date + ", " + year + " " + hh + ":" + mm + ":" + ss;
   document.getElementById("time").innerHTML = content;
   setTimeout("dateTime()",1000);
}
