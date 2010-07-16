<?php 
session_start(); 

	function safestr($str){
		if($str == '') $safestr = '';
		else $safestr = mysql_real_escape_string($str);
		return $safestr;
	}
	function cekint($int){
		if($int == '') $safeint = null;
		else $safeint = $int;
		return $safeint;
	}
?>
<html>
<head>
<title>Testing KPTEL-NMS</title>
</head>
<body>
<?php

	if($_POST['testername']&&$_POST['pretest']){
		$_SESSION['testkptel'] = $_POST['testername'];
		
		$conn = mysql_connect('127.0.0.1','appmonitor','telkom',true);
		mysql_select_db('appmonitor_test',$conn);
		
		
		$querypre = "INSERT INTO result(
										testername,
										appmonitor,
										appmonitortext,
										appgoogle,
										appgoogletext
									)
					VALUES (
								'".safestr($_POST['testername'])."',
								".cekint($_POST['appmonitor']).",
								'".safestr($_POST['appmonitortext'])."',
								".cekint($_POST['appgoogle']).",
								'".safestr($_POST['appgoogletext'])."'
							)";
		$respre = mysql_query($querypre,$conn);
		if($respre == 1){
			echo 'success';
			echo '<META HTTP-EQUIV="Refresh" CONTENT="0.2;URL=../.">';
		}
		mysql_close();
	}
?>

<h1>MAS EMON(Map-Asisted Element Monitoring)</h1>
<?php  
	if(!isset($_SESSION['testkptel'])){
?>
<h1>Testing Overview </h1>
<p>Pertama-tama kami ucapkan terima kasih atas kesediaan Anda dalam berpartisipasi dalam pengujian aplikasi ini. Dalam tahap pengujian setiap user akan melakukan tiga tahap pekerjaan. Hal pertama yang akan Anda lakukan adalah melakukan pre-test dengan menjawab beberapa pertanyaan. Selanjutnya Anda akan diberikan sejumlah skenario uji untuk diuji apakah berhasil atau tidak. Setelah selesai melakukan semua skenario uji, klik link pada nomor skenario uji terakhir untuk masuk ke tahapan selanjutnya. Tahapan selanjutnya adalah menjawab form feedback dari link yang telah dipilih. Ketika selesai menjawab semua pertanyaan dapat mengakhirnya pada tombol di akhir halaman.</p>

<h1>PRE-TEST</h1>
<p>Tes awal ini ditujukan untuk mengetahui background Anda sebagai penguji yang berkaitan dengan aplikasi ini.</p>

<form action='<?php echo $_SERVER['PHP_SELF']; ?>' method='post'>
Nama Penguji <input type="text" name="testername">
<ol>
	<li> Apakah Anda pernah menggunakan aplikasi monitoring sebelumnya?<br>
		<input type="radio" name="appmonitor" value="1" /> Sudah, yaitu ...<br>
		<input type="text" name="appmonitortext" /><br>
		<input type="radio" name="appmonitor" value="0" /> Belum Pernah</li>
	<li> Apakah Anda pernah menggunakan aplikasi seperti google maps atau semacamnya?<br>
		<input type="radio" name="appgoogle" value="1" /> Sudah, yaitu ...<br>
		<input type="text" name="appgoogletext" /><br>
		<input type="radio" name="appgoogle" value="0" /> Belum Pernah</li>
</ol>
<input type="submit" name="pretest" value="Mulai Test">
</form>
<?php
	}else{
		echo 'Terima kasih, '.$_SESSION['testkptel'].', telah berpartisipasi dalam testing aplikasi ini';
	}
?>
</body>
</html>
