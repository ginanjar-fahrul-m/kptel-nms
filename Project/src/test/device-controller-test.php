<?php

require_once('../includes/config.php');
require_once('../includes/connection.class.php');
require_once('../includes/session.php');

session_init();
session_db_init();

?>

<form action="../device-controller.php" method="get">
	ACTION: <input type="text" name="action"><br />
	DATA: <input type="text" name="data"><br />
	<input type="submit" value="SUBMIT">
</form>