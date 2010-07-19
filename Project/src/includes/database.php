<?php

/* File   : session.php
 * Role   : Support File
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * File ini berisi fungsi-fungsi pendukung untuk mempermudah operasi
 * session dalam aplikasi.
 */

require_once('config.php');
require_once('connection.class.php');

/* Nama Fungsi : database_new_connection_app
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menginstansiasi object Connection, untuk koneksi ke database MASEMON.
 * Parameter   : Tidak ada.
 */
function database_new_connection_app() {
	global $config;
	
	return new Connection($config['db']['app']['hostname'], $config['db']['app']['username'], $config['db']['app']['password'], $config['db']['app']['database']);
}

/* Nama Fungsi : database_new_connection_app
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menginstansiasi object Connection, untuk koneksi ke database Cacti.
 * Parameter   : Tidak ada.
 */
function database_new_connection_cacti() {
	global $config;
	
	return new Connection($config['db']['cacti']['hostname'], $config['db']['cacti']['username'], $config['db']['cacti']['password'], $config['db']['cacti']['database']);
}

?>