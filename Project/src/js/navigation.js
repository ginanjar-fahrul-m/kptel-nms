$(document).ready(function(){ 
	$(document).ready(function () { 
		$("#effectleft").toggle(false);
		$("#effectright").toggle(false);
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
		if (o.val() != 'default') {
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
			$('#contextmenu').dialog('close');
			$('#objectmenu').dialog('close');
		}
	});
	$("#contextmenu").dialog({
		autoOpen: false,
		height: 70,
		width: 120,
		modal: false,
		draggable: false,
		resizable: false,
		close: function() {
			
		},
		open: function() {
			$(this).dialog( 'option', 'position', [currentMouseX,currentMouseY]);
		}
	});
	$("#objectmenu").dialog({
		autoOpen: false,
		height: 70,
		width: 120,
		modal: false,
		draggable: false,
		resizable: false,
		close: function() {
			
		},
		open: function() {
			$(this).dialog( 'option', 'position', [currentMouseX,currentMouseY]);
		}
	});
	$("#deviceform").dialog({
		autoOpen: false,
		height: 330,
		width: 350,
		modal: true,
		draggable: false,
		resizable: false,
		show: "clip",
		hide: "clip",
		buttons: {
			'Add': function() {
				var bValid = true;
				allfieldsdevice.removeClass('ui-state-error');

				bValid = bValid && checkLength(devicetips,devicename,"name",3,16);

				bValid = bValid && checkRegexp(devicetips,devicename,/^[a-z]([0-9a-z_])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkSelect(devicetips,deviceparent);
				bValid = bValid && checkSelect(devicetips,devicecacti);
				bValid = bValid && checkRegexp(devicetips,devicelng,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkRegexp(devicetips,devicelat,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkLength(devicetips,devicelng,"longitude",-90,90);
				bValid = bValid && checkLength(devicetips,devicelat,"latitude",-180,180);
				
				if (bValid) {
					add_device(0,0,$('#devicename').val(),$('#devicelng').val(),$('#devicelat').val(),2,"Ini device");
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
			$('#devicelng').val(currentLng);
			$('#devicelat').val(currentLat);
			$('#contextmenu').dialog('close');
			$('#objectmenu').dialog('close');
		}
	});
	$("#groupform").dialog({
		autoOpen: false,
		height: 280,
		width: 350,
		modal: true,
		draggable: false,
		resizable: false,
		show: "clip",
		hide: "clip",
		buttons: {
			'Add': function() {
				var bValid = true;
				allfieldsgroup.removeClass('ui-state-error');

				bValid = bValid && checkLength(grouptips,groupname,"name",3,16);

				bValid = bValid && checkRegexp(grouptips,groupname,/^[a-z]([0-9a-z_])+$/i,"Name may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkSelect(grouptips,groupparent);
				bValid = bValid && checkRegexp(grouptips,grouplng,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkRegexp(grouptips,grouplat,/^([+/-]?((([0-9]+(\.)?)|([0-9]*\.[0-9]+))([eE][+\-]?[0-9]+)?))$/,"Coordinate must be float : -123.456");
				bValid = bValid && checkLength(grouptips,grouplng,"longitude",-90,90);
				bValid = bValid && checkLength(grouptips,grouplat,"latitude",-180,180);
				
				if (bValid) {
					add_group(0,$('#groupname').val(),$('#grouplng').val(),$('#grouplat').val(),"ini group");
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
			$('#grouplng').val(currentLng);
			$('#grouplat').val(currentLat);
			$('#contextmenu').dialog('close');
$('#objectmenu').dialog('close');
		}
	});
	$('#help').click(function() {
		$('#detail').dialog('open');
	});
	$('#login').click(function() {
		$('#loginform').dialog('open');
	});
	$('#adddevice').click(function() {
		$('#deviceform').dialog('open');
		$('#contextmenu').dialog('close');
		$('#objectmenu').dialog('close');
	});
	$('#addgroup').click(function() {
		$('#groupform').dialog('open');
		$('#contextmenu').dialog('close');
		$('#objectmenu').dialog('close');
	});
	$('#showdetail').click(function() {
		$('#contextmenu').dialog('close');
		$('#objectmenu').dialog('close');
	});
});