<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		
		<link rel="stylesheet" type="text/css" href="css/map.css" media="screen" />
		
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
		<script type="text/javascript" src="js/map.js"></script>
		
		<title>KPTEL-NMS</title>
	</head>
	
	<body onload="kptel_init()">
		<div class="fluid fluidtop">
			<div class="wrap">
				<div id="top">
					<div id="topleft" class="floatleft">
						<ul>
							<li><a href="" title="Return to home">
							<img border="0" src="images/menu-home.png"/> Home</a></li>
							<li><a> | </a></li>
							<li><a href="" title="Show all device and group tree">
							<img border="0" src="images/menu-tree.png"/> Group and Device Tree</a></li>
						</ul>
					</div>
					<div id = "topright" class="floatright">
						<ul>
							<li><a href="" title="Show device status">
							<img border="0" src="images/menu-notif.png"/> Notifications</a></li>
							<li><a> | </a></li>
							<li><a href="" title="Login as admin">
							<img border="0" src="images/menu-login.png"/> Login</a></li>
							<li><a href="" title="Help and support">
							<img border="0" src="images/menu-help.png"/> Help</a></li>
							<li><a> | </a></li>
							<li><a id="time"></a></li>
						</ul>
					</div>
				</div>
				<div class="clearboth"></div>
			</div>
		</div>
		<hr>
		<div id="map_canvas"></div>
	</body>
</html>