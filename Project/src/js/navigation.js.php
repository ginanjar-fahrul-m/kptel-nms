<?php
/* File   : navigation.js
 * Role   : Controller (MVC)
 * Author : Ginanjar Fahrul M (gin)
 * E-Mail : ginanjar.fahrul.m@gmail.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * Controller ini mengurus semua hal yang berkaitan dengan navigasi,
 * termasuk menu-login, menu, dan panel.
 *
 */
?>

var tempX = 0;
var tempY = 0;
var tempXMove = 0;
var tempYMove = 0;
var listctxmenu = [];
var current = {
    mouseX : -999,
    mouseY : -999,
    longitude : 0,
	latitude : 0,
	cactiId : -999,
	deviceId : -999,
	groupId : -999,
	isEditForm : false,
	isConfirm : false,
	isFindLoc : false,
	isFinish1 : false,
	isFinish2 : false,
	inWhichForm: null,
	tempName : "",
	tempParent : 0,
	tempDevice : 0,
	tempLng : 0,
	tempLat : 0
};

listctxmenu.push('#ctxmenu-map', '#ctxmenu-device', '#ctxmenu-group');

$(document).ready(function () {
	$("#panel-tree").toggle(false);
	$("#panel-notif").toggle(false);
	isLoggedIn(function(data){
		if(data == 0){
			$('#menu-login').html('<img alt="menu-login" src="images/menu-login.png"/> Login');
			$('#menu-login').click(function() {
				$('#form-login').dialog('open');
			});
		} else if(data == 1){
			$('#menu-login').html('<img alt="menu-logout" src="images/menu-logout.png"/> Logout');
			$('#menu-login').click(function() {
				logout(function(){
					window.location = ".";
				});
			});
		}
	});
}); 

$(function(){
	var 
		allfieldslogin = $([]).add($("#login-name")).add($("#login-pass")),
		allfieldsdevice = $([]).add($("#device-name")).add($("#device-parent")).add($("#device-cacti")).add($("#device-lng")).add($("#device-lat")),
		allfieldsgroup = $([]).add($("#group-name")).add($("#group-parent")).add($("#group-lng")).add($("#group-lat"));

	$("#dialog").dialog("destroy");
	
	function runEffect(effectId,effect){
		var selectedEffect = effect;
		var options = {};
		if(selectedEffect == 'scale'){
			options = {percent: 0}; 
		}
		else if(selectedEffect == 'size'){
			options = { to: {width: 200,height: 60} };
		}
		$(effectId).toggle(selectedEffect,options,300);
	};
		
	function updateTips(tips,t) {
		tips
			.text(t)
			.addClass('ui-state-highlight');
		setTimeout(function() {
			tips.removeClass('ui-state-highlight', 1500);
		}, 500);
	}

	function checkLength(tips,o,n,min,max) {
		if ( o.val().length > max || o.val().length < min ) {
			o.addClass('ui-state-error');
			updateTips(tips,"Length of " + n + " must be between "+min+" and "+max+".");
			return false;
		} else {
			return true;
		}
	}
	
	function checkRegexp(tips,o,regexp,n) {

		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass('ui-state-error');
			updateTips(tips,n);
			return false;
		} else {
			return true;
		}
	}
	
	function checkSelect(tips,o) {
		var n = "Select one ";
		if (o.val() != '0') {
			return true;
		}
		else {
			o.addClass('ui-state-error');
			updateTips(tips,n);
			return false;
		}
	}
	
	function formLoginConfirm(){
		var bValid = true;
		allfieldslogin.removeClass('ui-state-error');

		bValid = bValid && checkLength($(".login-tips"),$("#login-name"),"username",0,50);
		bValid = bValid && checkLength($(".login-tips"),$("#login-pass"),"password",0,50);

		bValid = bValid && checkRegexp($(".login-tips"),$("#login-name"),/^[a-z]([0-9a-z_])+$/i,"Username may consist of a-z, 0-9, underscores, begin with a letter.");
		bValid = bValid && checkRegexp($(".login-tips"),$("#login-pass"),/^([0-9a-zA-Z])+$/,"Password field only allow : a-z 0-9");
		
		if (bValid) {
			var user = $("#login-name").val();
			var pass = $("#login-pass").val();
			$(".login-tips").text('All form fields are required.');
			allfieldslogin.val('').removeClass('ui-state-error');
			$('#form-login').dialog('close');
			login(user, pass, function(data){
				if(data == 1) {
					current.inWhichForm = 'form-login-success';
					openDialogBox("Login successful!");
				}
				else {
					current.inWhichForm = 'form-login-failed';
					openDialogBox("Login failed!");
				}
			});
		}
	}
	
	function formDeviceConfirm(){
		var bValid = true;
		allfieldsdevice.removeClass('ui-state-error');

		bValid = bValid && checkLength($(".device-tips"),$("#device-name"),"name",0,64);

		bValid = bValid && checkRegexp($(".device-tips"),$("#device-name"),/^[a-z]([0-9a-z_\- ])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
		if(!current.isEditForm) bValid = bValid && checkSelect($(".device-tips"),$("#device-cacti"));
		bValid = bValid && checkRegexp($(".device-tips"),$("#device-lng"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
		bValid = bValid && checkRegexp($(".device-tips"),$("#device-lat"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
		bValid = bValid && checkLength($(".device-tips"),$("#device-lng"),"longitude",-90,90);
		bValid = bValid && checkLength($(".device-tips"),$("#device-lat"),"latitude",-180,180);
		
		if (bValid) {
			if(!current.isEditForm) {
				addDevice($("#device-parent").val(),default_device,$('#device-name').val(),
							$('#device-lng').val(),$('#device-lat').val(),$("#device-cacti").val(),"Ini device");
			}
			else {
				var temp = getElementDeviceObjects(current.deviceId);
				updateDevice(current.deviceId, $("#device-parent").val(), default_device, $('#device-name').val(), 
							"", $('#device-lng').val(),$('#device-lat').val(),temp['cacti_id']);
			}
			$(".device-tips").text('All form fields are required.');
			allfieldsdevice.val('').removeClass('ui-state-error');
			$('#form-device').dialog('close');
			current.isEditForm = false;
		}
	}
	
	function formGroupConfirm(){
		var bValid = true;
		allfieldsgroup.removeClass('ui-state-error');

		bValid = bValid && checkLength($(".group-tips"),$("#group-name"),"name",0,64);

		bValid = bValid && checkRegexp($(".group-tips"),$("#group-name"),/^[a-z]([0-9a-z_\- ])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
		bValid = bValid && checkRegexp($(".group-tips"),$("#group-lng"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
		bValid = bValid && checkRegexp($(".group-tips"),$("#group-lat"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
		bValid = bValid && checkLength($(".group-tips"),$("#group-lng"),"longitude",-90,90);
		bValid = bValid && checkLength($(".group-tips"),$("#group-lat"),"latitude",-180,180);
		
		if (bValid) {
			if(!current.isEditForm) {
				addGroup($("#group-parent").val(),$('#group-name').val(),$('#group-lng').val(),$("#group-lat").val(),"ini group");
			}
			else {
				updateGroup(current.groupId, $("#group-parent").val(), $('#group-name').val(), "", $('#group-lng').val(),$('#group-lat').val());
			}
			$(".group-tips").text('All form fields are required.');
			allfieldsgroup.val('').removeClass('ui-state-error');
			$('#form-group').dialog('close');
			current.isEditForm = false;
		}
	}
	
	$("#panel-rrd").dialog({
		autoOpen: false,
		height: 500,
		width: 200,
		modal: false,
		draggable: false,
		resizable: false,
		show: "slide",
		hide: "slide",
		position: [0,42],
		close: function() {
			
		},
		open: function() {
			closeOtherCtxMenu(null);
			getCactiGraphList(current.cactiId, function(data){
				var rrdText = "";
				$('#panel-rrd').html('');
				rrdText += "<div style='margin: 10px;'>" + data['description'] + "</div>";
				rrdText += "<div id='rrd-accord'>";
				for(var i=0; i<data['data'].length; i++){
					rrdText += "<h3><a href='#'>" + data['data'][i]['name'] + "</a></h3><div>";
					rrdText += "<label toption='shaded=1, effect=clip, layout=dashboard, modal=1' class='tu_iframe_800x500' href='" + data['data'][i]['realtime_url'] + "'>Realtime</label>";
					rrdText += "<hr/>";
					for(var j=0; j<data['data'][i]['rra_url'].length; j++){
						rrdText += "<label toption='shaded=1, effect=clip, layout=dashboard, modal=1' class='tu_iframe_800x500' href='" + data['data'][i]['rra_url'][j]['url'] + "'> " + data['data'][i]['rra_url'][j]['name'] + " </label>";
					}
					rrdText += "</div>";
				}
				rrdText += "</div>";
				$('#panel-rrd').html(rrdText);
				$("#rrd-accord").accordion();
			});
		}
	});
	
	$("#form-login").dialog({	
		autoOpen: false,
		height: 250,
		width: 300,
		modal: true,
		draggable: false,
		resizable: false,
		show: "clip",
		hide: "clip",
		buttons: {
			'Login': function(){
				formLoginConfirm();
			},
			Cancel: function() {
				$(".login-tips").text('All form fields are required.');
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldslogin.val('').removeClass('ui-state-error');
		},
		open: function() {
			$("#login-name").focus();
			closeOtherCtxMenu("#form-login");
		}
	});
	
	$("#form-device").dialog({
		autoOpen: false,
		height: 360,
		width: 350,
		modal: true,
		draggable: false,
		resizable: false,
		show: "clip",
		hide: "clip",
		buttons: {
			'OK': function() {
				formDeviceConfirm();
			},
			Cancel: function() {
				current.isEditForm = false;
				$(".device-tips").text('All form fields are required.');
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldsdevice.val('').removeClass('ui-state-error');
		},
		open: function() {
			$("#device-name").val('');
			if(current.isEditForm){
				$("#device-parent").find('option').remove();
				$("#device-parent").append($("<option></option>").attr("value",'0').text('root'));
				for (var i = 0; i < groupObjects.length; i++){
					$("#device-parent").append($("<option></option>").attr("value",groupObjects[i]['group_id']).text(groupObjects[i]['name']));
				}
				$('#device-cacti').css("display","none");
				$('#cacti-label').css("display","none");
				if(current.isFindLoc){
					$('#device-name').val(current.tempName);
					$('#device-parent').val(current.tempParent);
					if(current.isConfirm){
						$('#device-lng').val($('#coord-lng').val());
						$('#device-lat').val($('#coord-lat').val());
					}
					else {
						$('#device-lng').val(current.tempLng);
						$('#device-lat').val(current.tempLat);
					}
					current.isFindLoc = false;
				} else {
					var devicedata = getElementDeviceObjects(current.deviceId);
					$('#device-name').val(devicedata['name']);
					$('#device-parent').val(devicedata['group_id']);
					$('#device-lng').val(devicedata['longitude']);
					$('#device-lat').val(devicedata['latitude']);
					$('#device-parent').val(devicedata['cacti_id']);
				}
			} else{
				$('#device-cacti').css("display","block");
				$('#cacti-label').css("display","block");
				
				$("#device-parent").find('option').remove();
				$("#device-parent").append($("<option></option>").attr("value",'0').text('root'));
				for (var i = 0; i < groupObjects.length; i++){
					$("#device-parent").append($("<option></option>").attr("value",groupObjects[i]['group_id']).text(groupObjects[i]['name']));
				}
				getCactiUnlistedDeviceList(function(data){
					$("#device-cacti").find('option').remove();
					$("#device-cacti").append($("<option></option>").attr("value",'0').text('<none>'));
					for (var i = 0; i < data.length; i++){
						$("#device-cacti").append($("<option></option>").attr("value",data[i]['id']).text(data[i]['description']));
					}
					if(current.isFindLoc){
						$('#device-name').val(current.tempName);
						$('#device-parent').val(current.tempParent);
						getCactiDevice(current.tempDevice,function(tempData){
							$('#device-cacti').append($("<option></option>").attr("value",current.tempDevice).text(tempData['description']));
							$('#device-cacti').val(current.tempDevice);
						});
						if(current.isConfirm){
							$('#device-lng').val($('#coord-lng').val());
							$('#device-lat').val($('#coord-lat').val());
						}
						else {
							$('#device-lng').val(current.tempLng);
							$('#device-lat').val(current.tempLat);
						}
						current.isFindLoc = false;
					} else {							
						$('#device-lng').val(current.longitude);
						$('#device-lat').val(current.latitude);
					}
				});
			}
			closeOtherCtxMenu("#form-device");
		}
	});
	
	$("#form-group").dialog({
		autoOpen: false,
		height: 320,
		width: 350,
		modal: true,
		draggable: false,
		resizable: false,
		show: "clip",
		hide: "clip",
		buttons: {
			'OK': function() {
				formGroupConfirm();
			},
			Cancel: function() {
				current.isEditForm = false;
				$(".group-tips").text('All form fields are required.');
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldsgroup.val('').removeClass('ui-state-error');
		},
		open: function() {
			$("#group-name").val('');
			if(current.isEditForm){
				getPossibleParentList(current.groupId, function(posData){
					$("#group-parent").find('option').remove();
					$("#group-parent").append($("<option></option>").attr("value",'0').text('<none>'));
					for (var i = 0; i < posData.length; i++){
						$("#group-parent").append($("<option></option>").attr("value",posData[i]['group_id']).text(posData[i]['name']));
					}
					if(current.isFindLoc){
						$('#group-name').val(current.tempName);
						$('#group-parent').val(current.tempParent);
						if(current.isConfirm){
							$('#group-lng').val($('#coord-lng').val());
							$('#group-lat').val($('#coord-lat').val());
						} else{
							$('#group-lng').val(current.tempLng);
							$('#group-lat').val(current.tempLat);
						}
						current.isFindLoc = false;
					} else{
						var data = getElementGroupObjects(current.groupId)
						$('#group-name').val(data['name']);
						$('#group-parent').val(data['parent_id']);
						$('#group-lng').val(data['longitude']);
						$('#group-lat').val(data['latitude']);
					}
				});
			}
			else {
				$("#group-parent").find('option').remove();
				$("#group-parent").append($("<option></option>").attr("value",'0').text('<none>'));
				for (var i = 0; i < groupObjects.length; i++){
					$("#group-parent").append($("<option></option>").attr("value",groupObjects[i]['group_id']).text(groupObjects[i]['name']));
				}
				if(current.isFindLoc){
					$('#group-name').val(current.tempName);
					$('#group-parent').val(current.tempParent);
					if(current.isConfirm){
						$('#group-lng').val($('#coord-lng').val());
						$('#group-lat').val($('#coord-lat').val());
					} else{
						$('#group-lng').val(current.tempLng);
						$('#group-lat').val(current.tempLat);
					}
					current.isFindLoc = false;
				} else{
					$('#group-lng').val(current.longitude);
					$('#group-lat').val(current.latitude);
				}
			}
			closeOtherCtxMenu("#form-group");
		}
	});
	
	$("#form-coord").dialog({	
		autoOpen: false,
		modal: false,
		draggable: true,
		resizable: false,
		show: "clip",
		hide: "clip",
		buttons: {
			'OK': function() {
				$("#form-coord").dialog('close');
				current.isConfirm = true;
				if(current.inWhichForm == 'form-device'){
					$("#form-device").dialog('open');
				} else
				if(current.inWhichForm == 'form-group'){
					$("#form-group").dialog('open');
				}
			},
			Cancel: function() {
				$("#form-coord").dialog('close');
				current.isConfirm = false;
				if(current.inWhichForm == 'form-device'){
					$("#form-device").dialog('open');
				} else
				if(current.inWhichForm == 'form-group'){
					$("#form-group").dialog('open');
				}
			}
		},
		close: function() {
			
		},
		open: function() {
			
		}
	});
	
	$("#dialog-confirm").dialog({
		autoOpen: false,
		resizable: false,
		height:160,
		modal: true,
		buttons: {
			'Delete': function() {
				if(current.inWhichForm == 'form-device'){
					deleteDevice(current.deviceId);
				} else
				if(current.inWhichForm == 'form-group'){
					deleteGroup(current.groupId);
				} 
				$(this).dialog('close');
			},
			Cancel: function() {
				$(this).dialog('close');
			}
		}
	});

	$("#dialog-box").dialog({
		autoOpen: false,
		resizable: false,
		height:160,
		modal: true,
		buttons: {
			'OK': function() {
				if(current.inWhichForm == 'form-login-success'){
					window.location = ".";
				}
				$(this).dialog('close');
			}
		}
	});
	
	$("#ctxmenu-map").dialog({
		autoOpen: false,
		height: 55,
		width: 125,
		modal: false,
		draggable: false,
		resizable: false,
		close: function() {
			
		},
		open: function() {
			$(this).dialog( 'option', 'position', [current.mouseX,current.mouseY]);
			closeOtherCtxMenu("#ctxmenu-map");
		}
	});
	
	$("#ctxmenu-device").dialog({
		autoOpen: false,
		height: 55,
		width: 130,
		modal: false,
		draggable: false,
		resizable: false,
		close: function() {
			
		},
		open: function() {
			$(this).dialog( 'option', 'position', [current.mouseX,current.mouseY]);
		}
	});
	
	$("#ctxmenu-group").dialog({
		autoOpen: false,
		height: 55,
		width: 130,
		modal: false,
		draggable: false,
		resizable: false,
		close: function() {
			
		},
		open: function() {
			$(this).dialog('option', 'position', [current.mouseX,current.mouseY]);
		}
	});
	
	$('#menu-help').click(function() {
	});
	
	$("#menu-tree").click(function() {
		runEffect("#panel-tree",'blind');
		return false;
	});
	
	$("#menu-notif").click(function() {
		runEffect("#panel-notif",'blind');
		return false;
	});
	
	$('#device-add').click(function() {
		$('#form-device').dialog('open');
	});
	
	$('#group-add').click(function() {
		$('#form-group').dialog('open');
	});
	
	$('#device-cacti').change(function() {
		if($('#device-cacti').val()!='0')$('#device-name').val($.trim($('#device-cacti :selected').html()));
		else $('#device-name').val("");
	});
	
	$('#device-edit').click(function() {
		current.isEditForm = true;
		$('#form-device').dialog('open');
	});
	
	$('#device-delete').click(function() {
		current.inWhichForm = 'form-device';
		$('#confirm-text').html('These item will be permanently deleted and cannot be recovered. Are you sure to delete this device?');
		$('#dialog-confirm').dialog('open');
		closeOtherCtxMenu(null);
	});
	
	$('#group-edit').click(function() {
		current.isEditForm = true;
		$('#form-group').dialog('open');
	});
	
	$('#group-delete').click(function() {
		current.inWhichForm = 'form-group';
		$('#confirm-text').html('These item will be permanently deleted and cannot be recovered. Are you sure to delete this group?');
		$('#dialog-confirm').dialog('open');
		closeOtherCtxMenu(null);
	});
	
	$('#device-location').click(function() {
		current.tempName = $('#device-name').val();
		current.tempParent = $('#device-parent').val();
		current.tempDevice = $('#device-cacti').val();
		current.tempLng = $('#device-lng').val();
		current.tempLat = $('#device-lat').val();
		$('#coord-lng').val($('#device-lng').val());
		$('#coord-lat').val($('#device-lat').val());
		$('#form-device').dialog('close');
		current.inWhichForm = 'form-device';
		$("#form-coord").dialog('open');
		current.isFindLoc = true;
		return false;
	});
	
	$('#group-location').click(function() {
		current.tempName = $('#group-name').val();
		current.tempParent = $('#group-parent').val();
		current.tempLng = $('#group-lng').val();
		current.tempLat = $('#group-lat').val();
		$('#coord-lng').val($('#group-lng').val());
		$('#coord-lat').val($('#group-lat').val());
		$('#form-group').dialog('close');
		current.inWhichForm = 'form-group';
		$("#form-coord").dialog('open');
		current.isFindLoc = true;
		return false;
	});
	
	$('#cacti').click(function() {	
		if($('#panel-rrd').dialog('isOpen')) $('#panel-rrd').dialog('close');
	});
	
	$('#login-pass').change(function() {
		formLoginConfirm()
	});
});

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
	document.getElementById("menu-date").innerHTML = content;
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

function showWarningDevice(data){
	$('#notif').html('');
	var li;
	for(var i = 0; i < data.length; i++){
		li = "<div id='notif-"+data[i]['id']+"' class='notif-box' onclick='showCactiDevice("+data[i].id+")'><div class='notif-img'><img alt='menu-warning' src='images/";
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
		$('#notif').append(li);
	}
	if(data.length == 0){
		li = "<div class='notif-box'><div class='notif-img'><img alt='menu-ok' src='images/";
		li += "flag-ok.png'";
		li += " /></div><div class='notif-cont'><h3 align='left'>" + "All device ok!" + "</h3>";
		li += "&nbsp;&nbsp;---" + "</div><div class='notif-clear'></div></div>";
		$('#notif').append(li);
	}
	$('#notif').append("<hr/><div align='center'>Threshold</div><hr/>");
	getThresholdNotification(function(th){
		if(th != null){
			for(var i = 0; i < th.length; i++){
				li = "<div class='notif-box threshold-"+th[i]['id']+"' onclick='showCactiDevice("+th[i]['id']+")'><div class='notif-img'><img alt='menu-warning' src='images/flag-warning.png'";
				li += "/></div><div class='notif-cont'><h3 align='left'>" + th[i]['name'] + "</h3>&nbsp;&nbsp;[Lo-Hi]: [";
				li += th[i]['thold_low'] + "-" + th[i]['thold_hi']  + "] Last read: " + th[i]['lastread'] + "</div><div class='notif-clear'></div></div>";
				$('#notif').append(li);
			}
			if(th.length == 0){
				li = "<div class='notif-box'><div class='notif-img'><img alt='menu-ok' src='images/";
				li += "flag-ok.png'";
				li += " /></div><div class='notif-cont'><h3 align='left'>" + "No threshold found!" + "</h3>";
				li += "&nbsp;&nbsp;---" + "</div><div class='notif-clear'></div></div>";
				$('#notif').append(li);
			}
			showAlert(true,data.length + th.length);
		}
	});
}

function showAlert(bool,n){
	if(n > 0){
		$('#notif-icon').attr("src",'images/alert.gif');
		$('#notif-label').html(" Notifications (" + n + ") ");
	}
	else
	{
		$('#notif-icon').attr("src",'images/flag-ok.png');
		$('#notif-label').html(" Notifications ");
	}
}

//show RRD panel when 'show detail' is clicked
function showPanelRRD(){
	$('#panel-rrd').dialog('open');
	infoElement.close();
}

function closeOtherCtxMenu(id){
	for(var i = 0; i < listctxmenu.length; i++) {
		if(listctxmenu[i]!=id){
			$(listctxmenu[i]).dialog('close');
		}	
	}
}

function initTopUp(){
	$('#menu-cacti').attr('toption', 'shaded=1, effect=clip, layout=dashboard, modal=1');
}

function openDialogBox(text){
	$('#dialog-box').dialog('open');
	$('#dialog-text').html("<div style='margin-top: 50; font-weight:normal;'>"+text+"</div>");
}
