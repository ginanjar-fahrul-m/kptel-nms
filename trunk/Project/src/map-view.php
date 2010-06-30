<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

session_init();
session_db_init();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>KPTEL-NMS</title> 
		<link type="text/css" href="css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />	
		<link type="text/css" href="css/navigation.css" media="screen" rel="stylesheet" />
		<link type="text/css" href="css/map.css" media="screen" rel="stylesheet" />

		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script> 
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.2.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.jstree.js"></script>
		<script type="text/javascript" src="js/jquery.jstree.min.js"></script>
		<script type="text/javascript" src="js/map.js"></script>
		<script type="text/javascript" src="js/navigation.js"></script>
		<script type="text/javascript" src="js/top_up-min.js"></script>
	</head>	
	<body>
		<div id="top" class="fluid ui-widget-header">
			<div id="topleft"> 
				<ul>
					<li><a class="ui-widget-header" href="#" title="Return to home">
					<img alt="menu-home" src="images/menu-home.png"/> Home </a></li> 
					<li><a class="ui-widget-header"> | </a></li> 
					<li><a class="ui-widget-header" id="tree" href="#" title="Show all device and group tree">
					<img alt="menu-tree" src="images/menu-tree.png"/> Group and Device Tree </a></li> 
				</ul> 
			</div> 
			<div id = "topright"> 
				<ul> 
					<li><a class="ui-widget-header" id="login" href="#" title="Login as admin"> 
					<img alt="menu-login" src="images/menu-login.png"/> Login </a></li>
					<li><a class="ui-widget-header" id="help" href="#" title="Help and support"> 
					<img alt="menu-help" src="images/menu-help.png"/> Help </a></li> 
					<li><a class="ui-widget-header"> | </a></li> 
					<li><a class="ui-widget-header" id="time"></a></li> 
					<li><a class="ui-widget-header"> | </a></li> 
					<li><a class="ui-widget-header" id="notif" href="#" title="Show device status"> 
					<img id="warning" alt="menu-notif" src="images/menu-notif.png"/><label id="notif-label"> Notifications </label></a></li> 
				</ul>
			</div> 
			<div class="clearboth"></div> 
		</div> 
		<hr/>
		<div class="toggler togglerleft">
			<div id="effectleft" class="ui-widget-content ui-corner-all">
				<h3 class="ui-widget-header ui-corner-all">DSLAM Device</h3>
				<div id="trees" class="demo jstree jstree-0 jstree-default jstree-focused">
				</div>
			</div>
		</div>
		<div class="toggler togglerright">
			<div id="effectright" class="ui-widget-content ui-corner-all">
				<h3 class="ui-widget-header ui-corner-all">Notification</h3>
				<div id="notification" class="scroll">
					<div class="notif-box"> 
						<div class="notif-img"><img alt="flag-alert" src="images/flag-alert.png" /></div> 
						<div class="notif-cont"><h3>qwerty</h3>&nbsp; 12-12-12</div> 
						<div class="notif-clear"></div> 
					</div>
					<div class="notif-box"> 
						<div class="notif-img"><img alt="menu-warning" src="images/flag-warning.png" /></div> 
						<div class="notif-cont"><h3>qwerty</h3>&nbsp; 12-12-12</div> 
						<div class="notif-clear"></div> 
					</div>
				</div>
			</div>
		</div>
		<div id="zoom_control">
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
		<div id="contextmenu">
			<label id="adddevice" title="add new device"> Add Device </label>
			<label id="addgroup" title="add new group"> Add Group </label>
		</div>
		<div id="objectmenu">
			<label id="showdetail" title="add new device"><a id="cactidetail" href="" class="tu_iframe_800x500"> Show Detail </a></label>
		</div>
		<div id="deviceform" title="device form">
			<p class="devicetips">All form fields are required.</p>
			<fieldset>
				<label>Name: </label>
				<input type="text" name="devicename" id="devicename" class="text ui-widget-content ui-corner-all" />
				<label>Parent: </label>
				<select name="deviceparent" id="deviceparent" class="text ui-widget-content ui-corner-all">
					<option value="0">&lt;none&gt;</option>
				</select>
				<label>Device: </label>
				<select name="devicecacti" id="devicecacti" class="text ui-widget-content ui-corner-all">
					<option value="0">&lt;none&gt;</option>
				</select>
				<label>Location: </label>
				<input type="text" id="devicelng" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
				<input type="text" id="devicelat" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
			</fieldset>
		</div>
		<div id="groupform" title="group form">
			<p class="grouptips">All form fields are required.</p>
			<fieldset>
				<label>Name: </label>
				<input type="text" name="groupname" id="groupname" class="text ui-widget-content ui-corner-all" />
				<label>Parent: </label>
				<select name="groupparent" id="groupparent" class="text ui-widget-content ui-corner-all">
					<option value="0">&lt;none&gt;</option>
				</select>
				<label>Location: </label>
				<input type="text" id="grouplng" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
				<input type="text" id="grouplat" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
			</fieldset>
		</div>
		<div id="map_canvas"></div>
	</body>
</html>