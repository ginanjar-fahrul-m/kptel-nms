<?php

$key_salt = '7mcFSTfhSez6Dn53MYBLd44s';
$key_iter = 16384;

function get_hash($plaintext) {
	global $key_salt, $key_iter;
	
	$key = sha1($plaintext.$key_salt);
	for($i = 0; $i < $key_iter; $i++) {
		$key = sha1($key.$key_salt);
	}
	
	return $key;
}

?>