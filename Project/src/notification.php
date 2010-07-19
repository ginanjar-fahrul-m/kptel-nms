<?php

/* File   : notification.php
 * Role   : Model (MVC)
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * Model ini mengurus semua hal yang berkaitan dengan informasi
 * notifikasi yang berasal dari Cacti.
 *
 * Catatan penting:
 * Kecuali disebutkan secara spesifik, kata 'database' mengacu kepada
 * database aplikasi MASEMON.
 */

require_once('includes/config.php');
require_once('includes/database.php');

/* Nama Fungsi : notification_get_status
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan notifikasi status device
 *   yang terdaftar di peta.
 * Parameter   : Tidak ada.
 */
function notification_get_status() {
	global $config;
	
	$conn_cacti = database_new_connection_cacti();
	$conn_cacti->open();
	
	$conn_app = database_new_connection_app();
	$conn_app->open();
	
	$sql = "SELECT
				`cacti_id`
			FROM `".$config['db']['app']['database']."`.`device`";
	$result = $conn_app->query($sql);
	
	$cacti_id = array();
	while($row = mysql_fetch_assoc($result)) {
		$cacti_id[] = $row['cacti_id'];
	}
	
	if(count($cacti_id) > 0) {
		$cond = implode(' OR `id` = ', $cacti_id);
		$cond = '(`id` = '.$cond.')';
	} else {
		$cond = 'FALSE';
	}
	
	$sql = "SELECT 
				`id`,
				`description`,
				`hostname`,
				`monitor`,
				`status`,
				`status_fail_date`,
				`status_rec_date`,
				`status_last_error`,
				`availability`,
				`cur_time`
			FROM `".$config['db']['cacti']['database']."`.`host`
			WHERE
				NOT(`status` = 3) AND
				`disabled` = '' AND
				`monitor` = 'on' AND
				".$cond."
			ORDER BY `status_fail_date` DESC, `status` ASC";
	$result = $conn_cacti->query($sql);
	
	$notifications = array();
	while($row = mysql_fetch_assoc($result)) {
		$notifications[] = $row;
	}
	
	$conn_cacti->close();
	$conn_app->close();
	
	return $notifications;
}

/* Nama Fungsi : notification_get_status
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan notifikasi threshold
 *   device yang terdaftar di peta.
 * Parameter   : Tidak ada.
 */
function notification_threshold_status() {
	global $config;
	
	$conn_cacti = database_new_connection_cacti();
	$conn_cacti->open();
	
	$conn_app = database_new_connection_app();
	$conn_app->open();
	
	$sql = "SELECT
				`cacti_id`
			FROM `".$config['db']['app']['database']."`.`device`";
	$result = $conn_app->query($sql);
	
	$cacti_id = array();
	while($row = mysql_fetch_assoc($result)) {
		$cacti_id[] = $row['cacti_id'];
	}
	
	if(count($cacti_id) > 0) {
		$cond = implode(' OR `id` = ', $cacti_id);
		$cond = '(`id` = '.$cond.')';
	} else {
		$cond = 'FALSE';
	}
	
	$sql = "SELECT
				`host_id` AS `id`,
				`name`,
				`thold_hi`,
				`thold_low`,
				`lastread`
			FROM `".$config['db']['cacti']['database']."`.`thold_data`
			WHERE
				".$cond."
			ORDER BY `id` ASC";
	$result = $conn_cacti->query($sql);
	
	$notifications = array();
	while($row = mysql_fetch_assoc($result)) {
		$notifications[] = $row;
	}
	
	$conn_cacti->close();
	$conn_app->close();
	
	return $notifications;
}

?>