<?php

/* File   : device.php
 * Role   : Model (MVC)
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * Model ini mengurus semua hal yang berkaitan dengan data-data device
 * baik dari database aplikasi maupun database Cacti.
 *
 * Catatan penting:
 * Kecuali disebutkan secara spesifik, kata 'database' mengacu kepada
 * database aplikasi [KPTEL].
 */

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

/* Nama Fungsi : device_add
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menambahkan device baru ke database.
 * Parameter   :
 *   group_id            ID group parent.
 *   device_type_id      ID tipe device.
 *   name                Nama device.
 *   description         Keterangan device.
 *   longitude           Derajat bujur barat/timur.
 *   latitude            Derajat lintang selatan/utara.
 *   cacti_id            ID host pada database Cacti.
 */
function device_add($group_id, $device_type_id, $name, $description, $longitude, $latitude, $cacti_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	$device_type_id = mysql_real_escape_string($device_type_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "INSERT INTO `".$config['db']['app_db']."`.`device` (
				`group_id`,
				`device_type_id`,
				`name`,
				`description`,
				`longitude`,
				`latitude`,
				`cacti_id`)
			VALUES (
				".$group_id.",
				".$device_type_id.",
				'".$name."',
				'".$description."', 
				".$longitude.",
				".$latitude.",
				".$cacti_id.")";
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return session_get($config['session']['db_sess'])->get_last_insert_id();
	} else {
		return $config['function']['return']['fail'];
	}
}

/* Nama Fungsi : device_update
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mengedit informasi device di database.
 * Parameter   :
 *   device_id           ID device yang akan diedit.
 *   group_id            ID group parent.
 *   device_type_id      ID tipe device.
 *   name                Nama device.
 *   description         Keterangan device.
 *   longitude           Derajat bujur barat/timur.
 *   latitude            Derajat lintang selatan/utara.
 *   cacti_id            ID host pada database Cacti.
 */
function device_update($device_id, $group_id, $device_type_id, $name, $description, $longitude, $latitude, $cacti_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	$group_id = mysql_real_escape_string($group_id);
	$device_type_id = mysql_real_escape_string($device_type_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "UPDATE `".$config['db']['app_db']."`.`device` 
			SET
				`group_id` = ".$group_id.",
				`device_type_id` = ".$device_type_id.",
				`name` = '".$name."',
				`description` = '".$description."',
				`longitude` = ".$longitude.",
				`latitude` = ".$latitude.",
				`cacti_id` = ".$cacti_id."
			WHERE `device_id` = ".$device_id;
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return $config['function']['return']['success'];
	} else {
		return $config['function']['return']['fail'];
	}
}

/* Nama Fungsi : device_delete
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menghapus device di database.
 * Parameter   :
 *   device_id           ID device yang akan dihapus.
 */
function device_delete($device_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	
	$sql = "DELETE FROM `".$config['db']['app_db']."`.`device`
			WHERE `device_id` = ".$device_id;
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return $config['function']['return']['success'];
	} else {
		return $config['function']['return']['fail'];
	}
}

/* Nama Fungsi : device_get
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi sebuah device.
 * Parameter   :
 *   device_id           ID device yang akan diambil.
 */
function device_get($device_id) {
	global $config;
	
	$device_id = mysql_real_escape_string($device_id);
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`device`
			WHERE `device_id` = ".$device_id;
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

/* Nama Fungsi : device_get_by_cacti_id
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi sebuah device
 *   berdasarkan atribut cacti_id.
 * Parameter   :
 *   cacti_id           ID cacti device yang akan diambil.
 */
function device_get_by_cacti_id($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`device`
			WHERE `cacti_id` = ".$cacti_id;
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	if($row = mysql_fetch_assoc($result)) {
		return $row;
	} else {
		return $config['function']['return']['fail'];
	}
}

/* Nama Fungsi : device_get_all
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi semua device.
 * Parameter   : Tidak ada.
 */
function device_get_all() {
	global $config;
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`device`
			ORDER BY `name` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$device_list[$i] = $row;
		$i++;
	}
	
	return $device_list;
}

/* Nama Fungsi : device_cacti_get
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi sebuah host
 *   dari database Cacti.
 * Parameter   :
 *   cacti_id            ID host di database Cacti
 */
function device_cacti_get($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
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
			FROM `".$config['db']['cacti_db']."`.`host`
			WHERE `id` = ".$cacti_id;
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

/* Nama Fungsi : device_cacti_get_all
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi semua host
 *   dari database Cacti.
 * Parameter   : Tidak ada.
 */
function device_cacti_get_all() {
	global $config;
	
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
			FROM `".$config['db']['cacti_db']."`.`host`
			ORDER BY `description` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$device_list[$i] = $row;
		$i++;
	}
	
	return $device_list;
}

/* Nama Fungsi : device_cacti_get_all_unlisted
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi semua host
 *   dari database Cacti yang belum dimasukkan ke tabel device.
 * Parameter   : Tidak ada.
 */
function device_cacti_get_all_unlisted() {
	global $config;
	
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
			FROM `".$config['db']['cacti_db']."`.`host`
			WHERE `id` NOT IN (
				SELECT `cacti_id` AS `id`
				FROM `".$config['db']['app_db']."`.`device`
			)
			ORDER BY `description` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$device_list[$i] = $row;
		$i++;
	}
	
	return $device_list;
}

/* Nama Fungsi : device_cacti_get_graph_list
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi semua grafik
 *   sebuah host yang ada di database Cacti.
 * Parameter   :
 *   cacti_id            ID host di database Cacti
 */
function device_cacti_get_graph_list($cacti_id) {
	global $config;
	
	$cacti_id = mysql_real_escape_string($cacti_id);
	
	$sql3 = "SELECT `description`
			FROM `".$config['db']['cacti_db']."`.`host`
			WHERE `id` = ".$cacti_id."
			LIMIT 1";
	$result3 = session_get($config['session']['db_sess'])->query($sql3);
	$row3 = mysql_fetch_assoc($result3);
		
	$graph_list['description'] = $row3['description'];
	
	$sql = "SELECT
				`graph_local`.`id` AS `local_graph_id`,
				`graph_templates`.`name`
			FROM
				`".$config['db']['cacti_db']."`.`graph_local`,
				`".$config['db']['cacti_db']."`.`graph_templates`
			WHERE
				`graph_local`.`graph_template_id` = `graph_templates`.`id`
				AND `graph_local`.`host_id` = ".$cacti_id."
			ORDER BY `graph_templates`.`name` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$graph_list['data'][$i] = $row;		
		$graph_list['data'][$i]['realtime_url'] = $config['cacti']['url'].'/plugins/realtime/graph_popup_rt.php?local_graph_id='.$row['local_graph_id'];
		
		$sql = "SELECT rra.id, rra.name
				FROM (
					`".$config['db']['cacti_db']."`.graph_templates_item,
					`".$config['db']['cacti_db']."`.data_template_data_rra,
					`".$config['db']['cacti_db']."`.data_template_rrd,
					`".$config['db']['cacti_db']."`.data_template_data,
					`".$config['db']['cacti_db']."`.rra
				)
				WHERE graph_templates_item.task_item_id = data_template_rrd.id
					AND data_template_rrd.local_data_id = data_template_data.local_data_id
					AND data_template_data.id = data_template_data_rra.data_template_data_id
					AND data_template_data_rra.rra_id = rra.id
					AND graph_templates_item.local_graph_id = ".$row['local_graph_id']."
				GROUP BY rra.id
				ORDER BY rra.timespan";
		$result2 = session_get($config['session']['db_sess'])->query($sql);
		
		$j = 0;
		while($row2 = mysql_fetch_assoc($result2)) {
			$rra['url'] = $config['cacti']['url'].'/graph_image.php?action=view&local_graph_id='.$row['local_graph_id'].'&rra_id='.$row2['id'];
			$rra['name'] = $row2['name'];
			$graph_list['data'][$i]['rra_url'][$j] = $rra;
			$j++;
		}
		
		$i++;
	}
	
	return $graph_list;
}

?>