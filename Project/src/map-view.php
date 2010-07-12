<?php
/* File   : map-view.php
 * Role   : Static Page, View (MVC)
 * Author : Ginanjar Fahrul M (gin)
 * E-Mail : ginanjar.fahrul.m@gmail.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * File ini merupakan halaman html yang berinteraksi dengan client,
 * View ini diatur oleh controller dengan memanfaatkan model-model yang ada.
 *
 * Semua style dan script terdapat di header, penamaan id pada setiap elemen
 * HTML dikelompokkan berdasarkan penalaran user, seperti: panel, form, ctxmenu, menu.
 * 
 * Halaman ini menggunakan type XHTML™ 1.0 The Extensible HyperText Markup Language (Second Edition)
 * A Reformulation of HTML 4 in XML 1.0
 * 
 */
 
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
		<?php
			/* css style:
			 * - JQuery UI 1.8.2 Custom Style
			 * - Map style
			 * - Navigation style
			*/
		?>
		
		<link type="text/css" href="css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />	
		<link type="text/css" href="scrapbook/style.css" media="screen" rel="stylesheet" />
		
		<?php
			/* javascript:
			 * - Google Maps JavaScript API V3
			 * - JQuery 1.4.2
			 * - JQuery UI 1.8.2 Custom Script
			 * - JQuery Javascript Tree
			 * - Top Up 1.7.2
			 * - Map Script
			 * - Navigation Script
			 * - Controller Script
			*/
		?>
		
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script> 
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.2.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.jstree.js"></script>
		<script type="text/javascript" src="js/jquery.jstree.min.js"></script>
		<script type="text/javascript" src="js/top_up-min.js"></script>
		<script type="text/javascript" src="js/auth-controller.js.php"></script>
		<script type="text/javascript" src="js/device-controller.js.php"></script>
		<script type="text/javascript" src="js/group-controller.js.php"></script>
		<script type="text/javascript" src="js/notification-controller.js.php"></script>
		<script type="text/javascript" src="js/navigation.js.php"></script>
		<script type="text/javascript" src="js/map.js.php"></script>

	</head>	
	<body>
		<div id="menu" class="fluid ui-widget-header">
			<div id="menu-left"> 
				<ul>
					<li>
						<a class="ui-widget-header" href="" title="Return to home">
							<img alt="menu-home" src="images/menu-home.png"/> Home </a>
					</li> 
					<li>
						<label class="ui-widget-header"> | </label> 
					</li>
					<li>
						<a class="ui-widget-header" id="menu-tree" href="#" title="Show all device and group menu-tree">
							<img alt="menu-tree" src="images/menu-tree.png"/> Group and Device Tree </a>
					</li> 
				</ul> 
			</div> 
			<div id="menu-right"> 
				<ul> 
					<li>
						<a class="tu_iframe_1200x560" id="cacti" href="device-controller.php?action=device_jump_to_cacti" title="Go to cacti"> 
							<img alt="menu-cacti" src="images/menu-cacti.png"/> Go to cacti </a>
					</li>
					<li>
						<label class="ui-widget-header"> | </label> 
					</li>
					<li>
						<a class="ui-widget-header" id="menu-login" href="#" title="As admin"> 
							<img alt="menu-login" src="images/menu-login.png"/> Login </a>
					</li>
					<li>
						<a class="ui-widget-header" id="menu-help" href="#" title="Help and support"> 
							<img alt="menu-help" src="images/menu-help.png"/> Help </a>
					</li> 
					<li>
						<label class="ui-widget-header"> | </label> 
					</li>
					<li>
						<label class="ui-widget-header" id="menu-date"></label> 
					</li>
					<li>
						<label class="ui-widget-header"> | </label> 
					</li>
					<li>
						<a class="ui-widget-header" id="menu-notif" href="#" title="Show device status"> 
							<img id="notif-icon" alt="menu-notif" src="images/menu-notif.png"/>
								<label id="notif-label"> Notifications </label></a>
					</li> 
				</ul>
			</div> 
			<div class="clearboth"></div> 
		</div> 
		<div id="panel">
			<div class="toggler togglerleft">
				<div id="panel-tree" class="ui-widget-content ui-corner-all togglerleft">
					<h3 class="ui-widget-header ui-corner-all">Devices</h3>
					<div id="trees" class="demo jstree jstree-0 jstree-default jstree-focused"></div>
				</div>
			</div>
			<div class="toggler togglerright">
				<div id="panel-notif" class="ui-widget-content ui-corner-all togglerright">
					<h3 class="ui-widget-header ui-corner-all">Notifications</h3>
					<div id="notif" class="scroll"></div>
				</div>
			</div>
			<div id="panel-rrd" title="Device Graph"></div>
			<div id="panel-zoom">
				<button onclick="zoom_in_btn()">+</button>
				<div id="slider" class="ui-slider ui-slider-vertical ui-widget ui-widget-content ui-corner-all"></div>
				<button onclick="zoom_out_btn()">-</button>
			</div>
		</div>
		<div id="form">
			<div id="form-login" title="Login">
				<p class="login-tips">All form fields are required.</p>
				<fieldset>
					<label>Username</label>
					<input type="text" id="login-name" class="text ui-widget-content ui-corner-all" />
					<label>Password</label>
					<input type="password" id="login-pass" value="" class="text ui-widget-content ui-corner-all" />
				</fieldset>
			</div>
			<div id="form-device" title="device form">
				<p class="device-tips">All form fields are required.</p>
				<fieldset>
					<label>Name: </label>
					<input type="text" id="device-name" class="text ui-widget-content ui-corner-all" />
					<label>Parent: </label>
					<select id="device-parent" class="text ui-widget-content ui-corner-all">
						<option value="0">&lt;root&gt;</option>
					</select>
					<label>Device: </label>
					<select id="device-cacti" class="text ui-widget-content ui-corner-all">
						<option value="0">&lt;---&gt;</option>
					</select>
					<label>Location: </label>
					<input type="text" id="device-lng" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
					<input type="text" id="device-lat" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
					<img id="device-location" alt="form-location" src="images/form-location.png"/>
				</fieldset>
			</div>
			<div id="form-group" title="group form">
				<p class="group-tips">All form fields are required.</p>
				<fieldset>
					<label>Name: </label>
					<input type="text" id="group-name" class="text ui-widget-content ui-corner-all" />
					<label>Parent: </label>
					<select id="group-parent" class="text ui-widget-content ui-corner-all">
						<option value="0">&lt;root&gt;</option>
					</select>
					<label>Location: </label>
					<input type="text" id="group-lng" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
					<input type="text" id="group-lat" class="text ui-widget-content ui-corner-all" />&nbsp;&deg;
					<img id="group-location" alt="form-location" src="images/form-location.png"/>
				</fieldset>
			</div>
			<div id="form-coord" class="text ui-widget-content ui-corner-all">
				<label>Location: </label>
				<input type="text" id="coord-lng" class="text ui-widget-content ui-corner-all" readonly="readonly"/>&nbsp;&deg;
				<input type="text" id="coord-lat" class="text ui-widget-content ui-corner-all" readonly="readonly"/>&nbsp;&deg;
			</div>
		</div>
		<div id="ctxmenu">
			<div id="ctxmenu-map">
				<label id="device-add" title="add new device"> Add Device </label>
				<label id="group-add" title="add new group"> Add Group </label>
			</div>
			<div id="ctxmenu-device">
				<label id="device-edit" title="edit this device"> Edit Device </label>
				<label id="device-delete" title="delete this device"> Delete Device </label>
			</div>
			<div id="ctxmenu-group">
				<label id="group-edit" title="edit this group"> Edit Group </label>
				<label id="group-delete" title="delete this group"> Delete Group </label>
			</div>
		</div>
		<div id="map-canvas"></div>
	</body>
</html>