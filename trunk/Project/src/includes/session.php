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

/* Nama Fungsi : session_init
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menginisialisasi session supaya
 *   session dapat digunakan untuk suatu halaman PHP. Fungsi
 *   ini harus dipanggil di awal script.
 * Parameter   : Tidak ada.
 */
function session_init() {
	session_start();
}

/* Nama Fungsi : session_set
 * Penjelasan  :
 *   Fungsi ini digunakan untuk melakukan assignment terhadap
 *   sebuah variabel session. Memanggil fungsi ini sama dengan
 *   mengeset variabel global $_SESSION dengan nama variabel
 *   yang sudah diawali dengan prefiks yang ada di file config.php.
 * Parameter   :
 *   index               Nama variabel session.
 *   content             Isi variabel.
 */
function session_set($name, $content) {
	global $config;
	
	$_SESSION[$config['session']['prefix'].$name] = $content;
}

/* Nama Fungsi : session_get
 * Penjelasan  :
 *   Fungsi ini digunakan untuk mengambil isi dari sebuah variabel
 *   session. Memanggil fungsi ini sama dengan mengakses variabel
 *   global $_SESSION dengan nama variabel yang sudah diawali dengan
 *   prefiks yang ada di file config.php.
 * Parameter   :
 *   name                Nama variabel session.
 */
function session_get($name) {
	global $config;
	
	if(isset($_SESSION[$config['session']['prefix'].$name])) {
		return $_SESSION[$config['session']['prefix'].$name];
	} else {
		return false;
	}
}

/* Nama Fungsi : session_del
 * Penjelasan  :
 *   Fungsi ini digunakan untuk menghapus sebuah variabel session.
 *   Memanggil fungsi ini sama dengan melakukan 'unset' terhadap
 *   variabel dalam $_SESSION dengan nama variabel yang sudah diawali
 *   dengan prefix yang ada di file config.php.
 * Parameter   :
 *   name                Nama variabel session.
 */
function session_del($name) {
	global $config;
	
	unset($_SESSION[$config['session']['prefix'].$name]);
}

?>