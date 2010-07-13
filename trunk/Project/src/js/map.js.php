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
var infoElement;
var default_device = 0;
var groupMarkers = [];
var groupObjects = [];
var deviceMarkers = [];
var deviceObjects = [];
var iconDevice = 'images/form-device.png';
var iconGroup = 'images/form-group.png';
var iconDeviceError = 'images/form-device-a.png';
var iconGroupError = 'images/form-group-a.png';
var iconDeviceInfo = 'images/icon-device2.png';
var iconGroupInfo = 'images/icon-group2.png';
var iconStatusUnknown = 'images/menu-help.png';
var iconStatusDown = 'images/flag-alert.png';
var iconStatusRecover = 'images/flag-recover.png';
var iconStatusUp = 'images/flag-ok.png';
var iconStatusThreshold = 'images/flag-warning.png';
var iconStatusDefault = 'images/menu-help.png';
var indonesiaCenter = new google.maps.LatLng(-1, 118);
var indonesiaBounds;
var minZoom = 5;
var maxZoom = 15;
var centeringZoom = minZoom + 2;
var additionCentering = 0;

function setSizes() {
   var menuHeight = 44;
   var viewportHeight = $(window).height();
   var mapHeight = viewportHeight - menuHeight;
   $("#map-canvas").height(mapHeight);
}

function kptelInit() {
	setSizes();
	var myOptions = {
		zoom: minZoom,
		center: indonesiaCenter,
		disableDefaultUI: true
	};
	map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
	map.setOptions({
		mapTypeControl: true,
		scaleControl: true,
		navigationControl: true,
		mapTypeId: google.maps.MapTypeId.SATELLITE,
		navigationControlOptions: {style: google.maps.NavigationControlStyle.ZOOM_PAN},
		mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU}
	});
	
	infoElement =  new google.maps.InfoWindow();
	indonesiaBounds = map.getBounds();
	dateTime();
	
	//limit the map zoom
	google.maps.event.addListenerOnce(map, 'idle', function() {
		map.mapTypes[google.maps.MapTypeId.ROADMAP].minZoom = minZoom;
		map.mapTypes[google.maps.MapTypeId.ROADMAP].maxZoom = maxZoom;
		map.mapTypes[google.maps.MapTypeId.HYBRID].minZoom = minZoom;
		map.mapTypes[google.maps.MapTypeId.HYBRID].maxZoom = maxZoom;
		map.mapTypes[google.maps.MapTypeId.TERRAIN].minZoom = minZoom;
		map.mapTypes[google.maps.MapTypeId.TERRAIN].maxZoom = maxZoom;
		map.mapTypes[google.maps.MapTypeId.SATELLITE].minZoom = minZoom;
		map.mapTypes[google.maps.MapTypeId.SATELLITE].maxZoom = maxZoom;
    });
	
	google.maps.event.addListener(map, 'zoom_changed', function() { 
		if (map.getZoom() < minZoom) { 
			map.setZoom(minZoom);
		}
		if (map.getZoom() == minZoom) { 
			map.setCenter(indonesiaCenter);
			infoElement.close();
		}
    });
	
	// google.maps.event.addListener(map, 'drag', function(event) {
		// current.tempBounds = map.getBounds();
    // });	
	
	google.maps.event.addListener(map, 'bounds_changed', function(event) {
		if(map.getZoom() == minZoom){
			map.setCenter(indonesiaCenter);
		}
		// else{
			// if(indonesiaBounds.contains(current.tempBounds)){
				// map.panTo(indonesiaCenter);
			// }
		// }
    });

	isLoggedIn(function(data){
		if(data == 1){
			google.maps.event.addListener(map, 'rightclick', function(event) {
				infoElement.close();
				if($('#panel-rrd').dialog('isOpen'))	{$('#panel-rrd').dialog('close');}
				
				closeOtherCtxMenu($('#ctxmenu-map'));
				checkPoint(event.latLng);
				$('#ctxmenu-map').dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
				$('#ctxmenu-map').dialog('open');
			});
		}
    });
	
	google.maps.event.addListener(map, 'click', function(event) {
		checkPoint(event.latLng);
		infoElement.close();
		if($('#panel-rrd').dialog('isOpen'))	{$('#panel-rrd').dialog('close');}
		
		closeOtherCtxMenu(null);	
		$('#coord-lng').val(current.longitude);
		$('#coord-lat').val(current.latitude);
    });
	
	updateMap();
	
	//Init tree
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
	kptelInit();
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
				treeGroupProcessing(groupnode,0);
				$.each(data1, function(index, datum1){
					var newPos = new google.maps.LatLng(datum1.latitude, datum1.longitude);
					renderGroup(newPos, datum1.name, datum1.group_id);
					groupObjects.push(datum1);
				});
			}
			if(data2 !== null){
				treeDeviceProcessing(devicenode);
				$.each(data2, function(index, datum2){
					var newPos = new google.maps.LatLng(datum2.latitude, datum2.longitude);
					renderDevice(newPos, datum2.name, datum2.cacti_id, datum2.device_id);
					deviceObjects.push(datum2);
				});
			}
	
			getStatusNotification(function(data3){
				$.each(data3, function(index,datum3){
					var curdev = getElementDeviceObjectsByCactiId(datum3.id);
					//alert(curdev.
					//update alert device icon in menu-tree column
					$('#device-'+curdev.device_id).attr('rel','device-error');
					if(curdev.group_id != 0) {changeParentTreeStatus(curdev.group_id);}
					
					//update alert device icon in google maps
					var updateIconIndex = getIndexOfDeviceObjects(curdev.device_id);
					deviceMarkers[updateIconIndex].setOptions({icon:iconDeviceError});
					
				});
				//udpate notif column
				showWarningDevice(data3);
			});				
		});
	});
}

function treeGroupProcessing(data,x){
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
				//setCenterAndZoom(datum.latitude, datum.longitude);
				showInfoGroup(datum.group_id,datum.latitude,datum.longitude);
			});
			queueid.push(datum.group_id);
		}
	});
	
	while(queueid.length >= 1){
		treeGroupProcessing(data, queueid.pop());
	}
}

function treeDeviceProcessing(data){
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
				showInfoDevice(datum.device_id,datum.latitude,datum.longitude,datum.cacti_id);
			});
	});
}

function changeParentTreeStatus(parentid){
	var curgroup = getElementGroupObjects(parentid);
	$('#group-'+curgroup.group_id).attr('rel','group-error');
	if(curgroup.parent_id != 0) {changeParentTreeStatus(curgroup.parent_id);}
}

//return element by group_id from groupObjects
function getElementGroupObjects(groupid){
	var retval;
	for(var i = 0; i < groupObjects.length; i++){
		if(groupObjects[i].group_id == groupid) retval = groupObjects[i];
	}
	return retval;
}

//return element by device_id from deviceObjects
function getElementDeviceObjects(devid){
	var retval;
	for(var i = 0; i < deviceObjects.length; i++){
		if(deviceObjects[i].device_id == devid) retval = deviceObjects[i];
	}
	return retval;
}

//return element by cacti_id from deviceObjects
function getElementDeviceObjectsByCactiId(cacid){
	var retval;
	for(var i = 0; i < deviceObjects.length; i++){
		if(deviceObjects[i].cacti_id == cacid) retval = deviceObjects[i];
	}
	return retval;
}

//return id of array deviceObjects
function getIndexOfDeviceObjects(devid){
	var retval;
	for(var i = 0; i < deviceObjects.length; i++){
		if(deviceObjects[i].device_id == devid) retval = i;
	}
	return retval;
}

//return id of array groupObjects
function getIndexOfGroupObjects(groupid){
	var retval;
	for(var i = 0; i < groupObjects.length; i++){
		if(groupObjects[i].group_id == groupid) retval = i;
	}
	return retval;
}

//DEVICE-CONTROLLER

function renderDevice(location,devname,cacid,devid) {
    marker = new google.maps.Marker({
      position: location,
	  icon : iconDevice,
      map: map,
	  title : devname,
	  zIndex : 10
    });
    deviceMarkers.push(marker);

	google.maps.event.addListener(marker, 'rightclick', function(event) {
		infoElement.close();
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
	
	
	google.maps.event.addListener(marker, 'click', function(e) {
		if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
		getCactiDevice(cacid, function(cactidata){
			var imgstat = '';
			var textstat = '';
			switch(cactidata.status)
			{
				case '0':
				  imgstat = iconStatusUnknown;
				  textstat = 'unknown';
				  break;
				case '1':
				  imgstat = iconStatusDown;
				  textstat = 'down';
				  break;
				case '2':
				  imgstat = iconStatusRecover;
				  textstat = 'recover';
				  break;
				case '3':
				  imgstat = iconStatusUp;
				  textstat = 'up';
				  break;
				case '4':
				  imgstat = iconStatusThreshold;
				  textstat = 'threshold';
				  break;
				default:
				  imgstat = iconStatusDefault;
				  textstat = 'unknown 2';
			}
			
			var text = '<div id="devinfowindow">'
							+'<div id="imginfowindow">'
							+'<img id="imglogo" src="'+iconDeviceInfo+'" />'
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
			infoElement.setContent(text);
		});
		infoElement.close();
		closeOtherCtxMenu(null);
		current.cactiId = cacid;
		additionCentering = 2 - ((map.getZoom()+6)/10);
		if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
		var selectedCenter = new google.maps.LatLng(this.getPosition().lat()+additionCentering,this.getPosition().lng());
		infoElement.setPosition(location);
		infoElement.open(map);
	});
}

function actionAddDevice(newDeviceID,groupid,devtype,devname,devlng,devlat,cactiid,devdesc){
	//add to map
	var newLatLng = new google.maps.LatLng(devlat,devlng);
	renderDevice(newLatLng,devname,cactiid,newDeviceID);
	
	//add to deviceObjects
	deviceObjects.push({
		device_id: newDeviceID,
		group_id: groupid,
		device_type_id: devtype,
		name: devname,
		description: devdesc,
		longitude: devlng,
		latitude: devlat,
		cacti_id: cactiid
	});
	
	//add device to tree
	var parentnode=null;
	var devid = "device-"+newDeviceID;
	var info = {
			  "attr":{"id":devid, "rel":"device"}
			 ,"data":{"title":devname}
	 };
	if(groupid == 0) parentnode = "#group-0";
	else parentnode = "#group-"+groupid;
	$("#trees").jstree("create",parentnode,"last",info,false,true);
	$('#'+devid).click(function() {
		showInfoDevice(newDeviceID,devlat,devlng,cactiid);
	});
}

function actionUpdateDevice(devid, groupid, devtypeid, named, desc, longi, lati, cactiid) {
	//update tree
	if(groupid == 0) {$("#trees").jstree("move_node", "#device-" + devid, "#group-0");}
	else {$("#trees").jstree("move_node", "#device-" + devid, "#group-" + groupid);}						
	$('#device-'+devid+' a').html('<ins class="jstree-icon"></ins>' + named);
	
	//close other
	closeOtherCtxMenu(null);
	
	//update array deviceObjects
	var idxdev = getIndexOfDeviceObjects(devid);
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

function actionDeleteDevice(devid) {	
	var idxdev = getIndexOfDeviceObjects(devid);
	//update tree change
	$("#trees").jstree("remove","#device-"+devid);
	closeOtherCtxMenu(null);
	
	//update map change
	deviceMarkers[idxdev].setMap(null);
	deviceObjects[idxdev].device_id = -999;
}

//function to show info windows of device
function showInfoDevice(devid,lat,lng,cactiid){
	//close others
	if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
	closeOtherCtxMenu(null);
	infoElement.close();
	
	//init device info window
	getCactiDevice(cactiid,function(cactidata){
		var imgstat = '';
		var textstat = '';
		switch(cactidata.status)
			{
				case '0':
				  imgstat = iconStatusUnknown;
				  textstat = 'unknown';
				  break;
				case '1':
				  imgstat = iconStatusDown;
				  textstat = 'down';
				  break;
				case '2':
				  imgstat = iconStatusRecover;
				  textstat = 'recover';
				  break;
				case '3':
				  imgstat = iconStatusUp;
				  textstat = 'up';
				  break;
				case '4':
				  imgstat = iconStatusThreshold;
				  textstat = 'threshold';
				  break;
				default:
				  imgstat = iconStatusDefault;
				  textstat = 'unknown 2';
			}
		var devObject = getElementDeviceObjects(devid);
		
		var text = '<div id="devinfowindow">'
						+'<div id="imginfowindow">'
						+'<img id="imglogo" src="'+iconDeviceInfo+'" />'
						+'<img id="imgstat" src="'+imgstat+'" /></div>'
						+'<h1>'+devObject.name+'</h1><div class="clearboth"></div><div id="devinfolabel">'
						+'Hostname<br>Description<br>'
						+'Status<br>Last Failed<br>Last Recovered<br>Last Error<br>Availability<br>Ping Latency'
						+'</div><div id="devinfovalue">: '
						+cactidata.hostname + '<br>: '+ cactidata.description+ '<br>: '
						+textstat + '<br>: '+ cactidata.status_fail_date+ '<br>: '+  cactidata.status_rec_date+ '<br>: '
						+cactidata.status_last_error+ '<br>: '+  cactidata.availability+ ' %<br>: '+  cactidata.cur_time+' ms</div>'
						+'<div class="clearboth" id="showdetail"><a href="#" onclick="showPanelRRD()">Show Detail</a></div></div>'
					;
		infoElement.setContent(text);
	});
	
	//show device info window
	var markeridx = getIndexOfDeviceObjects(devid);
	current.cactiId = cactiid;
	additionCentering = 2 - ((map.getZoom()+6)/10);
	if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
	var selectedCenter = new google.maps.LatLng(deviceMarkers[markeridx].getPosition().lat(),deviceMarkers[markeridx].getPosition().lng());
	infoElement.setPosition(selectedCenter);
	infoElement.open(map);
}

//GROUP-CONTROLLER
//show group on the map
function renderGroup(location,groupname,groupid){
	marker = new google.maps.Marker({
      position: location,
	  icon : iconGroup,
      map: map,
	  title : groupname
    });
    groupMarkers.push(marker);

	google.maps.event.addListener(marker, 'rightclick', function(event) {
		infoElement.close();
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
	google.maps.event.addListener(marker, 'click', function(e) {
		infoElement.close();
		if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
		
		var selectedCenter = new google.maps.LatLng(this.getPosition().lat(),this.getPosition().lng());
		closeOtherCtxMenu(null);
		var text = '<img src="'+iconGroupInfo+'" style="float:left;"/>This is group '+groupname;
		infoElement.setPosition(selectedCenter);
		infoElement.setContent(text);
		infoElement.open(map);
	});
}

function actionAddGroup(newGroupID,parentid, grpname, grplng, grplat, grpdesc) {
	//add to map
	var newLatLng = new google.maps.LatLng(grplat,grplng);
	renderGroup(newLatLng,grpname,newGroupID);
	
	//add to groupObjects
	groupObjects.push({
		group_id: newGroupID,
		parent_id: parentid,
		name: grpname,
		description: grpdesc,
		longitude: grplng,
		latitude: grplat
	});
	
	//add group to tree
	var parentnode=null;
	var groupid = "group-"+newGroupID;
	var cgroupid = "cgroup-"+newGroupID; //id for clicked
	var info = {
			  "attr":{"id":groupid, "rel":"group"}
			 ,"data":{"title":grpname}
	 };
	if(parentid == 0) parentnode = "#group-0";
	else parentnode = "#group-"+parentid;
	$("#trees").jstree("create",parentnode,"last",info,false,true);
	$('#'+groupid).find('a').attr("id",cgroupid);
	$('#'+cgroupid).click(function() {
		showInfoGroup(newGroupID,grplat,grplng);
	});
}

function actionUpdateGroup(groupid, parentid, named, desc, longi, lati) {
	//update tree
	if(parentid == 0) {$("#trees").jstree("move_node","#group-"+groupid,"#group-0");}
	else {$("#trees").jstree("move_node","#group-"+groupid,"#group-"+parentid);}
	$('#cgroup-'+groupid).html('<ins class="jstree-icon"></ins>'+named);
	
	var idxgroup = getIndexOfGroupObjects(groupid);
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

function actionDeleteGroup(groupid){
	//update tree change
	$("#trees").jstree("remove","#group-"+groupid);
	closeOtherCtxMenu(null);
	
	//update map change
	var delGroup;
	var idxGroup;
	var delDevice;
	var idxDevice;
	var queueDelGroup = [];
	var queueDelDevice = [];
	queueDelGroup.push(groupid);
	var igg = 0;
	var ihh = 0;
	while(queueDelGroup.length > 0){
		delGroup = queueDelGroup.shift();
		idxGroup = getIndexOfGroupObjects(delGroup);
		//delete group on the map
		groupMarkers[idxGroup].setMap(null);
		groupObjects[idxGroup].group_id = -999;
		for(i=0; i < groupObjects.length; i++)
		{
			if(groupObjects[i].parent_id == delGroup){
				queueDelGroup.push(groupObjects[i].group_id);
			}
		}
		//get all device that corelate with deleted group
		for(i=0; i < deviceObjects.length; i++)
		{
			if(deviceObjects[i].group_id == delGroup){
				queueDelDevice.push(deviceObjects[i].device_id);
			}
		}
	}
	while(queueDelDevice.length > 0){
		//delete All device on the map that corelate with deleted group
		delDevice = queueDelDevice.shift();
		idxDevice = getIndexOfDeviceObjects(delDevice);
		deviceMarkers[idxDevice].setMap(null);
		deviceObjects[idxDevice].device_id = -999;
	}
}

function showInfoGroup(groupid,lat,longi){
	//close others
	if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
	closeOtherCtxMenu(null);
	infoElement.close();
	
	//init the info group window
	var grpObject = getElementGroupObjects(groupid);
	var text = '<img src="'+iconGroupInfo+'" style="float:left;"/>This is group '+grpObject.name;
	infoElement.setContent(text);
	
	//show info group
	var markeridx = getIndexOfGroupObjects(groupid);
	if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
	var selectedCenter = new google.maps.LatLng(groupMarkers[markeridx].getPosition().lat(),groupMarkers[markeridx].getPosition().lng());
	infoElement.setPosition(selectedCenter);
	infoElement.open(map);
}

//CONTROL AUTO SETCENTERZOOM
function setCenterAndZoom(lat,lng){	
	var selectedCenter = new google.maps.LatLng(lat, lng);
	map.panTo(selectedCenter);
	map.setZoom(centeringZoom);
}

//GET COORDINATE
function checkPoint(position){
	current.mouseX = tempX;
	current.mouseY = tempY;
	current.longitude = position.lng();
	current.latitude = position.lat();
}
//SHOW DEVICE ON THE MAP BY ID
function showCactiDevice(id){
	var curdev = getElementDeviceObjectsByCactiId(id);
	showInfoDevice(curdev.device_id,curdev.latitude,curdev.longitude,curdev.cacti_id);
}

function showPanelRRD(){
	infoElement.close();
	$('#panel-rrd').dialog('open');
}