<?php

/* File   : group.php
 * Role   : Model (MVC)
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * Model ini mengurus semua hal yang berkaitan dengan data-data group
 * dari database aplikasi.
 *
 * Catatan penting:
 * Kecuali disebutkan secara spesifik, kata 'database' mengacu kepada
 * database aplikasi [KPTEL].
 */

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

/* Nama Fungsi : group_add
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menambahkan group baru ke database.
 * Parameter   :
 *   parent_id           ID group parent.
 *   name                Nama group.
 *   description         Keterangan group.
 *   longitude           Derajat bujur barat/timur.
 *   latitude            Derajat lintang selatan/utara.
 */
function group_add($parent_id, $name, $description, $longitude, $latitude) {
	global $config;
	
	/* Never trust user input :P */
	$parent_id = mysql_real_escape_string($parent_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	
	$sql = "INSERT INTO `".$config['db']['app_db']."`.`group` (
				`parent_id`,
				`name`,
				`description`,
				`longitude`,
				`latitude`)
			VALUES (
				".$parent_id.",
				'".$name."',
				'".$description."', 
				".$longitude.",
				".$latitude.")";
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return session_get($config['session']['db_sess'])->get_last_insert_id();;
	} else {
		return 0;
	}
}

/* Nama Fungsi : group_update
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mengedit informasi group di database.
 * Parameter   :
 *   group_id            ID group yang akan diedit.
 *   parent_id           ID group parent.
 *   name                Nama group.
 *   description         Keterangan group.
 *   longitude           Derajat bujur barat/timur.
 *   latitude            Derajat lintang selatan/utara.
 */
function group_update($group_id, $parent_id, $name, $description, $longitude, $latitude) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	$parent_id = mysql_real_escape_string($parent_id);
	$name = mysql_real_escape_string($name);
	$description = mysql_real_escape_string($description);
	$longitude = mysql_real_escape_string($longitude);
	$latitude = mysql_real_escape_string($latitude);
	
	$sql = "UPDATE `".$config['db']['app_db']."`.`group` 
			SET
				`group_id` = ".$group_id.",
				`parent_id` = ".$parent_id.",
				`name` = '".$name."',
				`description` = '".$description."',
				`longitude` = ".$longitude.",
				`latitude` = ".$latitude." 
			WHERE `group_id` = ".$group_id;
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return 1;
	} else {
		return 0;
	}
}

/* Nama Fungsi : group_delete
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menghapus group dan anak-anaknya
 *   di database.
 * Parameter   :
 *   group_id           ID group yang akan dihapus.
 */
function group_delete($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	// Delete children devices
	$sql = "DELETE FROM `".$config['db']['app_db']."`.`device`
			WHERE `group_id` = ".$group_id;
	if(!session_get($config['session']['db_sess'])->query($sql)) {
		return 0;
	}
	
	// Recursively delete children groups
	$sql = "SELECT `group_id`
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `parent_id` = ".$group_id;
	if(!$result = session_get($config['session']['db_sess'])->query($sql)) {
		return 0;
	}
	
	while($data = mysql_fetch_assoc($result)) {
		group_delete($data['group_id']);
	}
	
	// Finally, delete parent group
	$sql = "DELETE FROM `".$config['db']['app_db']."`.`group`
			WHERE `group_id` = ".$group_id;
	
	if(session_get($config['session']['db_sess'])->query($sql)) {
		return 1;
	} else {
		return 0;
	}
}

/* status: ok
 * tester: jiwo
 */
function group_get($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `group_id` = ".$group_id;
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	return mysql_fetch_assoc($result);
}

/* Nama Fungsi : group_get
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan informasi sebuah group.
 * Parameter   :
 *   group_id           ID group yang akan diambil.
 */
function group_get_all() {
	global $config;
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			ORDER BY `name` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	$i = 0;
	while($row = mysql_fetch_assoc($result)) {
		$group_list[$i] = $row;
		$i++;
	}
	
	return $group_list;
}

/* Nama Fungsi : group_get_possible_parent_list
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mendapatkan daftar group yang bisa
 *   dijadikan parent.
 * Parameter   :
 *   group_id           ID group yang akan diset parent ID-nya.
 */
function group_get_possible_parent_list($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	$forbidden_list = group_get_impossible_parent_list_recursive($group_id);
	
	$group_list = array();
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			ORDER BY `name` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	while($row = mysql_fetch_assoc($result)) {
		if(!in_array($row['group_id'], $forbidden_list)) {
			$group_list[] = $row;
		}
	}
	
	return $group_list;
}

/* Nama Fungsi : group_get_impossible_parent_list_recursive
 * Penjelasan  :
 *   Fungsi bantuan untuk fungsi group_get_possible_parent_list.
 * Parameter   :
 *   group_id           ID group yang akan dicari anak-anaknya.
 */
function group_get_impossible_parent_list_recursive($group_id) {
	global $config;
	
	$group_id = mysql_real_escape_string($group_id);
	
	$group_list = array();
	$group_list[] = $group_id;
	
	$sql = "SELECT `group_id`
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `parent_id` = ".$group_id."
			ORDER BY `group_id` ASC";
	$result = session_get($config['session']['db_sess'])->query($sql);
	
	if(session_get($config['session']['db_sess'])->num_rows($result) > 0) {
		while($row = mysql_fetch_assoc($result)) {
			$group_list = array_merge($group_list, group_get_possible_parent_list_recursive($row['group_id']));
		}
	}
	
	return $group_list;
}

?>