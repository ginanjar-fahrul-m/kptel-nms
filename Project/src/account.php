<?php

/* File   : account.php
 * Role   : Model (MVC)
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * Model ini mengurus semua hal yang user account terutama urusan
 * otentikasi. Database user yang digunakan adalah database user
 * aplikasi.
 *
 * Catatan penting:
 * Kecuali disebutkan secara spesifik, kata 'database' mengacu kepada
 * database aplikasi MASEMON.
 * Password di-hash menggunakan MD5, tanpa salt.
 */

require_once('includes/config.php');
require_once('includes/database.php');
require_once('includes/session.php');

/* Nama Fungsi : account_login
 * Penjelasan  :
 *   Fungsi ini digunakan untuk otentikasi user masuk ke sistem.
 * Parameter   :
 *   username            Username user.
 *   password            Password user.
 */
function account_login($username, $password) {
	global $config;
	
	$conn = database_new_connection_app();
	$conn->open();
	
	$username = mysql_real_escape_string($username);
	$password = mysql_real_escape_string($password);
	$hash = md5($password);
	
	$sql = "SELECT *
			FROM `".$config['db']['app']['database']."`.`user`
			WHERE `username` = '".$username."' AND `password` = '".$hash."'
			LIMIT 1";
	
	$retval = $config['function']['return']['failure'];
	if($result = $conn->query($sql)) {
		if($row = mysql_fetch_assoc($result)) {
			session_set('userid', $row['user_id']);
			session_set('username', $username);
			session_set('hash', $hash);
			
			$retval = $config['function']['return']['success'];
		}
	}
	
	$conn->close();
	
	return $retval;
}

/* Nama Fungsi : account_logout
 * Penjelasan  :
 *   Fungsi ini digunakan mengeluarkan user dari sistem.
 * Parameter   : Tidak ada.
 */
function account_logout() {
	session_del('username');
	session_del('hash');
	
	return $config['function']['return']['success'];
}

/* Nama Fungsi : account_is_logged_in
 * Penjelasan  :
 *   Fungsi ini digunakan untuk memeriksa apakah user sudah login.
 * Parameter   : Tidak ada.
 */
function account_is_logged_in() {
	global $config;
	
	$retval = $config['function']['return']['failure'];
	if(session_get('username') && session_get('hash')) {
		$retval = $config['function']['return']['success'];
	}
	
	return $retval;
}

?>