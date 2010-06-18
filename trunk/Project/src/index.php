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
		<div id="menubar"></div>
		
		<div id="menu">
			<div class="floatleft">
				<ul>
					<li><a>Group and Device Tree</a></li>
				</ul>
			</div>
			<div class="floatright">
				<ul>
					<li><a>Notifications</a></li>
					<li><a>Login</a></li>
					<li><a>Help</a></li>
				</ul>
			</div>
		</div>
		
		<div id="map_canvas"></div>
	</body>
</html>