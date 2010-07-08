<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

session_init();
session_db_init();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>KPTEL-NMS</title> 
		<link type="text/css" href="css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />	
		<link type="text/css" href="scrapbook/navigation.css" media="screen" rel="stylesheet" />
		<link type="text/css" href="scrapbook/map.css" media="screen" rel="stylesheet" />

		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script> 
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.2.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.jstree.js"></script>
		<script type="text/javascript" src="js/jquery.jstree.min.js"></script>
		<script type="text/javascript" src="scrapbook/auth-controller.js"></script>
		<script type="text/javascript" src="scrapbook/device-controller.js"></script>
		<script type="text/javascript" src="scrapbook/group-controller.js"></script>
		<script type="text/javascript" src="scrapbook/notification-controller.js"></script>
		<script type="text/javascript" src="scrapbook/map.js"></script>
		<script type="text/javascript" src="scrapbook/navigation.js"></script>
		<script type="text/javascript" src="js/top_up-min.js"></script>
	</head>	
	<body>
		<div id="menu" class="fluid ui-widget-header">
			<div id="menu-left"> 
				<ul>
					<li>
						<a class="ui-widget-header" href="" title="Return to home">
							<img alt="menu-home" src="images/menu-home.png"/> Home </a>
					</li> 
					<label class="ui-widget-header"> | </label> 
					<li>
						<a class="ui-widget-header" id="menu-tree" href="#" title="Show all device and group menu-tree">
							<img alt="menu-tree" src="images/menu-tree.png"/> Group and Device Tree </a>
					</li> 
				</ul> 
			</div> 
			<div id="menu-right"> 
				<ul> 
					<li>
						<a class="tu_iframe_1200x560" toptions="shaded=1, effect=clip, layout=dashboard, modal=1" id="cacti" href="device-controller.php?action=gotocacti" title="Go to cacti"> 
							<img alt="menu-cacti" src="images/menu-cacti.png"/> Go to cacti </a>
					</li>
					<label class="ui-widget-header"> | </label> 
					<li>
						<a class="ui-widget-header" id="menu-login" href="#" title="As admin"> 
							<img alt="menu-login" src="images/menu-login.png"/> Login </a>
					</li>
					<li>
						<a class="ui-widget-header" id="menu-help" href="#" title="Help and support"> 
							<img alt="menu-help" src="images/menu-help.png"/> Help </a>
					</li> 
					<label class="ui-widget-header"> | </label> 
					<label class="ui-widget-header" id="menu-date"></label> 
					<label class="ui-widget-header"> | </label>  
					<li>
						<a class="ui-widget-header" id="menu-notif" href="#" title="Show device status"> 
							<img id="notif-icon" alt="menu-notif" src="images/menu-notif.png"/>
								<label id="notif-label"> Notifications </label></a>
					</li> 
				</ul>
			</div> 
			<div class="clearboth"></div> 
		</div> 
		<div id="panel-tree" class="ui-widget-content ui-corner-all toggler togglerleft">
			<h3 class="ui-widget-header ui-corner-all">Devices</h3>
			<div id="trees" class="demo jstree jstree-0 jstree-default jstree-focused">
			</div>
		</div>
		<div id="panel-notif" class="ui-widget-content ui-corner-all toggler togglerright">
			<h3 class="ui-widget-header ui-corner-all">Notifications</h3>
			<div id="notif" class="scroll"></div>
		</div>
		<div id="zoom-control">
			<button onclick="zoom_in_btn()">+</button>
			<div id="slider" class="ui-slider ui-slider-vertical ui-widget ui-widget-content ui-corner-all"></div>
			<button onclick="zoom_out_btn()">-</button>
		</div>
		<div id="loginform" title="Login">
			<p class="logintips">All form fields are required.</p>
			<fieldset>
				<label>Username</label>
				<input type="text" name="name" id="loginname" class="text ui-widget-content ui-corner-all" />
				<label>Password</label>
				<input type="password" name="password" id="loginpassword" value="" class="text ui-widget-content ui-corner-all" />
			</fieldset>
		</div>
		<div id="mapctxmenu">
			<label id="adddevice" title="add new device"> Add Device </label>
			<label id="addgroup" title="add new group"> Add Group </label>
		</div>
		<div id="devicectxmenu">
			<label id="editdevice" title="edit this device"> Edit Device </label>
			<label id="deletedevice" title="delete this device"> Delete Device </label>
		</div>
		<div id="groupctxmenu">
			<label id="editgroup" title="edit this group"> Edit Group </label>
			<label id="deletegroup" title="delete this group"> Delete Group </label>
		</div>
		<div id="panelrrd" title="Device Graph"></div>
		<div id="deviceform" title="device form">
			<p class="devicetips">All form fields are required.</p>
			<fieldset>
				<label>Name: </label>
				<input type="text" name="devicename" id="devicename" class="text ui-widget-content ui-corner-all" />
				<label>Parent: </label>
				<select name="deviceparent" id="deviceparent" class="text ui-widget-content ui-corner-all">
					<option value="0">&lt;root&gt;</option>
				</select>
				<label>Device: </label>
				<select name="devicecacti" id="devicecacti" class="text ui-widget-content ui-corner-all">
					<option value="0">&lt;---&gt;</option>
				</select>
				<label>Location: </label>
				<input type="text" id="devicelng" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
				<input type="text" id="devicelat" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
				<img id="devicelocation" alt="form-location" src="images/form-location.png"/>
			</fieldset>
		</div>
		<div id="groupform" title="group form">
			<p class="grouptips">All form fields are required.</p>
			<fieldset>
				<label>Name: </label>
				<input type="text" name="groupname" id="groupname" class="text ui-widget-content ui-corner-all" />
				<label>Parent: </label>
				<select name="groupparent" id="groupparent" class="text ui-widget-content ui-corner-all">
					<option value="0">&lt;root&gt;</option>
				</select>
				<label>Location: </label>
				<input type="text" id="grouplng" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
				<input type="text" id="grouplat" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
				<img id="grouplocation" alt="form-location" src="images/form-location.png"/>
			</fieldset>
		</div>
		<div id="map_canvas"></div>
		<div id="coordinate" class="text ui-widget-content ui-corner-all">
			<label>Location: </label>
			<input type="text" id="coord-lng" class="text ui-widget-content ui-corner-all" readonly/>&nbsp;&deg;
			<input type="text" id="coord-lat" class="text ui-widget-content ui-corner-all" readonly/>&nbsp;&deg;
		</div>
	</body>
</html>