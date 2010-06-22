<?php

require_once('config.php');

function get_hash($plaintext) {
	global $config;
	
	$key = sha1($plaintext.$config['security']['salt']);
	for($i = 0; $i < $config['security']['loop']; $i++) {
		$key = sha1($key.$config['security']['salt']);
	}
	
	return $key;
}

?>