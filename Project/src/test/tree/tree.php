<?php

require_once('../../includes/config.php');
require_once('../../includes/connection.class.php');
require_once('../../includes/session.php');

session_init();
session_db_init();

?>

<html>
	<head>
		<script type="text/javascript" src="../../js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="jquery.jstree.min.js"></script>
		<script type="text/javascript" src="../vardump.js"></script>
		<script type="text/javascript" src="tree.js"></script>
	</head>
	
	<body>
		<button "build_tree()">Build Tree</button>
		<div id="pohon"></div>
	</body>
</html>