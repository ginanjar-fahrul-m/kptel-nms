<?php
	$hostname="localhost"; 
	$mysql_login="root"; 
	$mysql_password=""; 
	$database="kptel_nms"; 

	if (!($db = mysql_connect($hostname, $mysql_login , $mysql_password)))
	{ 
		die("Cannot connect to mysql.");     
	}
	else
	{ 
		if (!(mysql_select_db("$database",$db)))  
		{ 
			die("Cannot connect to database."); 
		} 
	} 
?>