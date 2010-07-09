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
	
	var 
		allfieldslogin = $([]).add($("#login-name")).add($("#login-pass")),
		allfieldsdevice = $([]).add($("#device-name")).add($("#device-parent")).add($("#device-cacti")).add($("#device-lng")).add($("#device-lat")),
		allfieldsgroup = $([]).add($("#group-name")).add($("#group-parent")).add($("#group-lng")).add($("#group-lat"));
		
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
			$('#panel-zoom').css('z-index','10');
		},
		open: function() {
			closeOtherCtxMenu(null);
			$('#panel-zoom').css('z-index','0');
			getCactiGraphList(current.cactiId, function(data){
				var rrdText = "";
				$('#panel-rrd').html('');
				rrdText += "<div style='margin: 10px;'>" + data['description'] + "</div>";
				rrdText += "<div id='rrd-accord'>";
				for(var i=0; i<data['data'].length; i++){
					rrdText += "<h3><a href='#'>" + data['data'][i]['name'] + "</a></h3><div>";
					rrdText += "<label class='tu_iframe_800x500' href='" + data['data'][i]['realtime_url'] + "'>Realtime</label>";
					rrdText += "<hr/>";
					for(var j=0; j<data['data'][i]['rra_url'].length; j++){
						rrdText += "<label class='tu_iframe_800x500' href='" + data['data'][i]['rra_url'][j]['url'] + "'> " + data['data'][i]['rra_url'][j]['name'] + " </label>";
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
			'Login': function() {
				var bValid = true;
				allfieldslogin.removeClass('ui-state-error');

				bValid = bValid && checkLength($(".login-tips"),$("#login-name"),"username",3,16);
				bValid = bValid && checkLength($(".login-tips"),$("#login-pass"),"password",5,16);

				bValid = bValid && checkRegexp($(".login-tips"),$("#login-name"),/^[a-z]([0-9a-z_])+$/i,"Username may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkRegexp($(".login-tips"),$("#login-pass"),/^([0-9a-zA-Z])+$/,"Password field only allow : a-z 0-9");
				
				if (bValid) {
					var user = $("#login-name").val();
					var pass = $("#login-pass").val();
					$(".login-tips").text('All form fields are required.');
					allfieldslogin.val('').removeClass('ui-state-error');
					$(this).dialog('close');
					login(user, pass, function(data){
						if(data == 1) window.location = ".";
						else $('#form-login').dialog('open');
					});
				}
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
				var bValid = true;
				allfieldsdevice.removeClass('ui-state-error');

				bValid = bValid && checkLength($(".device-tips"),$("#device-name"),"name",3,16);

				bValid = bValid && checkRegexp($(".device-tips"),$("#device-name"),/^[a-z]([0-9a-z_\- ])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkSelect($(".device-tips"),$("#device-cacti"));
				bValid = bValid && checkRegexp($(".device-tips"),$("#device-lng"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
				bValid = bValid && checkRegexp($(".device-tips"),$("#device-lat"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
				bValid = bValid && checkLength($(".device-tips"),$("#device-lng"),"longitude",-90,90);
				bValid = bValid && checkLength($(".device-tips"),$("#device-lat"),"latitude",-180,180);
				
				if (bValid) {
					if(!current.isEditForm)
						add_device($("#device-parent").val(),default_device,$('#device-name').val(),
									$('#device-lng').val(),$('#device-lat').val(),$("#device-cacti").val(),"Ini device");
					else
						update_device(current.deviceId, $("#device-parent").val(), default_device, $('#device-name').val(), 
									"", $('#device-lng').val(),$('#device-lat').val(),$("#device-cacti").val());
					$(".device-tips").text('All form fields are required.');
					allfieldsdevice.val('').removeClass('ui-state-error');
					$(this).dialog('close');
				}
			},
			Cancel: function() {
				$(".device-tips").text('All form fields are required.');
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldsdevice.val('').removeClass('ui-state-error');
		},
		open: function() {
			$("#device-name").val('');
			current.isFinish1 = false;
			current.isFinish2 = false;
			getGroupList(function(data){
				current.isFinish1 = true;
				$("#device-parent").find('option').remove();
				$("#device-parent").append($("<option></option>").attr("value",'0').text('<none>'));
				for (var i = 0; i < data.length; i++){
					$("#device-parent").append($("<option></option>").attr("value",data[i]['group_id']).text(data[i]['name']));
				}
				if(current.isFindLoc){
					$('#device-name').val(current.tempName);
					$('#device-parent').val(current.tempParent);
					$('#device-cacti').val(current.tempDevice);
					if(current.isConfirm){
						$('#device-lng').val($('#coord-lng').val());
						$('#device-lat').val($('#coord-lat').val());
					}
					else {
						$('#device-lng').val(current.tempLng);
						$('#device-lat').val(current.tempLat);
					}
					if(current.isFinish1 && current.isFinish2) current.isFindLoc = false;
				} else {
					$('#device-lng').val(current.longitude);
					$('#device-lat').val(current.latitude);
				}
			});
			getCactiUnlistedDeviceList(function(data){
				current.isFinish2 = true;
				$("#device-cacti").find('option').remove();
				$("#device-cacti").append($("<option></option>").attr("value",'0').text('<none>'));
				for (var i = 0; i < data.length; i++){
					$("#device-cacti").append($("<option></option>").attr("value",data[i]['id']).text(data[i]['description']));
				}
				if(current.isFindLoc){
					$('#device-cacti').val(current.tempDevice);
					if(current.isFinish1 && current.isFinish2) current.isFindLoc = false;
				}
			});
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
				var bValid = true;
				allfieldsgroup.removeClass('ui-state-error');

				bValid = bValid && checkLength($(".group-tips"),$("#group-name"),"name",3,16);

				bValid = bValid && checkRegexp($(".group-tips"),$("#group-name"),/^[a-z]([0-9a-z_])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkRegexp($(".group-tips"),$("#group-lng"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
				bValid = bValid && checkRegexp($(".group-tips"),$("#group-lat"),/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"form-coord must be float : -123.456");
				bValid = bValid && checkLength($(".group-tips"),$("#group-lng"),"longitude",-90,90);
				bValid = bValid && checkLength($(".group-tips"),$("#group-lat"),"latitude",-180,180);
				
				if (bValid) {
					if(!current.isEditForm)
						add_group($("#group-parent").val(),$('#group-name').val(),$('#group-lng').val(),$("#group-lat").val(),"ini group");
					else
						update_group(current.groupId, $("#group-parent").val(), $('#group-name').val(), "", $('#group-lng').val(),$('#group-lat').val());
					$(".group-tips").text('All form fields are required.');
					allfieldsgroup.val('').removeClass('ui-state-error');
					$(this).dialog('close');
					current.isEditForm = false;
				}
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
			getGroupList(function(data){
				$("#group-parent").find('option').remove();
				$("#group-parent").append($("<option></option>").attr("value",'0').text('<none>'));
				if(current.isEditForm){
					getPossibleParentList(current.groupId, function(posData){
						for (var i = 0; i < posData.length; i++){
							$("#group-parent").append($("<option></option>").attr("value",posData[i]['group_id']).text(posData[i]['name']));
						}
					});
				}
				else {
					for (var i = 0; i < data.length; i++){
						$("#group-parent").append($("<option></option>").attr("value",data[i]['group_id']).text(data[i]['name']));
					}
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
			});
			
			closeOtherCtxMenu("#form-group");
		}
	});
	$('#menu-help').click(function() {
		
	});
	$('#device-add').click(function() {
		$('#form-device').dialog('open');
	});
	$('#group-add').click(function() {
		$('#form-group').dialog('open');
	});
	$('#showdetail').click(function() {
		
	});
	$('#device-cacti').change(function() {
		if($('#device-cacti').val()!='0')$('#device-name').val($.trim($('#device-cacti :selected').html()));
		else $('#device-name').val("");
	});
	$('#device-edit').click(function() {
		current.isEditForm = true;
		$('#form-device').dialog('open');
		getDevice(current.deviceId,function(devicedata){
			$('#device-name').val(devicedata['name']);
			$('#device-parent').val(devicedata['group_id']);
			getCactiDevice(devicedata['cacti_id'],function(cactidata){
				$('#device-cacti').append($("<option></option>").attr("value",devicedata['cacti_id']).text(cactidata['description']));
				$('#device-cacti').val(devicedata['cacti_id']);
			});
			$('#device-lng').val(devicedata['longitude']);
			$('#device-lat').val(devicedata['latitude']);
		});
	});
	$('#device-delete').click(function() {
		delete_device(current.deviceId, function(){alert("deleted")});
		closeOtherCtxMenu(null);
	});
	$('#group-edit').click(function() {
		current.isEditForm = true;
		$('#form-group').dialog('open');
		getGroup(current.groupId,function(data){
			$('#group-name').val(data['name']);
			$('#group-parent').val(data['parent_id']);
			$('#group-lng').val(data['longitude']);
			$('#group-lat').val(data['latitude']);
		});
	});
	$('#group-delete').click(function() {
		deleteGroup(current.groupId, function(result){
			if(result==1) alert("deleted");

			else alert("delete failed");
		});
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
	$("#menu-tree").click(function() {
		runEffect("#panel-tree",'blind');
		return false;
	});
	$("#menu-notif").click(function() {
		runEffect("#panel-notif",'blind');
		return false;
	});
});