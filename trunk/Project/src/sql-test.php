<?php
	include("device.php");
	include("group.php");
	include("admin-account.php");
	$dev = new Device(1, 1, 1, "test", "test_d", 5, 5);
	$dev->addDevice();
	
	$la = new Device();
	$la->getDevice();
	echo($la->device_id." ".$la->group_id." ".$la->name." ".$la->description);
?>