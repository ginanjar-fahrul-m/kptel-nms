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
	
	$conn = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);
	$conn->open();
	
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
	
	$retval = $config['function']['return']['failure'];
	if($conn->query($sql)) {
		$retval = $conn->get_last_insert_id();;
	}
	
	$conn->close();
	
	return $retval;
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
	
	$conn = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);
	$conn->open();
	
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
	
	$retval = $config['function']['return']['failure'];
	if($conn->query($sql)) {
		$retval = $config['function']['return']['success'];
	}
	
	$conn->close();
	
	return $retval;
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
	
	$conn = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);
	$conn->open();
	
	$group_id = mysql_real_escape_string($group_id);
	
	$retval = $config['function']['return']['failure'];
	
	// Delete children devices
	$sql = "DELETE FROM `".$config['db']['app_db']."`.`device`
			WHERE `group_id` = ".$group_id;
	if(!$conn->query($sql)) {
		return $retval;
	}
	
	// Recursively delete children groups
	$sql = "SELECT `group_id`
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `parent_id` = ".$group_id;
	if(!$result = $conn->query($sql)) {
		return $retval;
	}
	
	while($data = mysql_fetch_assoc($result)) {
		group_delete($data['group_id']);
	}
	
	// Finally, delete parent group
	$sql = "DELETE FROM `".$config['db']['app_db']."`.`group`
			WHERE `group_id` = ".$group_id;
	
	if($conn->query($sql)) {
		$retval = $config['function']['return']['success'];
	}
	
	$conn->close();
	
	return $retval;
}

/* status: ok
 * tester: jiwo
 */
function group_get($group_id) {
	global $config;
	
	$conn = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);
	$conn->open();
	
	$group_id = mysql_real_escape_string($group_id);
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `group_id` = ".$group_id;
	$result = $conn->query($sql);
	
	$conn->close();
	
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
	
	$conn = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);
	$conn->open();
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			ORDER BY `name` ASC";
	$result = $conn->query($sql);
	
	$group_list = array();
	while($row = mysql_fetch_assoc($result)) {
		$group_list[] = $row;
	}
	
	$conn->close();
	
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
	
	$conn = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);
	$conn->open();
	
	$group_id = mysql_real_escape_string($group_id);
	
	$forbidden_list = group_get_impossible_parent_list_recursive($group_id);
	
	$group_list = array();
	
	$sql = "SELECT *
			FROM `".$config['db']['app_db']."`.`group`
			ORDER BY `name` ASC";
	$result = $conn->query($sql);
	
	while($row = mysql_fetch_assoc($result)) {
		if(!in_array($row['group_id'], $forbidden_list)) {
			$group_list[] = $row;
		}
	}
	
	$conn->close();
	
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
	
	$conn = new Connection($config['db']['hostname'], $config['db']['username'], $config['db']['password'], $config['db']['app_db']);
	$conn->open();
	
	$group_id = mysql_real_escape_string($group_id);
	
	$group_list = array();
	$group_list[] = $group_id;
	
	$sql = "SELECT `group_id`
			FROM `".$config['db']['app_db']."`.`group`
			WHERE `parent_id` = ".$group_id."
			ORDER BY `group_id` ASC";
	$result = $conn->query($sql);
	
	if($conn->num_rows($result) > 0) {
		while($row = mysql_fetch_assoc($result)) {
			$group_list = array_merge($group_list, group_get_impossible_parent_list_recursive($row['group_id']));
		}
	}
	
	$conn->close();
	
	return $group_list;
}

?>