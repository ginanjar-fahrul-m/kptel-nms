<?php
/* File   : auth-controller.js
 * Role   : Controller (MVC)
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * AJAX auth-controller.
 *
 */
?>

var url_auth = "auth-controller.php";

function login(user, pass, callback) {
	var getparam = {
		action: 'account_login',
		data: {
			username: user,
			password: pass
		}
	}
	$.get(url_auth, getparam, callback);
}

function isLoggedIn(callback) {
	var getparam = {
		action: 'account_is_logged_in',
		data: {
			
		}
	}
	$.get(url_auth, getparam, callback);
}

function logout(callback) {
	var getparam = {
		action: 'account_logout',
		data: {
			
		}
	}	
	$.get(url_auth, getparam, callback);
}

