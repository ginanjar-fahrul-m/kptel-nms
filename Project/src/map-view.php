<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

session_init();
session_db_init();

?>

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
		<script type="text/javascript" src="js/map.js"></script>
		<script type="text/javascript" src="js/navigation.js"></script>
	</head>
	<body onload="kptel_init()">
		<?php 
			require("includes/navigation.html");
		?>
		<div id="map_canvas"></div>
	</body>
</html>