<?php

/* File   : sms-cron.php
 * Role   : Support file
 * Author : Adityo Jiwandono (jiwo)
 * E-Mail : jiwandono@arc.itb.ac.id
 * Team   : Mahasiswa Kerja Praktek Teknik Informatika
 *          Institut Teknologi Bandung, Juni - Juli 2010
 * 
 * Skrip ini dirancang untuk dijalankan secara periodik (via cron)
 * untuk mengambil pesan dari tabel SMS untuk kemudian dikirm
 * melalui SMS gateway.
 *
 * Skirp ini belum sepenuhnya diimplementasikan. Kekurangan
 * ada pada metode pengiriman ke SMS gateway.
 */

require_once('includes/config.php');
require_once('includes/database.php');

$conn = database_new_connection_app();
$conn->open();

$query = "SELECT *
		  FROM `".$config['db']['app']['database']."`.`sms`
		  WHERE `sent` = 'N'";
$result = $conn->query($query);

/* Blok pengiriman SMS -- belum diimplementasikan -- */
while($row = mysql_fetch_assoc($result)) {
	/* Kirim pesan melalui SMS gateway */
	echo 'Sending message #'.$row['sms_id'].': '.$row['message']."\n";
	
	/* Jika pengiriman berhasil, update field `sent` */
	$query_update = "UPDATE `".$config['db']['app']['database']."`.`sms`
					 SET `sent` = 'Y'
					 WHERE `sms_id` = ".$row['sms_id'];
	$conn->query($query_update);
}

$conn->close();

?>