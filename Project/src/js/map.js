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
var indonesiaCenter = new google.maps.LatLng(-1, 118);
var indonesiaBound;

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
		zoom: 5,
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
		if (map.getZoom() < 5) { 
			map.setZoom(5); 
		};
		if (map.getZoom() == 5) { 
			map.setCenter(indonesiaCenter);
		};
		$( "#slider" ).slider( "option", "value", map.getZoom());
    });
google.maps.event.addListener(map, 'drag', function(event) {
		if(map.getZoom() == 5){
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
		map.mapTypes[google.maps.MapTypeId.ROADMAP].minZoom = 5;
		map.mapTypes[google.maps.MapTypeId.ROADMAP].maxZoom = 15;
    });
	
	init_device();
	init_group();
	
	//jQuery Addition
	$(function() {
	//Add Zoom Slider
		$("#slider").slider({
			orientation: "vertical",
			value:5,
			min: 5,
			max: 15,
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
		addDevice(newPos,datum['name']);
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
		addGroup(newPos,datum['name']);
	});
}

function addDevice(location,devname) {
    marker = new google.maps.Marker({
      position: location,
	  icon : iconDevice,
      map: map,
	  title : devname,
	  zIndex : 10
    });
    placeMarkers.push(marker);
}

function x(){

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
	//alert("lat : " + position.lat() + ", lng : " + position.lng());
	currentMouseX = tempX;
	currentMouseY = tempY;
	currentLng = position.lng();
	currentLat = position.lat();
	$("#contextmenu").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove()
	$('#contextmenu').dialog('open');
}

function zoom_in_btn(){
	if(map.getZoom() < 15) {
		var val = map.getZoom()+1;
		map.setZoom(val);
		$( "#slider" ).slider( "option", "value", val);
	}
}
function zoom_out_btn(){
	if(map.getZoom() > 5) {
		var val = map.getZoom()-1;
		map.setZoom(val);
		$( "#slider" ).slider( "option", "value", val);
	}
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