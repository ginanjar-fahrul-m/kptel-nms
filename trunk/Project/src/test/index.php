<?php 
session_start(); 

	function safestr($str){
		if($str == '') $safestr = '';
		else $safestr = mysql_real_escape_string($str);
		return $safestr;
	}
	function cekint($int){
		if($int == '') $safeint = -1;
		else $safeint = $int;
		return $safeint;
	}
?>
<html>
	<head>
		<title>Testing</title>
		<link type="text/css" href="../css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />	
		<link type="text/css" href="../css/style.css" media="screen" rel="stylesheet" />
		<style type="text/css">
			body{
				background: #555; color:#fff;
			}
			h2{
				color : #ffffaa;
				margin-left : 10px;
			}
			h1{
				color : #ffff00;
				text-align: center;
			}
			.input-submit{
				text-align: center;
			}
			.testbody{
				max-width: 580px;
				overflow: auto;
			}
			.testblock{
				padding: 10px;
				text-align: justify;
			}
			p{
				margin :10px;
				text-align: justify;
			}
		</style>
	</head>
	<body>
	<?php
	
	if(isset($_POST['testername'])&&isset($_POST['pretest'])){
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
			echo '<META HTTP-EQUIV="Refresh" CONTENT="0.2;URL='.$_SERVER['PHP_SELF'].'">';
		}
		mysql_close();
	}
	?>
	<div class="testbody">
	<h1>MASEMON(Map-Assisted Network Element Monitoring)</h1>
	<?php  
		if(!isset($_SESSION['testkptel'])){
	?>
	<div class="testblock">
	<h2>Testing Overview </h2>
	<p>Pertama-tama kami ucapkan terima kasih atas kesediaan Anda dalam berpartisipasi dalam pengujian aplikasi ini. Dalam tahap pengujian setiap user akan melakukan tiga tahap pekerjaan. Hal pertama yang akan Anda lakukan adalah melakukan pre-test dengan menjawab beberapa pertanyaan. Selanjutnya Anda akan diberikan sejumlah skenario uji untuk diuji apakah berhasil atau tidak. Setelah selesai melakukan semua skenario uji, klik link pada nomor skenario uji terakhir untuk masuk ke tahapan selanjutnya. Tahapan selanjutnya adalah menjawab form feedback dari link yang telah dipilih. Ketika selesai menjawab semua pertanyaan dapat mengakhirnya pada tombol di akhir halaman.</p>
	</div>
	<div class="testblock">
	<h2>PRE-TEST</h2>
	<p>Tes awal ini ditujukan untuk mengetahui background Anda sebagai penguji yang berkaitan dengan aplikasi ini.</p>

	<form action='<?php echo $_SERVER['PHP_SELF']; ?>' method='post'>
	Nama Penguji <input type="text" name="testername">
	<ol>
		<li> Apakah Anda pernah menggunakan aplikasi monitoring sebelumnya?<br>
			<input type="radio" name="appmonitor" value="1" /> Sudah, yaitu ...
			<input type="text" name="appmonitortext" /><br>
			<input type="radio" name="appmonitor" value="0" /> Belum Pernah</li>
		<li> Apakah Anda pernah menggunakan aplikasi seperti google maps atau semacamnya?<br>
			<input type="radio" name="appgoogle" value="1" /> Sudah, yaitu ...
			<input type="text" name="appgoogletext" /><br>
			<input type="radio" name="appgoogle" value="0" /> Belum Pernah</li>
	</ol>
	<input id="input-submit" type="submit" name="pretest" value="Mulai Test">
	</form>
	</div>
	<?php
		}else{
			echo '';?>
		<p>Terima kasih, <?php echo $_SESSION['testkptel'];?>, telah berpartisipasi dalam testing aplikasi ini. Selanjutnya Anda kami minta untuk mengikuti skenario pengujian berikut. Baca `Getting Started` pada menu `help` terlebih dahulu untuk memudahkan pengujian. Jika Anda menemui kesulitan, menu help dapat Anda gunakan sewaktu-waktu.
		<ol>
			<li>Login (user: masemon, pass:emon)</li>
			<li>Tambahkan group pada root(Jika sudah login, klik kanan pada peta, add group, isi form dengan parent none)</li>
			<li>Tambahkan device pada root(Jika sudah login, klik kanan pada peta, add device, isi form dengan parent none)</li>
			<li>Tambahkan group pada salah satu group(Jika sudah login, klik kanan pada peta, add group, isi form dengan parent group lain)</li>
			<li>Tambahkan device pada salah satu group(Jika sudah login, klik kanan pada peta, add device, isi form dengan parent group lain)</li>
			<li>Manipulasi group: ganti nama, parent, dan lokasi(Klik kanan pada group yang ingin diedit, ubah nama, parent, dan lokasinya)</li>
			<li>Manipulasi device: ganti nama, parent, dan lokasi(Klik kanan pada device yang ingin diedit, ubah nama, parent, dan lokasinya)</li>
			<li>Hapus group kosong(Klik kanan pada group yang ingin didelete untuk mendelete)</li>
			<li>Hapus group yang memiliki `child`(Klik kanan pada group yang menjadi parent bagi group lain)</li>
			<li>Hapus device</li>
			<li>Melihat informasi group: klik icon group pada peta</li>
			<li>Melihat informasi device: klik icon device pada peta</li>
			<li>Melihat detail device: klik `show detail` pada device</li>
			<ul>
				<li>Coba login ke cacti (user: admin, pass: admin)</li>
				<li>Melihat grafik monitoring device dengan berbagai tipe monitoring</li>
			</ul>
			<li>Menggunakan menu "group dan device tree"</li>
			<ul>
				<li>Cek lokasi group: klik pada salah satu group</li>
				<li>Cek lokasi device: klik pada salah satu device</li>
			</ul>
			<li>Menggunakan menu "notifications"</li>
			<ul>
				<li>Cek keberadaan device bermasalah: klik pada salah satu device bermasalah</li>
			</ul>
			<li>Mengganti jenis tampilan peta</li>
			<li>Masuk ke halaman cacti: pilih menu `Go to cacti`</li>
			<li>Kembali ke halaman awal: pilih menu `Home`</li>
			<li>Jika semua skenario pengujian sudah dilakukan, <a href="posttest.php">silakan klik disini</a></li>
		</ol>
	<?php
		}
	?>
	</div>
	</body>
</html>