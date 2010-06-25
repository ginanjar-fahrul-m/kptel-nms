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
	
	var name = $("#name"),
		password = $("#password"),
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
		allfieldsdevice = $([]).add(name).add(password),
		tipsdevice = $(".logintips");
		allfieldslogin = $([]).add(name).add(password),
		logintips = $(".logintips");

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
			$('#name').focus();
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
	$("#detail").dialog({
		autoOpen: false,
		modal: false,
		draggable: true,
		resizable: true,
		close: function() {
			
		},
		open: function() {
			alert($(this));
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
				allfieldslogin.removeClass('ui-state-error');

				bValid = bValid && checkLength(name,"username",3,16);
				bValid = bValid && checkLength(password,"password",5,16);

				bValid = bValid && checkRegexp(name,/^[a-z]([0-9a-z_])+$/i,"Username may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkRegexp(password,/^([0-9a-zA-Z])+$/,"Password field only allow : a-z 0-9");
				
				if (bValid) {
					alert('<tr>' +
						'<td>' + name.val() + '</td>' + 
						'<td>' + password.val() + '</td>' +
						'</tr>'); 
					$(this).dialog('close');
				}
			},
			Cancel: function() {
				$(this).dialog('close');
			}
		},
		close: function() {
			allfieldslogin.val('').removeClass('ui-state-error');
		},
		open: function() {
			$('#devicelng').val(currentLng);
			$('#devicelat').val(currentLat);
			$('#contextmenu').dialog('close');
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
				allfieldslogin.removeClass('ui-state-error');

				bValid = bValid && checkLength(name,"username",3,16);
				bValid = bValid && checkLength(password,"password",5,16);

				bValid = bValid && checkRegexp(name,/^[a-z]([0-9a-z_])+$/i,"Username may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkRegexp(password,/^([0-9a-zA-Z])+$/,"Password field only allow : a-z 0-9");
				
				if (bValid) {
					alert('<tr>' +
						'<td>' + name.val() + '</td>' + 
						'<td>' + password.val() + '</td>' +
						'</tr>'); 
					$(this).dialog('close');
				}
			},
			Cancel: function() {
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
	});
	$('#addgroup').click(function() {
		$('#groupform').dialog('open');
		$('#contextmenu').dialog('close');
	});
});