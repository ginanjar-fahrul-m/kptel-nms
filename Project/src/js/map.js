var map= null;
var mapmode = 0;
/*
	Mode 0 : mode peta biasa
	Mode 1 : mode ambil koordinat
*/
var placeMarkers = [];
var flagMarkers = [];
var iconDevice = 'images/form-device.png';
var iconGroup = 'images/form-group.png';
var indonesiaCenter = new google.maps.LatLng(-1, 118);
var indonesiaBound;
var minZoom = 5;
var maxZoom = 15;
var url_device = "device-controller.php";
var url_group = "group-controller.php";
var tempX = 0;
var tempY = 0;
var currentMouseX;
var currentMouseY;
var currentLng;
var currentLat;

$(function(){
	kptel_init();
});

function kptel_init() {
	var myOptions = {
		zoom: minZoom,
		center: indonesiaCenter,
		mapTypeControl: false,
		navigationControl: false,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	dateTime();
	
	//var indonesiaBound = map.getBounds();
	//alert(map.getBounds().getSouthWest()+ " , ne: "+map.getBounds().getNorthEast());
	//indonesiaBound = new google.maps.LatLngBounds(getSouthWest(),getNorthEast());
	google.maps.event.addListener(map, 'zoom_changed', function() { 
		if (map.getZoom() < minZoom) { 
			map.setZoom(minZoom); 
		};
		if (map.getZoom() == minZoom) { 
			map.setCenter(indonesiaCenter);
		};
		$( "#slider" ).slider( "option", "value", map.getZoom());
    });
	
	google.maps.event.addListener(map, 'drag', function(event) {
		if(map.getZoom() == minZoom){
			map.setCenter(indonesiaCenter);
		}
    });

	google.maps.event.addListener(map, 'rightclick', function(event) {	
	  if($('#contextmenu').dialog("isOpen")) $('#contextmenu').dialog('close');
      check_point(event.latLng);

    });
	
	google.maps.event.addListener(map, 'click', function(event) {
      $('#contextmenu').dialog('close');
    });
	
	//set map limited only for zoom 5 until 15
	google.maps.event.addListenerOnce(map, 'idle', function() {
		map.mapTypes[google.maps.MapTypeId.ROADMAP].minZoom = minZoom;
		map.mapTypes[google.maps.MapTypeId.ROADMAP].maxZoom = maxZoom;
    });
	
	init_device();
	init_group();
	
	//jQuery Addition
	$(function() {
	//Add Zoom Slider
		$("#slider").slider({
			orientation: "vertical",
			value:minZoom,
			min: minZoom,
			max: maxZoom,
			step: 1,
			slide: function(event, ui) {
				$("#amount").val('$' + ui.value);
				map.setZoom(ui.value);
			}
		});
		$("#amount").val('$' + $("#slider").slider("value"));
		
		//Add Zoom Button
		$(".demo button:first").button({
            icons: {
                primary: 'ui-icon-plushthick'
            },
            text: false
        }).next().button({
            icons: {
                primary: 'ui-icon-minusthick'
            },
            text: false
        });
	});	
}

//INITIALIZATION FUNCTION
function init_device(){
	var getparam = {
		action: 'getdevicelist',
		data: {}
	}
	$.getJSON(url_device, getparam, render_init_device);
}

function render_init_device(data){
	$.each(data, function(index,datum){
		var newPos = new google.maps.LatLng(datum['latitude'], datum['longitude']);
		render_device(newPos,datum['name']);
	});
}

function init_group(){
	var getparam = {
		action: 'getgrouplist',
		data: {}
	}
	$.getJSON(url_group, getparam, render_init_group);
}

function render_init_group(data){
	$.each(data, function(index,datum){
		var newPos = new google.maps.LatLng(datum['latitude'], datum['longitude']);
		render_group(newPos,datum['name']);
	});
}
//DEVICE MODEL-CONTROL
function render_device(location,devname) {
    marker = new google.maps.Marker({
      position: location,
	  icon : iconDevice,
      map: map,
	  title : devname,
	  zIndex : 10
    });
    placeMarkers.push(marker);
	
	google.maps.event.addListener(marker, 'rightclick', function(event) {
      alert("Device name :" + devname);
    });
}

function add_device(groupid,devtype,devname,devlng,devlat,cactiid,devdesc){
	var getparam = {
		action: 'adddevice',
		data: {
			group_id: 1,
			device_type_id: 0,
			name: devname,
			description: devdesc,
			longitude: devlng,
			latitude: devlat,
			cacti_id: 2
		}
	}
	var newLatLng = new google.maps.LatLng(devlat,devlng);
	$.getJSON(url_device, getparam, function(data) {
			if(data == 1) {
				render_device(newLatLng,devname);
				alert("Add Device success");
			}
			else alert("Add Device failed");
		}
	);
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

//GROUP MODEL-CONTROL
function render_group(location,groupname){
	marker = new google.maps.Marker({
      position: location,
	  icon : iconGroup,
      map: map,
	  title : groupname
    });
    placeMarkers.push(marker);
	
	google.maps.event.addListener(marker, 'rightclick', function(event) {
      alert("Group name :" + groupname);
    });
}

function add_group(parentid,grpname,grplng,grplat,grpdesc) {
	var getparam = {
		action: 'addgroup',
		data: {
			parent_id: parentid,
			name: grpname,
			description: grpdesc,
			longitude: grplng,
			latitude: grplat
		}
	}
	
	var newLatLng = new google.maps.LatLng(grplat,grplng);
	$.getJSON(url_group, getparam, function(data) {
			if(data == 1) {
				render_group(newLatLng,grpname);
				alert("Add Group success");
			}
			else alert("Add Group failed");
		}
	);
}

function get_group() {
	alert("get group id " + document.getElementById("group_id").value);
	
	var getparam = {
		action: 'getgroup',
		data: {
			group_id: 1
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

function update_group() {
	var getparam = {
		action: 'updategroup',
		data: {
			group_id: 3,
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

//CONTROL CONTEXT MENU
function check_point(position){
	//alert("lat : " + position.lat() + ", lng : " + position.lng());
	currentMouseX = tempX;
	currentMouseY = tempY;
	currentLng = position.lng();
	currentLat = position.lat();
	$("#contextmenu").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove()
	$('#contextmenu').dialog('open');
}

//CONTROL UNTUK BUTTOM MAP ZOOM SLIDER
function zoom_in_btn(){
	if(map.getZoom() < maxZoom) {
		var val = map.getZoom()+1;
		map.setZoom(val);
		$( "#slider" ).slider( "option", "value", val);
	}
}
function zoom_out_btn(){
	if(map.getZoom() > minZoom) {
		var val = map.getZoom()-1;
		map.setZoom(val);
		$( "#slider" ).slider( "option", "value", val);
	}
}

//FUNGSI MENAMPILKAN DATETIME MENUBAR
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

// Detect if the browser is IE or not.
// If it is not IE, we assume that the browser is NS.
var IE = document.all?true:false
// If NS -- that is, !IE -- then set up for mouse capture
if (!IE) document.captureEvents(Event.MOUSEMOVE)
// Set-up to use getMouseXY function onMouseMove
document.onmousedown = getMouseXY;
function getMouseXY(e) {
  if (IE) { // grab the x-y pos.s if browser is IE
    tempX = event.clientX + document.body.scrollLeft
    tempY = event.clientY + document.body.scrollTop
  } else {  // grab the x-y pos.s if browser is NS
    tempX = e.pageX
    tempY = e.pageY
  }  
  // catch possible negative values in NS4
  if (tempX < 0){tempX = 0}
  if (tempY < 0){tempY = 0}  
  // show the position values in the form named Show
  // in the text fields named MouseX and MouseY
  return true
}