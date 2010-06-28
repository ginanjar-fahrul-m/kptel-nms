var url = "../auth-controller.php";

function alert_account(data) {
	alert(vardump(data, 5));
}

function add_account() {
	alert("add account");
	
	var getparam = {
		action: 'accountadd',
		data: {
			username: document.getElementById('username').value,
			password: document.getElementById('password').value,
			email: document.getElementById('email').value,
			fullname: document.getElementById('fullname').value
		}
	}
	
	$.get(url, getparam, alert_account);
}

function login() {
	alert("login");
	
	var getparam = {
		action: 'accountlogin',
		data: {
			username: document.getElementById('username').value,
			password: document.getElementById('password').value
		}
	}
	
	$.get(url, getparam, alert_account);
}

function is_logged_in() {
	var getparam = {
		action: 'accountisloggedin',
		data: {
			
		}
	}
	
	$.get(url, getparam, alert_account);
}

function logout() {
	alert("logout");
	
	var getparam = {
		action: 'accountlogout',
		data: {
			
		}
	}
	
	$.get(url, getparam, alert_account);
}