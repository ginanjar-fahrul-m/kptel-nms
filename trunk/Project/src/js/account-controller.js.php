<?php
/* File   : auth-controller.js
 * Role   : Controller (MVC)
 * Author : Ginanjar Fahrul M (gin)
 * E-Mail : ginanjar.fahrul.m@gmail.com
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * AJAX auth-controller.
 *
 */
?>

var urlAuth = "account-controller.php";

function login(user, pass, callback) {
	var getparam = {
		action: 'account_login',
		data: {
			username: user,
			password: pass
		}
	}
	$.get(urlAuth, getparam, callback);
}

function isLoggedIn(callback) {
	var getparam = {
		action: 'account_is_logged_in',
		data: {
			
		}
	}
	$.get(urlAuth, getparam, callback);
}

function logout(callback) {
	var getparam = {
		action: 'account_logout',
		data: {
			
		}
	}	
	$.get(urlAuth, getparam, callback);
}

