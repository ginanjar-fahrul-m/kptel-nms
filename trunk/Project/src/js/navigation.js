$(document).ready(function(){ 
	$(document).ready(function () { 
		$("#effectleft").toggle(false);
		$("#effectright").toggle(false);
		showWarningDevice();
	}); 
});
$(function() {
	//run the currently selected effect
	function runEffect(effect){
		//get effect type from 
		var selectedEffect = 'blind';
		//most effect types need no options passed by default
		var options = {};
		if(selectedEffect == 'scale'){ options = {percent: 0}; } 
		else if(selectedEffect == 'size'){ options = { to: {width: 200,height: 60} }; }
		//run the effect
		$(effect).toggle(selectedEffect,options,300);
	};
	
	//set effect from select menu value
	$("#tree").click(function() {
		runEffect("#effectleft");
		return false;
	});
	$("#notif").click(function() {
		runEffect("#effectright");
		return false;
	});
	//login-dialog-form
	$("#dialog").dialog("destroy");
	
	var name = $("#loginname"),
		password = $("#loginpassword"),
		devicename = $("#devicename"),
		deviceparent = $("#deviceparent"),
		devicecacti = $("#devicecacti"),
		devicelng = $("#devicelng"),
		devicelat = $("#devicelat"),
		groupname = $("#groupname"),
		groupparent = $("#groupparent"),
		grouplng = $("#grouplng"),
		grouplat = $("#grouplat"),
		allfieldslogin = $([]).add(name).add(password),
		logintips = $(".logintips");
		allfieldsdevice = $([]).add(devicename).add(deviceparent).add(devicecacti).add(devicelng).add(devicelat),
		devicetips = $(".devicetips");
		allfieldsgroup = $([]).add(groupname).add(groupparent).add(grouplng).add(grouplat),
		grouptips = $(".grouptips");
		
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
	
	$("#loginform").dialog({	
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		draggable: false,
		resizable: false,
		show: "clip",
		hide: "clip",
		buttons: {
			'Login': function() {
				var bValid = true;
				allfieldslogin.removeClass('ui-state-error');

				bValid = bValid && checkLength(logintips,name,"username",3,16);
				bValid = bValid && checkLength(logintips,password,"password",5,16);

				bValid = bValid && checkRegexp(logintips,name,/^[a-z]([0-9a-z_])+$/i,"Username may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkRegexp(logintips,password,/^([0-9a-zA-Z])+$/,"Password field only allow : a-z 0-9");
				
				if (bValid) {
					alert('username: ' + name.val() + ' - password: ' + password.val()); 
					logintips.text('All form fields are required.');
					allfieldslogin.val('').removeClass('ui-state-error');
					$(this).dialog('close');
				}
			},
			Cancel: function() {
				logintips.text('All form fields are required.');
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldslogin.val('').removeClass('ui-state-error');
		},
		open: function() {
			name.focus();
			closeOtherCtxMenu("#loginform");
		}
	});
	$("#mapctxmenu").dialog({
		autoOpen: false,
		height: 75,
		width: 125,
		modal: false,
		draggable: false,
		resizable: false,
		close: function() {
			
		},
		open: function() {
			$(this).dialog( 'option', 'position', [current.mouseX,current.mouseY]);
			closeOtherCtxMenu("#mapctxmenu");
		}
	});
	$("#devicectxmenu").dialog({
		autoOpen: false,
		height: 75,
		width: 130,
		modal: false,
		draggable: false,
		resizable: false,
		close: function() {
			
		},
		open: function() {
			$(this).dialog( 'option', 'position', [current.mouseX,current.mouseY]);
			//$('#cactidetail').attr('href','device-controller.php?action=showdevicedetail&data[cacti_id]=' + current.cactiId);
		}
	});
	$("#groupctxmenu").dialog({
		autoOpen: false,
		height: 75,
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
	$("#panelrrd").dialog({
		autoOpen: false,
		height: 400,
		width: 200,
		modal: false,
		draggable: false,
		resizable: false,
		show: "slide",
		hide: "slide",
		position: [0,42],
		zIndex: -1,
		close: function() {
			$('#zoom_control').css('z-index','10');
		},
		open: function() {
			closeOtherCtxMenu("#panelrrd");
			$('#zoom_control').css('z-index','0');
		}
	});
	$("#deviceform").dialog({
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

				bValid = bValid && checkLength(devicetips,devicename,"name",3,16);

				bValid = bValid && checkRegexp(devicetips,devicename,/^[a-z]([0-9a-z_\- ])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkSelect(devicetips,devicecacti);
				bValid = bValid && checkRegexp(devicetips,devicelng,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkRegexp(devicetips,devicelat,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkLength(devicetips,devicelng,"longitude",-90,90);
				bValid = bValid && checkLength(devicetips,devicelat,"latitude",-180,180);
				
				if (bValid) {
					if(!current.isEditForm)
						add_device(deviceparent.val(),default_device,$('#devicename').val(),
									$('#devicelng').val(),$('#devicelat').val(),devicecacti.val(),"Ini device");
					else
						update_device(current.deviceId, deviceparent.val(), default_device, $('#devicename').val(), 
									"", $('#devicelng').val(),$('#devicelat').val(),devicecacti.val());
					devicetips.text('All form fields are required.');
					allfieldslogin.val('').removeClass('ui-state-error');
					$(this).dialog('close');
				}
			},
			Cancel: function() {
				devicetips.text('All form fields are required.');
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldsdevice.val('').removeClass('ui-state-error');
		},
		open: function() {
			devicename.val('');
			get_group_list(function(data){
				deviceparent.find('option').remove();
				deviceparent.append($("<option></option>").attr("value",'0').text('<none>'));
				for (var i = 0; i < data.length; i++){
					deviceparent.append($("<option></option>").attr("value",data[i]['group_id']).text(data[i]['name']));
				}
			});
			get_cacti_unlisted_device_list(function(data){
				devicecacti.find('option').remove();
				devicecacti.append($("<option></option>").attr("value",'0').text('<none>'));
				for (var i = 0; i < data.length; i++){
					devicecacti.append($("<option></option>").attr("value",data[i]['id']).text(data[i]['description']));
				}
			});
			$('#devicelng').val(current.longitude);
			$('#devicelat').val(current.latitude);
			closeOtherCtxMenu("#deviceform");
		}
	});
	$("#groupform").dialog({
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

				bValid = bValid && checkLength(grouptips,groupname,"name",3,16);

				bValid = bValid && checkRegexp(grouptips,groupname,/^[a-z]([0-9a-z_])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkRegexp(grouptips,grouplng,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkRegexp(grouptips,grouplat,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkLength(grouptips,grouplng,"longitude",-90,90);
				bValid = bValid && checkLength(grouptips,grouplat,"latitude",-180,180);
				
				if (bValid) {
					if(!current.isEditForm)
						add_group(groupparent.val(),$('#groupname').val(),$('#grouplng').val(),grouplat.val(),"ini group");
					else
						update_device(current.groupId, groupparent.val(), $('#devicename').val(), "", $('#devicelng').val(),$('#devicelat').val());
					grouptips.text('All form fields are required.');
					allfieldslogin.val('').removeClass('ui-state-error');
					$(this).dialog('close');
				}
			},
			Cancel: function() {
				grouptips.text('All form fields are required.');
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldslogin.val('').removeClass('ui-state-error');
		},
		open: function() {
			groupname.val('');
			get_group_list(function(data){
				groupparent.find('option').remove();
				groupparent.append($("<option></option>").attr("value",'0').text('<none>'));
				for (var i = 0; i < data.length; i++){
					groupparent.append($("<option></option>").attr("value",data[i]['group_id']).text(data[i]['name']));
				}
			});
			$('#grouplng').val(current.longitude);
			$('#grouplat').val(current.latitude);
			closeOtherCtxMenu("#groupform");
		}
	});
	$('#help').click(function() {
		
	});
	$('#login').click(function() {
		$('#loginform').dialog('open');
	});
	$('#adddevice').click(function() {
		$('#deviceform').dialog('open');
	});
	$('#addgroup').click(function() {
		$('#groupform').dialog('open');
	});
	$('#showdetail').click(function() {
		
	});
	$('#devicecacti').change(function() {
		if($('#devicecacti').val()!='0')$('#devicename').val($.trim($('#devicecacti :selected').html()));
		else $('#devicename').val("");
	});
	$('#editdevice').click(function() {
		current.isEditForm = true;
		$('#deviceform').dialog('open');
		get_device(current.deviceId,function(devicedata){
			$('#devicename').val(devicedata['name']);
			$('#deviceparent').val(devicedata['group_id']);
			get_cacti_device(devicedata['cacti_id'],function(cactidata){
				$('#devicecacti').append($("<option></option>").attr("value",devicedata['cacti_id']).text(cactidata['description']));
				$('#devicecacti').val(devicedata['cacti_id']);
			});
			$('#devicelng').val(devicedata['longitude']);
			$('#devicelat').val(devicedata['latitude']);
		});
	});
	$('#deletedevice').click(function() {
		delete_device(current.deviceId, function(){alert("deleted")});
		closeOtherCtxMenu(null);
	});
	$('#editgroup').click(function() {
		current.isEditForm = true;
		$('#groupform').dialog('open');
		get_group(current.groupId,function(data){
			$('#groupname').val(data['name']);
			$('#groupparent').val(data['parent_id']);
			$('#grouplng').val(data['longitude']);
			$('#grouplat').val(data['latitude']);
		});
	});
	$('#deletegroup').click(function() {
		delete_group(current.groupId, function(){alert("deleted")});
		closeOtherCtxMenu(null);
	});
	$('#help').click(function() {
		$('#panelrrd').dialog('open');
	});
});