<?php
 /*
 * File   : map.js
 * Role   : Controller (MVC)
 * Author : Mohammad Rizky Adrian
 * E-Mail : moh.rizkya@yahoo.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 */
?>

var map= null;
var default_device = 0;
var groupMarkers = [];
var groupObjects = [];
var deviceMarkers = [];
var deviceObjects = [];
var infoMarkers = [];
var iconDevice = 'images/form-device.png';
var iconGroup = 'images/form-group.png';
var iconDeviceError = 'images/form-device-a.png';
var iconGroupError = 'images/form-group-a.png';
var indonesiaCenter = new google.maps.LatLng(-1, 118);
var minZoom = 5;
var maxZoom = 15;
var centeringZoom = minZoom + 2;
var additioncentering = 0;

function kptel_init() {
	var myOptions = {
		zoom: minZoom,
		center: indonesiaCenter,
		mapTypeControl: false,
		navigationControl: false,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
	dateTime();
	
	google.maps.event.addListener(map, 'zoom_changed', function() { 
		if (map.getZoom() < minZoom) { 
			map.setZoom(minZoom); 
		}
		if (map.getZoom() == minZoom) { 
			map.setCenter(indonesiaCenter);
		}
		$( "#slider" ).slider( "option", "value", map.getZoom());
    });
	
	google.maps.event.addListener(map, 'drag', function(event) {
		if(map.getZoom() == minZoom){
			map.setCenter(indonesiaCenter);
		}
    });

	isLoggedIn(function(data){
		if(data == 1){
			google.maps.event.addListener(map, 'rightclick', function(event) {
				if(infoMarkers.length > 0) {
					var lastinfo = infoMarkers.pop();
					lastinfo.close();
				}
				if($('#panel-rrd').dialog('isOpen'))	{$('#panel-rrd').dialog('close');}
				
				closeOtherCtxMenu($('#ctxmenu-map'));
				check_point(event.latLng);
				$('#ctxmenu-map').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$('#ctxmenu-map').dialog('open');
			});
		}
    });
	
	google.maps.event.addListener(map, 'click', function(event) {
		check_point(event.latLng);
		if(infoMarkers.length > 0) {
			var lastinfo = infoMarkers.pop();
			lastinfo.close();
		}
		if($('#panel-rrd').dialog('isOpen'))	{$('#panel-rrd').dialog('close');}
		
		closeOtherCtxMenu(null);	
		$('#coord-lng').val(current.longitude);
		$('#coord-lat').val(current.latitude);
    });
	
	//limit the map zoom
	google.maps.event.addListenerOnce(map, 'idle', function() {
		map.mapTypes[google.maps.MapTypeId.ROADMAP].minZoom = minZoom;
		map.mapTypes[google.maps.MapTypeId.ROADMAP].maxZoom = maxZoom;
    });
	
	updateMap();
	
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
	//Init menu-tree
	$("#trees").jstree({
		"plugins" : [ "themes", "crrm", "types", "ui", "html_data"],
		"types" : {
				"valid_children" : [ "device","group","device-error","group-error" ],
				"types" : {
					// The `group` type
					"group" : {
						"valid_children" : [ "device","group","device-error","group-error"],
						"icon" : {
							"image" : iconGroup
						}
					},
					// The `device` nodes 
					"device" : {
						"valid_children" : [ "none" ],
						"icon" : {
							"image" : iconDevice
						},
						open_node : false,
						close_node : false
					},
					// The `group-error` nodes 
					"group-error" : {
						"valid_children" : [  "device","group","device-error","group-error" ],
						"icon" : {
							"image" : iconGroupError
						}
					},
					// The `device-error` nodes 
					"device-error" : {
						"valid_children" : [ "none" ],
						"icon" : {
							"image" : iconDeviceError
						},
						open_node : false,
						close_node : false
					}
				}
			}
	});
	initTopUp();
}

//INITIALIZATION FUNCTION

$(function(){
	kptel_init();
});

function updateMap(){
	buildMapComponent();
	setTimeout("updateMap()",60000);
}

//Build Tree and Map Element
function buildMapComponent(){
	var groupnode;
	var devicenode;
	
	//Reset all component
	$('#trees').html('');
	
	if (deviceMarkers) {
		for (idx = 0; idx > deviceMarkers.length; idx++) {
		  deviceMarkers[idx].setMap(null);
		}
		deviceMarkers.length = 0;
	}
	
	if (groupMarkers) {
		for (idx = 0; idx > groupMarkers.length; idx++) {
		  groupMarkers[idx].setMap(null);
		}
		groupMarkers.length = 0;
	}
	
	if (deviceObjects) {deviceObjects.length = 0;}
	if (groupObjects) {groupObjects.length = 0;}
	
	//Refresh all nodes' menu-tree and map component
	getGroupList(function(data1) {
		groupnode = data1;
		getDeviceList(function(data2) {
			devicenode = data2;		
			//create root node
			$("#trees").jstree("create",-1,"first",{"attr":{"id":"group-0", "rel":"group"},"data":{"title":"root"}},false,true);
			if(data1 !== null){	
				tree_group_processing(groupnode,0);
				$.each(data1, function(index, datum){
					var newPos = new google.maps.LatLng(datum.latitude, datum.longitude);
					render_group(newPos, datum.name, datum.group_id);
					groupObjects.push(datum);
				});
			}
			if(data2 !== null){
				tree_device_processing(devicenode);
				$.each(data2, function(index, datum){
					var newPos = new google.maps.LatLng(datum.latitude, datum.longitude);
					render_device(newPos, datum.name, datum.cacti_id, datum.device_id);
					deviceObjects.push(datum);
				});
			}
	
			getStatusNotification(function(data3){
				$.each(data3, function(index,datum){
					var curdev = get_device_by_cacti_id_from_temp(datum.id);
					//alert(curdev.
					//update alert device icon in menu-tree column
					$('#device-'+curdev.device_id).attr('rel','device-error');
					if(curdev.group_id != 0) {changeParentTreeStatus(curdev.group_id);}
					
					//update alert device icon in google maps
					var updateIconIndex = get_index_deviceObjects(curdev.device_id);
					deviceMarkers[updateIconIndex].setOptions({icon:iconDeviceError});
					
				});
				//udpate notif column
				showWarningDevice(data3);
			});				
		});
	});
}

function tree_group_processing(data,x){
	var queueid = [];
	$.each(data, function(index,datum){
		if(datum.parent_id == x){
			var parentnode=null;
			var groupid = "group-"+datum.group_id;
			var cgroupid = "cgroup-"+datum.group_id;
			var info = {
					  "attr":{"id":groupid, "rel":"group"}
					 ,"data":{"title":datum.name}
			 };
			
			if(x == 0) parentnode = "#group-0";
			else parentnode = "#group-"+x;
			$("#trees").jstree("create",parentnode,"last",info,false,true);
			$('#'+groupid).find('a').attr("id",cgroupid);
			$('#'+cgroupid).click(function() {
				set_center_and_zoom(datum.latitude, datum.longitude);
			});
			queueid.push(datum.group_id);
		}
	});
	
	while(queueid.length >= 1){
		tree_group_processing(data, queueid.pop());
	}
}

function tree_device_processing(data){
	$.each(data, function(index,datum){
			var parentnode=null;
			var devid = "device-"+datum.device_id;
			var info = {
					  "attr":{"id":devid, "rel":"device"}
					 ,"data":{"title":datum.name}
			 };
			
			if(datum.group_id == 0) parentnode = "#group-0";
			else parentnode = "#group-"+datum.group_id;
			$("#trees").jstree("create",parentnode,"last",info,false,true);
			$('#'+devid).click(function() {
				set_center_and_zoom(datum.latitude, datum.longitude);
			});
	});
}

function changeParentTreeStatus(parentid){
	var curgroup = get_element_groupObjects(parentid);
	$('#group-'+curgroup.group_id).attr('rel','group-error');
	if(curgroup.parent_id != 0) {changeParentTreeStatus(curgroup.parent_id);}
}

function get_element_groupObjects(groupid){
	var retval;
	for(var i = 0; i < groupObjects.length; i++){
		if(groupObjects[i].group_id == groupid) retval = groupObjects[i];
	}
	return retval;
}

function get_element_deviceObjects(devid){
	var retval;
	for(var i = 0; i < deviceObjects.length; i++){
		if(deviceObjects[i].device_id == devid) retval = deviceObjects[i];
	}
	return retval;
}
//return id of array deviceObjects
function get_index_deviceObjects(devid){
	var retval;
	for(var i = 0; i < deviceObjects.length; i++){
		if(deviceObjects[i].device_id == devid) retval = i;
	}
	return retval;
}
//return id of array groupObjects
function get_index_groupObjects(groupid){
	var retval;
	for(var i = 0; i < groupObjects.length; i++){
		if(groupObjects[i].group_id == groupid) retval = i;
	}
	return retval;
}

//DEVICE MODEL-CONTROL

function render_device(location,devname,cacid,devid) {
    marker = new google.maps.Marker({
      position: location,
	  icon : iconDevice,
      map: map,
	  title : devname,
	  zIndex : 10
    });
    deviceMarkers.push(marker);
	

	google.maps.event.addListener(marker, 'rightclick', function(event) {
		if(infoMarkers.length > 0) {
			var lastinfo = infoMarkers.pop();
			lastinfo.close();
		}
		if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
		isLoggedIn(function(data){
			if(data == 1){
				current.cactiId = cacid;
				current.deviceId = devid;
				current.mouseX = tempX;
				current.mouseY = tempY;
				$("#ctxmenu-device").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				closeOtherCtxMenu(null);
				$('#ctxmenu-device').dialog('open');
			}
		});
	});
	
	var content='';
	var infowindow = new google.maps.InfoWindow({
		content: content
		,maxWidth: 800
	});
	
	google.maps.event.addListener(marker, 'click', function(e) {
		if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
		getCactiDevice(cacid, function(cactidata){
			var imgstat = '';
			var textstat = '';
			switch(cactidata.status)
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
							+'Hostname<br>Description<br>'
							+'Status<br>Last Failed<br>Last Recovered<br>Last Error<br>Availability<br>Ping Latency'
							+'</div><div id="devinfovalue">: '
							+cactidata.hostname + '<br>: '+ cactidata.description+ '<br>: '
							+textstat + '<br>: '+ cactidata.status_fail_date+ '<br>: '+  cactidata.status_rec_date+ '<br>: '
							+cactidata.status_last_error+ '<br>: '+  cactidata.availability+ ' %<br>: '+  cactidata.cur_time+' ms</div>'
							+'<div class="clearboth" id="showdetail"><a href="#" onclick="showPanelRRD()">Show Detail</a></div></div>'
						;
			infowindow.setContent(text);
		});
	
		if(infoMarkers.length > 0) {
			var lastinfo = infoMarkers.pop();
			lastinfo.close();
		}
		closeOtherCtxMenu(null);
		
		current.cactiId = cacid;
		additioncentering = 2 - ((map.getZoom()+6)/10);
		if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
		var selectedCenter = new google.maps.LatLng(this.getPosition().lat()+additioncentering,this.getPosition().lng());
		map.setCenter(selectedCenter);
		infowindow.open(map,this);
		infoMarkers.push(infowindow);
	});
}

function add_device(groupid,devtype,devname,devlng,devlat,cactiid,devdesc){
	var getparam = {
		action: 'device_add',
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
			if(data == 0) alert("Add Device failed");
			else {
				render_device(newLatLng,devname,cactiid);
				deviceObjects.push({
					device_id: data,
					group_id: groupid,
					device_type_id: devtype,
					name: devname,
					description: devdesc,
					longitude: devlng,
					latitude: devlat,
					cacti_id: cactiid
				});
				alert("Add Device success");
				var parentnode=null;
				var devid = "device-"+data;
				var info = {
						  "attr":{"id":devid, "rel":"device"}
						 ,"data":{"title":devname}
				 };
				if(groupid == 0) parentnode = "#group-0";
				else parentnode = "#group-"+groupid;
				$("#trees").jstree("create",parentnode,"last",info,false,true);
				$('#'+devid).click(function() {
					set_center_and_zoom(devlat,devlng);
				});
			}
		}
	);
}

function get_device_by_cacti_id_from_temp(cacid){
	var retval;
	for(var i = 0; i < deviceObjects.length; i++){
		if(deviceObjects[i].cacti_id == cacid) retval = deviceObjects[i];
	}
	return retval;
}

function update_device(devid, groupid, devtypeid, named, desc, longi, lati, cactiid) {
	var getparam = {
		action: 'device_update',
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
	$.getJSON(url_device, getparam, function(data) {
		if(data == 0) {alert("Edit Device failed");}
		else {
			alert("Edit Device success");
			//update tree
			if(groupid == 0) {$("#trees").jstree("move_node", "#device-" + devid, "#group-0");}
			else {$("#trees").jstree("move_node", "#device-" + devid, "#group-" + groupid);}						
			$('#device-'+devid+' a').html('<ins class="jstree-icon"></ins>' + named);
			



			var idxdev = get_index_deviceObjects(devid);
			closeOtherCtxMenu(null);
			

			//update array deviceObjects
			deviceObjects[idxdev].device_id = devid;
			deviceObjects[idxdev].group_id = groupid;
			deviceObjects[idxdev].device_type_id = devtypeid;
			deviceObjects[idxdev].name = named;
			deviceObjects[idxdev].description = desc;
			deviceObjects[idxdev].longitude = longi;
			deviceObjects[idxdev].latitude = lati;
			deviceObjects[idxdev].cacti_id = cactiid;
			
			//update map change
			var newlatlng = new google.maps.LatLng(lati,longi);
			deviceMarkers[idxdev].setOptions({position:newlatlng,title:named});
		}
	});
}

function delete_device(id, callback) {
	var getparam = {
		action: 'device_delete',
		data: {
			device_id: id
		}
	}
	
	$.getJSON(url_device, getparam, callback);
	var idxdev = get_index_deviceObjects(id);
	//update tree change
	$("#trees").jstree("remove","#device-"+id);
	closeOtherCtxMenu(null);
	
	//update map change
	deviceMarkers[idxdev].setMap(null);
	deviceObjects[idxdev].device_id = -999;
}

//GROUP MODEL-CONTROL

function render_group(location,groupname,groupid){
	marker = new google.maps.Marker({
      position: location,
	  icon : iconGroup,
      map: map,
	  title : groupname
    });
    groupMarkers.push(marker);

	google.maps.event.addListener(marker, 'rightclick', function(event) {
		if(infoMarkers.length > 0) {
			var lastinfo = infoMarkers.pop();
			lastinfo.close();
		}
		isLoggedIn(function(data){
			if(data == 1){
				current.mouseX = tempX
				current.mouseY = tempY;
				current.groupId = groupid;
				$("#ctxmenu-group").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				closeOtherCtxMenu(null);
				$('#ctxmenu-group').dialog('open');
			}
		});
	});
	var content = '<img src="images/icon-group.png" style="float:left;"/>This is group '+groupname;
	var infowindow = new google.maps.InfoWindow({
		content: content,
		maxWidth: 200,
		maxHeight: 100
	});
	google.maps.event.addListener(marker, 'click', function(e) {
		if(infoMarkers.length > 0) {
			var lastinfo = infoMarkers.pop();
			lastinfo.close();
		}
		if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
		
		var selectedCenter = new google.maps.LatLng(this.getPosition().lat(),this.getPosition().lng());
		if(map.getZoom() > minZoom) map.setCenter(selectedCenter);
		closeOtherCtxMenu(null);
		infowindow.open(map,this);
		infoMarkers.push(infowindow);
	});
}

function add_group(parentid, grpname, grplng, grplat, grpdesc) {
	var getparam = {
		action: 'group_add',
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
			if(data == 0) alert("Add Group failed");
			else {
				render_group(newLatLng,grpname,data);
				groupObjects.push({
					group_id: data,
					parent_id: parentid,
					name: grpname,
					description: grpdesc,
					longitude: grplng,
					latitude: grplat
				});
				alert("Add Group success");
				var parentnode=null;
				var groupid = "group-"+data;
				var cgroupid = "cgroup-"+data; //id for clicked
				var info = {
						  "attr":{"id":groupid, "rel":"group"}
						 ,"data":{"title":grpname}
				 };
				if(parentid == 0) parentnode = "#group-0";
				else parentnode = "#group-"+parentid;
				$("#trees").jstree("create",parentnode,"last",info,false,true);
				$('#'+groupid).find('a').attr("id",cgroupid);
				$('#'+cgroupid).click(function() {
					set_center_and_zoom(grplat,grplng);
				});
			}
		}
	);
}

function update_group(groupid, parentid, named, desc, longi, lati) {
	var getparam = {
		action: 'group_update',
		data: {
			group_id: groupid,
			parent_id: parentid,
			name: named,
			description: desc,
			longitude: longi,
			latitude: lati
		}
	}

	$.getJSON(url_group, getparam, function(data) {

		if(data == 0) {alert("Edit Group failed");}
		else {
			alert("Edit Group success");

			//update tree
			if(parentid == 0) {$("#trees").jstree("move_node","#group-"+groupid,"#group-0");}
			else {$("#trees").jstree("move_node","#group-"+groupid,"#group-"+parentid);}

			$('#cgroup-'+groupid).html('<ins class="jstree-icon"></ins>'+named);
			
			var idxgroup = get_index_groupObjects(groupid);
			closeOtherCtxMenu(null);
			
			//update array deviceObjects
			groupObjects[idxgroup].group_id = groupid;
			groupObjects[idxgroup].parent_id = parentid;
			groupObjects[idxgroup].name = named;
			groupObjects[idxgroup].description = desc;
			groupObjects[idxgroup].longitude = longi;
			groupObjects[idxgroup].latitude = lati;
			
			//update map change
			var newlatlng = new google.maps.LatLng(lati,longi);
			groupMarkers[idxgroup].setOptions({position:newlatlng,title:named});
		}
	});
}

//CONTROL AUTO SETCENTERZOOM
function set_center_and_zoom(lat,lng){	
	var selectedCenter = new google.maps.LatLng(lat, lng);
	map.setCenter(selectedCenter);
	map.setZoom(centeringZoom);
}

//CONTROL CONTEXT MENU
function check_point(position){
	current.mouseX = tempX;
	current.mouseY = tempY;
	current.longitude = position.lng();
	current.latitude = position.lat();
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

function showCactiDevice(id){
	var curdev = get_device_by_cacti_id_from_temp(id);
	set_center_and_zoom(curdev['latitude'],curdev['longitude']);
}
