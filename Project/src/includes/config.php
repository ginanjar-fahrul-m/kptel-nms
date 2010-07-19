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
$config['db']['app']['hostname'] = '10.37.22.194';	        // Alamat server MySQL.
$config['db']['app']['username'] = 'appmonitor';           // Username akses MySQL.
$config['db']['app']['password'] = 'telkom';				// Password akses MySQL.
$config['db']['app']['database'] = 'appmonitor';             // Nama database untuk aplikasi MASEMON.

$config['db']['cacti']['hostname'] = '10.37.22.194';	        // Alamat server MySQL.
$config['db']['cacti']['username'] = 'appmonitor';           // Username akses MySQL.
$config['db']['cacti']['password'] = 'telkom';				// Password akses MySQL.
$config['db']['cacti']['database'] = 'cacti';             // Nama database untuk Cacti.

/* Variabel yang berkaitan dengan aplikasi Cacti. */
$config['cacti']['url'] = "http://10.37.22.194/cacti";    // Alamat URL untuk aplikasi Cacti.

/* Variabel yang berkaitan dengan session. */
$config['session']['prefix']  = 'kptel-nms-';       // Prefiks untuk setiap nama session yang digunakan dalam aplikasi ini untuk mencegah munculnya konflik nama variabel session.

/* Variabel yang berkaitan dengan fungsi-fungsi. */
$config['function']['return']['failure'] = 0;       // Return value untuk kasus 'gagal'.
$config['function']['return']['success'] = 1;       // Return value untuk kasus 'sukses'.

?>