var map= null;
var mapmode = 0;
var DSLAM_DEVICE = 0;
/*
	Mode 0 : mode peta biasa
	Mode 1 : mode ambil koordinat
*/
var placeMarkers = [];
var flagMarkers = [];
var iconDevice = 'images/form-device.png';
var iconGroup = 'images/form-group.png';
var indonesiaCenter = new google.maps.LatLng(-1, 118);
var minZoom = 5;
var maxZoom = 15;
var centeringZoom = minZoom + 2;
var url_device = "device-controller.php";
var url_group = "group-controller.php";
var url_notif = "notification-controller.php";
var tempX = 0;
var tempY = 0;
var currentMouseX;
var currentMouseY;
var currentLng;
var currentLat;
var currentCacti;

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
	  $('#objectmenu').dialog('close');
    });
	
	//limit the map zoom
	google.maps.event.addListenerOnce(map, 'idle', function() {
		map.mapTypes[google.maps.MapTypeId.ROADMAP].minZoom = minZoom;
		map.mapTypes[google.maps.MapTypeId.ROADMAP].maxZoom = maxZoom;
    });
	
	get_device_list(render_init_device);
	get_group_list(render_init_group);
	
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
				map.setZoom(ui.value);
			}
		});
		
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
	//Init tree
	$("#trees").jstree({
		"plugins" : [ "themes", "ui", "crrm", "types", "html_data"],
		"types" : {
				"valid_children" : [ "group", "device" ],
				"types" : {
					// The `group` type
					"group" : {
						"valid_children" : [ "device","group"],
						"icon" : {
							"image" : "images/form-group.png"
						}
					},
					// The `device` nodes 
					"device" : {
						"valid_children" : [ "none" ],
						"icon" : {
							"image" : "images/form-device.png"
						},
						open_node : false,
						close_node : false
						/*,
						"start_drag" : false,
						"move_node" : false,
						"delete_node" : false,
						"remove" : false*/
					}
				}
			}
	});
	//create tree
	build_tree();
}

//INITIALIZATION FUNCTION
function render_init_device(data){
	$.each(data, function(index,datum){
		var newPos = new google.maps.LatLng(datum['latitude'], datum['longitude']);
		render_device(newPos,datum['name'],datum['cacti_id']);
	});
}

function render_init_group(data){
	$.each(data, function(index,datum){
		var newPos = new google.maps.LatLng(datum['latitude'], datum['longitude']);
		render_group(newPos,datum['name']);
	});
}

function build_tree(){
	var groupnode;
	var devicenode;
	var getparam = {
		action: 'getgrouplist',
		data1: {}
	}
	
	$.getJSON(url_group, getparam, function(data1) {
		groupnode = data1;
		var getparam = {
			action: 'getdevicelist',
			data2: {}
		}
		$.getJSON(url_device, getparam, function(data2) {
			devicenode = data2;			
			tree_group_processing(groupnode,0);
			tree_device_processing(devicenode);
		});
	});
}

function tree_group_processing(data,x){
	var queueid = [];
	$.each(data, function(index,datum){
		if(datum['parent_id'] == x){
			var parentnode=null;
			var groupid = "group-"+datum['group_id'];
			var info = {
					  "attr":{"id":groupid, "rel":"group"}//, "param":3}
					 ,"data":{"title":datum['name']}
			 };
			
			if(x == 0) parentnode = -1;
			else parentnode = "#group-"+x;
			$("#trees").jstree("create",parentnode,false,info,false,true);
			$('#'+groupid).click(function() {
				set_center_and_zoom(datum['latitude']+0.5,datum['longitude']);
				//alert("group click :" + datum['latitude'] + ' , ' + datum['longitude']);
			});
			queueid.push(datum['group_id']);
		}
	});
	
	while(queueid.length >= 1){
		tree_group_processing(data, queueid.pop());
	}
}

function tree_device_processing(data){
	$.each(data, function(index,datum){
			var parentnode=null;
			var devid = "device-"+datum['device_id'];
			var info = {
					  "attr":{"id":devid, "rel":"device"}//, "param":3}
					 ,"data":{"title":datum['name']}
			 };
			
			if(datum['group_id'] == 0) parentnode = -1;
			else parentnode = "#group-"+datum['group_id'];
			$("#trees").jstree("create",parentnode,"last",info,false,true);
			$('#'+devid).click(function() {
				set_center_and_zoom(datum['latitude'],datum['longitude']);
				//alert("device click :" + datum['latitude'] + ' , ' + datum['longitude']);
			});
	});
}

//DEVICE MODEL-CONTROL
function render_device(location,devname,cacid) {
    marker = new google.maps.Marker({
      position: location,
	  icon : iconDevice,
      map: map,
	  title : devname,
	  zIndex : 10
    });
    placeMarkers.push(marker);
	
	google.maps.event.addListener(marker, 'rightclick', function(event) {
		//alert("Device id :" + devid);
		currentCacti = cacid;
		currentMouseX = tempX;
		currentMouseY = tempY;
		$("#objectmenu").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
		$('#objectmenu').dialog('open');
		$('#contextmenu').dialog('close');
    });
	
	
	var getparam = {
		action: 'getcactidevice',
		data: {cacti_id: cacid}
	}
	var content='';
	var infowindow = new google.maps.InfoWindow({
		content: content
		,maxWidth: 500
	});
	$.getJSON(url_device, getparam, function(cactidata){
		var imgstat = '';
		var textstat = '';
		switch(cactidata['status'])
		{
			case '0':
			  imgstat = 'images/menu-help.png';
			  textstat = 'unknown';
			  break;
			case '1':
			  imgstat = 'images/flag-alert.png';
			  textstat = 'down';
			  break;
			case '2':
			  imgstat = 'images/flag-recover.png';
			  textstat = 'recover';
			  break;
			case '3':
			  imgstat = 'images/flag-ok.png';
			  textstat = 'up';
			  break;
			case '4':
			  imgstat = 'images/flag-warning.png';
			  textstat = 'threshold';
			  break;
			default:
			  imgstat = 'images/menu-help.png';
			  textstat = 'unknown 2';
		}
		
		var text = '<div id="devinfowindow">'
						+'<div id="imginfowindow">'
						+'<img id="imglogo" src="images/icon-device2.png" />'
						+'<img id="imgstat" src="'+imgstat+'" /></div>'
						+'<h1>'+devname+'</h1><div class="clearboth"></div><div id="devinfolabel">'
						+'Status<br>Last Failed<br>Last Recovered<br>Last Error<br>Availability<br>Ping Latency'
						+'</div><div id="devinfovalue">: '
						+textstat + '<br>: '+ cactidata['status_fail_date']+ '<br>: '+  cactidata['status_rec_date']+ '<br>: '
						+cactidata['status_last_error']+ '<br>: '+  cactidata['availability']+ ' %<br>: '+  cactidata['cur_time']+' ms</div>'
						+'<div class="clearboth"></div></div>'
					;
		infowindow.setContent(text);
	});
	google.maps.event.addListener(marker, 'click', function(e) {
		var selectedCenter = new google.maps.LatLng(this.getPosition().lat()+0.5,this.getPosition().lng());
		map.setCenter(selectedCenter);
		if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
		infowindow.open(map,this);
	});
}

function add_device(groupid,devtype,devname,devlng,devlat,cactiid,devdesc){
	var getparam = {
		action: 'adddevice',
		data: {
			group_id: groupid,
			device_type_id: devtype,
			name: devname,
			description: devdesc,
			longitude: devlng,
			latitude: devlat,
			cacti_id: cactiid
		}
	}
	var newLatLng = new google.maps.LatLng(devlat,devlng);
	$.getJSON(url_device, getparam, function(data) {
			if(data == 1) {
				render_device(newLatLng,devname,cactiid);
				alert("Add Device success");
			}
			else alert("Add Device failed");
		}
	);
}

function get_device(id,callback) {	
	var getparam = {
		action: 'getdevice',
		data: {
			device_id: id
		}
	}
	$.getJSON(url_device, getparam, callback);
}

function get_device_list(callback) {
	var getparam = {
		action: 'getdevicelist',
		data: {	}
	}
	$.getJSON(url_device, getparam, callback);
}

function get_cacti_device(id_cacti,callback) {	
	var getparam = {
		action: 'getcactidevice',
		data: {
			cacti_id: id_cacti
		}
	}
	$.getJSON(url_device, getparam, callback);
}

function get_monitoring_graph(id_cacti, callback) {
	var getparam = {
		action: 'getcactimonitoringgraph',
		data: {
			cacti_id: id_cacti
		}
	}
	$.get(url_device, getparam, callback);
}

function get_status_notification(callback) {
	var getparam = {
		action: 'getstatusnotification',
		data: {
		
		}
	}
	
	$.getJSON(url_notif, getparam, callback);
}

function get_cacti_device_list(callback) {
	var getparam = {
		action: 'getcactidevicelist',
		data: {
			
		}
	}
	
	$.getJSON(url_device, getparam, callback);
}

function get_cacti_unlisted_device_list(callback) {
	var getparam = {
		action: 'getcactiunlisteddevicelist',
		data: {
			
		}
	}
	
	$.getJSON(url_device, getparam, callback);
}

function update_device(callback, devid, groupid, devtypeid, named, desc, longi, lati, cactiid) {
	var getparam = {
		action: 'updatedevice',
		data: {
			device_id: devid,
			group_id: groupid,
			device_type_id: devtypeid,
			name: named,
			description: desc,
			longitude: longi,
			latitude: lati,
			cacti_id: cactiid
		}
	}
	$.getJSON(url_device, getparam, callback);
}

function delete_device(id, callback) {
	var getparam = {
		action: 'deletedevice',
		data: {
			device_id: id
		}
	}
	
	$.getJSON(url_device, getparam, callback);
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
	
	var content = '<img src="images/icon-group.png" style="float:left;"/>This is group '+groupname;
	var infowindow = new google.maps.InfoWindow({
		content: content,
		maxWidth: 200,
		maxHeight: 100
	});
	google.maps.event.addListener(marker, 'click', function(e) {
		infowindow.open(map,this);
	});
}

function add_group(parentid, grpname, grplng, grplat, grpdesc) {
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

function get_group(id, callback) {
	var getparam = {
		action: 'getgroup',
		data: {
			group_id: id
		}
	}	
	$.getJSON(url_group, getparam, callback);
}

function get_group_list(callback) {
	var getparam = {
		action: 'getgrouplist',

		data: {}
	}
	$.getJSON(url_group, getparam, callback);
}

function update_group(callback, groupid, parentid, named, desc, longi, lati) {
	var getparam = {
		action: 'updategroup',
		data: {
			group_id: groupid,
			parent_id: parentid,
			name: named,
			description: desc,
			longitude: longi,
			latitude: lati
		}
	}
	
	$.getJSON(url_group, getparam, callback);
}

function delete_group(id, callback) {
	var getparam = {
		action: 'deletegroup',
		data: {
			group_id: id
		}
	}	
	$.getJSON(url_group, getparam, callback);
}

//CONTROL AUTO SETCENTERZOOM
function set_center_and_zoom(lat,lng){	
	var selectedCenter = new google.maps.LatLng(lat, lng);
	map.setCenter(selectedCenter);
	map.setZoom(centeringZoom);
}

//CONTROL CONTEXT MENU
function check_point(position){
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

function vardump(variable, maxDeep)
{
    var deep = 0;
    var maxDeep = maxDeep || 0;

    function fetch(object, parent)
    {
        var buffer = '';
        deep++;

        for (var i in object) {
            if (parent) {
                objectPath = parent + '.' + i;
            } else {
                objectPath = i;
            }

            buffer += objectPath + ' (' + typeof object[i] + ')';

            if (typeof object[i] == 'object') {
                buffer += "\n";
                if (deep < maxDeep) {
                    buffer += fetch(object[i], objectPath);
                }
            } else if (typeof object[i] == 'function') {
                buffer += "\n";
            } else if (typeof object[i] == 'string') {
                buffer += ': "' + object[i] + "\"\n";
            } else {
                buffer += ': ' + object[i] + "\n";
            }
        }

        deep--;
        return buffer;
    }

    if (typeof variable == 'object') {
        return fetch(variable);
    }

    return '(' + typeof variable + '): ' + variable + "\n";
}

function alert_device(data) {
	alert(vardump(data, 5));
}
function showWarningDevice(){
	$('#notification').html('');
	get_status_notification(function(data){
		var li;
		for(var i = 0; i < data.length; i++){
			li = "<div class='notif-box'><div class='notif-img'><img alt='menu-warning' src='images/";
			switch(data[i]['status']){
				case '1': {
					li += "flag-alert.png'";
					break;
				}
				case '2': {
					li += "flag-recover.png'";
					break;
				}
				case '4': {
					li += "flag-warning.png'";
					break;
				}
			}
			li += " /></div><div class='notif-cont'><h3 align='left'>" + data[i]['description'] + "</h3>&nbsp;&nbsp;";
			li += data[i]['status_fail_date'] + "</div><div class='notif-clear'></div></div>";
			$('#notification').append(li);
		}
		if(data.length == 0){
			li = "<div class='notif-box'><div class='notif-img'><img alt='menu-warning' src='images/";
			li += "flag-ok.png'";
			li += " /></div><div class='notif-cont'><h3 align='left'>" + "all device ok!" + "</h3>";
			li += "&nbsp;&nbsp;---" + "</div><div class='notif-clear'></div></div>";
			$('#notification').append(li);
		}
		showAlert(true,data.length);
	});
	setTimeout("showWarningDevice()",5000);
}

function showAlert(bool,n){
	if(n > 0){
		$('#warning').attr("src",'images/alert.gif');
		$('#notif-label').html(" Notifications (" + n + ") ");
	}
	else
	{
		$('#warning').attr("src",'images/flag-ok.png');
		$('#notif-label').html(" Notifications ");
	}
}