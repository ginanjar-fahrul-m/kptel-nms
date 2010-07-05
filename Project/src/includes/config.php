<?php

/* File   : config.php
 * Role   : Support File
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * File ini mendefinisikan semua variabel global yang akan dipakai
 * di seluruh aplikasi.
 */

/* Variabel konfigurasi koneksi database MySQL. */
$config['db']['hostname'] = '10.37.21.245';			// Alamat server MySQL.
$config['db']['username'] = 'kptel';				// Username akses MySQL.
$config['db']['password'] = 'kptel';				// Password akses MySQL.
$config['db']['app_db'] = 'appsMonitor';			// Nama database untuk aplikasi [KPTEL].
$config['db']['cacti_db'] = 'cacti';				// Nama database untuk aplikasi Cacti.

/* Variabel yang berkaitan dengan aplikasi Cacti. */
$config['cacti']['url'] = "http://10.32.18.200";	// Alamat URL untuk aplikasi Cacti.

/* Variabel yang berkaitan dengan session. */
$config['session']['prefix']  = 'kptel-nms-';		// Prefiks untuk setiap nama session yang digunakan dalam aplikasi ini untuk mencegah munculnya konflik nama variabel session.
$config['session']['db_sess'] = 'db_sess';			// Nama session untuk variabel penyimpanan informasi koneksi database.

/* Variabel yang berkaitan dengan fungsi-fungsi. */
$config['function']['return']['fail']    = 0;		// Return value untuk kasus 'gagal'.
$config['function']['return']['success'] = 1;		// Return value untuk kasus 'sukses'.

?>