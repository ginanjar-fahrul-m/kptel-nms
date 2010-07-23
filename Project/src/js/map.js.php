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

var map = null;
var infoElement = null;
var default_device = 0;
var groupMarkers = [];<?php /* Contain Marker Google*/?>
var groupObjects = [];
<?php 
/*
*	Array groupObject
*	-----------------
*	Element of this array is an Object which has structure like this.
*	{
*		group_id: Integer,
*		parent_id: Integer,
*		name: String,
*		description: String,
*		longitude: Float,
*		latitude: Float
*	}
*/?>
var deviceMarkers = [];<?php /* Contain Marker Google*/ ?>
var deviceObjects = [];
<?php 
/*
*	Array deviceObject
*	-----------------
*	Element of this array is an Object which has structure like this.
*	{
*		device_id: Integer,
*		group_id: Integer,
*		device_type_id: Integer,
*		name: String,
*		description: String,
*		longitude: Float,
*		latitude: Float,
*		cacti_id: Integer
*	}
*/
?>
var listSearch = []; <?php /* List name of all group and device */ ?>
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
var indonesiaBounds = null;
var minZoom = 5;
var maxZoom = 18;
var centeringZoom = minZoom + 2;

//INITIALIZATION FUNCTION
function setSizes() {
   var menuHeight = 42;
   var viewportHeight = $(window).height();
   var mapHeight = viewportHeight - menuHeight;
   $("#map-canvas").height(mapHeight);
}

function mapInit() {
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
	
	//forbid user to drag map out of indonesiaCenter
	google.maps.event.addListener(map, 'bounds_changed', function(event) {
		if(map.getZoom() == minZoom){
			map.setCenter(indonesiaCenter);
		}
    });

	isLoggedIn(function(data){
		initLoginButton(data);
		if(data == 1){
			google.maps.event.addListener(map, 'rightclick', function(event) {
				infoElement.close();
				if($('#panel-rrd').dialog('isOpen')) {$('#panel-rrd').dialog('close');}
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
	updateMap();
	initTopUp();
}

$(function(){
	mapInit();
});

function updateMap(){
	buildMapComponent();
	setTimeout("updateMap()",60000);
}

//Build Tree and Map Element
function buildMapComponent(){
	var groupnode;
	var devicenode;
	infoElement.close();
	// Refresh all nodes' menu-tree and map component
	// data1 is data that contain list of all group that have been added to database
	// data2 is data that contain list of all device that have been added to database
	// data3 is data that contain list of all device that don't have status up
	getGroupList(function(data1) {
		groupnode = data1;
		getDeviceList(function(data2) {
			devicenode = data2;	
			//reset tree
			$('#trees').html('');	
			//create root node
			$("#trees").jstree("create",-1,"first",{"attr":{"id":"group-0", "rel":"group"},"data":{"title":"root"}},false,true);			
			//Reset all group and device component on the map
			if (deviceMarkers) {
				for (idx = 0; idx < deviceMarkers.length; idx++) {
				  deviceMarkers[idx].setMap(null);
				}
				deviceMarkers.length = 0;
			}
			if (groupMarkers) {
				for (idx = 0; idx < groupMarkers.length; idx++) {
				  groupMarkers[idx].setMap(null);
				}
				groupMarkers.length = 0;
			}
			if (listSearch) {listSearch.length = 0;}
			if (deviceObjects) {deviceObjects.length = 0;}
			if (groupObjects) {groupObjects.length = 0;}
			
			//refresh all group on map and tree
			if(data1 !== null){	
				treeGroupProcessing(groupnode,0);
				$.each(data1, function(index, datum1){
					var newPos = new google.maps.LatLng(datum1.latitude, datum1.longitude);
					renderGroup(newPos, datum1.name, datum1.group_id);
					groupObjects.push(datum1);
					listSearch.push(datum1.name);
				});
			}
			//refresh all device on map and tree
			if(data2 !== null){
				treeDeviceProcessing(devicenode);
				$.each(data2, function(index, datum2){
					var newPos = new google.maps.LatLng(datum2.latitude, datum2.longitude);
					renderDevice(newPos, datum2.name, datum2.cacti_id, datum2.device_id);
					deviceObjects.push(datum2);
					listSearch.push(datum2.name);
				});
			}
			//add sign to any device that has problem
			getStatusNotification(function(data3){
				$.each(data3, function(index,datum3){
					if(datum3.status != 2){
						var curdev = getElementDeviceObjectsByCactiId(datum3.id);
						//update alert device icon in menu-tree column
						$('#device-'+curdev.device_id).attr('rel','device-error');
						if(curdev.group_id != 0) {changeParentTreeStatus(curdev.group_id);}
						
						//update alert device icon in google maps
						var updateIconIndex = getIndexOfDeviceObjects(curdev.device_id);
						deviceMarkers[updateIconIndex].setOptions({icon:iconDeviceError});
					}
				});
				//udpate notification column
				showWarningDevice(data3);
				initSearch();
			});				
		});
	});
}

function initSearch(){
	$('#input-search').autocomplete({
			source: listSearch
	});
	
	$('#input-search').keyup(function(e) {
		if(e.keyCode == 13) {
			searchProcessing();
		}
	});
	
	$('#button-search').click(searchProcessing);
}

function searchProcessing(){
	var idxSearch = 0;
	var querySearch = $('#input-search').val();
	var codeSearch = '';
	
	for(var i = 0; i < groupObjects.length; i++){
		if(groupObjects[i].name == querySearch) {
			idxSearch = groupObjects[i].group_id;
			codeSearch = 'G';
		}
	}
	for(var i = 0; i < deviceObjects.length; i++){
		if(deviceObjects[i].name == querySearch) {
			idxSearch = deviceObjects[i].device_id;
			codeSearch = 'D';
		}
	}
	
	if(codeSearch == 'G'){
		showInfoGroup(idxSearch);
	}else if(codeSearch == 'D'){
		showInfoDevice(idxSearch);
	}else{
		openDialogBox('No device or group match your search');
	}
}

function addElementListSearch(addedName){
	listSearch.push(addedName);
}

function editElementListSearch(initialName,editedName){
	if(listSearch){
		var found = false;
		var inc = 0;
		while(!found || (inc < listSearch.length)){
			if(listSearch[inc] == initialName) {
				listSearch[inc] = '';
				found = true;
			}
			inc++;
		}
	}
	addElementListSearch(editedName);
}

function deleteElementListSearch(deletedName){
	if(listSearch){
		var found = false;
		var inc = 0;
		while(!found || (inc < listSearch.length)){
			if(listSearch[inc] == deletedName) {
				listSearch[inc] = '';
				found = true;
			}
			inc++;
		}
	}
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
				showInfoGroup(datum.group_id);
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
				showInfoDevice(datum.device_id);
			});
	});
}

//change all group that contain problematic device
function changeParentTreeStatus(parentid){
	var curgroup = getElementGroupObjects(parentid);
	$('#group-'+curgroup.group_id).attr('rel','group-error');
	if(curgroup.parent_id != 0) {changeParentTreeStatus(curgroup.parent_id);}
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
		//close other
		if($('#panel-rrd').dialog('isOpen')) {$('#panel-rrd').dialog('close');}
		infoElement.close();
		closeOtherCtxMenu(null);
		
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
							+'<div class="clearboth" id="showdetail"><a href="#" onclick="showPanelRRD();">Show Detail</a></div></div>'
						;
			infoElement.setContent(text);
		});
		current.cactiId = cacid;
		if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
		var markeridx = getIndexOfDeviceObjects(devid);
		var selectedCenter = new google.maps.LatLng(deviceMarkers[markeridx].getPosition().lat(),deviceMarkers[markeridx].getPosition().lng());
		infoElement.setPosition(selectedCenter);
		infoElement.open(map);
	});
}

//this function is called when device is added
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
	addElementListSearch(devname);
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
		showInfoDevice(newDeviceID);
	});
	
	//check if the device doesn't have status 'up' or 'recover'
	getCactiDevice(cactiid,function(newCacti){
		if((newCacti.status != 2)&&(newCacti.status != 3)){
			//update alert device icon in menu-tree column
			$('#device-'+newDeviceID).attr('rel','device-error');
			if(groupid != 0) {changeParentTreeStatus(groupid);}
			
			//update alert device icon in google maps
			var updateIconIndex = getIndexOfDeviceObjects(newDeviceID);
			deviceMarkers[updateIconIndex].setOptions({icon:iconDeviceError});
		}
	});
}

//this function called when device is updated
function actionUpdateDevice(devid, groupid, devtypeid, named, desc, longi, lati, cactiid) {
	//update tree
	if(groupid == 0) {$("#trees").jstree("move_node", "#device-" + devid, "#group-0");}
	else {$("#trees").jstree("move_node", "#device-" + devid, "#group-" + groupid);}						
	$('#device-'+devid+' a').html('<ins class="jstree-icon"></ins>' + named);
	
	//close other
	var idxdev = getIndexOfDeviceObjects(devid);
	closeOtherCtxMenu(null);
	
	//alert('awal: ' + deviceObjects[idxdev].name + '+ jadi: ' + named);
	editElementListSearch(deviceObjects[idxdev].name,named); //edit search suggestion
	
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

//this function called when device is deleted
function actionDeleteDevice(devid) {	
	var idxdev = getIndexOfDeviceObjects(devid);
	//update tree change
	$("#trees").jstree("remove","#device-"+devid);
	deleteElementListSearch(deviceObjects[idxdev].name);//delete suggestion search
	closeOtherCtxMenu(null);
	
	//update map change
	deviceMarkers[idxdev].setMap(null);
	deviceObjects[idxdev].device_id = -999;
	
	//update notif box
	$("#notif-"+deviceObjects[idxdev].cacti_id).remove();
	$(".threshold-"+deviceObjects[idxdev].cacti_id).remove();
}

//show info windows of device on the map by device_id
function showInfoDevice(devid){
	var selectedDevice = getElementDeviceObjects(devid);
	var lat = selectedDevice.latitude;
	var lng = selectedDevice.longitude;
	var cactiid = selectedDevice.cacti_id;
	var name = selectedDevice.name;
	//close others
	if($('#panel-rrd').dialog('isOpen')) {$('#panel-rrd').dialog('close');}
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
		
		var text = '<div id="devinfowindow">'
						+'<div id="imginfowindow">'
						+'<img id="imglogo" src="'+iconDeviceInfo+'" />'
						+'<img id="imgstat" src="'+imgstat+'" /></div>'
						+'<h1>'+name+'</h1><div class="clearboth"></div><div id="devinfolabel">'
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
	
	//show info window device
	current.cactiId = cactiid;
	if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
	var markeridx = getIndexOfDeviceObjects(devid);
	var selectedCenter = new google.maps.LatLng(deviceMarkers[markeridx].getPosition().lat(),deviceMarkers[markeridx].getPosition().lng());
	infoElement.setPosition(selectedCenter);
	infoElement.open(map);
}

//show info device on the map by cacti_id
function showInfoDeviceByCactiID(cactiid){
	var curdev = getElementDeviceObjectsByCactiId(cactiid);
	showInfoDevice(curdev.device_id);
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
	//alert(grpname);
	addElementListSearch(grpname);
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
		showInfoGroup(newGroupID);
	});
}

function actionUpdateGroup(groupid, parentid, named, desc, longi, lati) {
	//update tree
	if(parentid == 0) {$("#trees").jstree("move_node","#group-"+groupid,"#group-0");}
	else {$("#trees").jstree("move_node","#group-"+groupid,"#group-"+parentid);}
	$('#cgroup-'+groupid).html('<ins class="jstree-icon"></ins>'+named);
	
	var idxgroup = getIndexOfGroupObjects(groupid);
	closeOtherCtxMenu(null);
	
	editElementListSearch(groupObjects[idxgroup].name,named); //edit search suggestion
	
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

//fungsi yang dipanggil 
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
		deleteElementListSearch(groupObjects[idxGroup].name);//delete suggestion search
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
				deleteElementListSearch(deviceObjects[i].name);//delete suggestion search
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

//show info group on the map by group_id
function showInfoGroup(groupid){
	var selectedGroup = getElementGroupObjects(groupid);
	var lat = selectedGroup.latitude;
	var longi = selectedGroup.longitude;
	var name = selectedGroup.name;
	//close others
	if($('#panel-rrd').dialog('isOpen'))	$('#panel-rrd').dialog('close');
	closeOtherCtxMenu(null);
	infoElement.close();
	
	//init the info group window
	var text = '<img src="'+iconGroupInfo+'" style="float:left;"/>This is group '+name;
	infoElement.setContent(text);
	
	//show info group
	var markeridx = getIndexOfGroupObjects(groupid);
	if(map.getZoom() == minZoom) map.setZoom(minZoom+1);
	var selectedCenter = new google.maps.LatLng(groupMarkers[markeridx].getPosition().lat(),groupMarkers[markeridx].getPosition().lng());
	infoElement.setPosition(selectedCenter);
	infoElement.open(map);
}

//GROUPOBJECTS, DEVICEOBJECTS, GROUPMARKERS, DEVICEMARKERS SELECTOR
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

//CONTROL AUTO SETCENTERZOOM 
//tidak terpakai, namun dapat dipakai suatu waktu
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