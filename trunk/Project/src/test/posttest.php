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
	<title>Testing KPTEL-NMS</title>
	<link type="text/css" href="../css/custom-theme/jquery-ui-1.8.2.custom.css" rel="stylesheet" />	
	<link type="text/css" href="../css/style.css" media="screen" rel="stylesheet" />
	<style type="text/css">
		body{
			background: #555; color:#fff;
		}
		h3{
			margin-left : 10px;
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
<div class="testbody">
	<h1>MASEMON(Map-Assisted Network Element Monitoring)</h1>
<?php
	if(isset($_POST['posttest'])){
		$conn = mysql_connect('127.0.0.1','appmonitor','telkom',true);
		mysql_select_db('appmonitor_test',$conn);
		$querypre = "UPDATE result
					SET
						skenariouji = ".cekint($_POST['skenariouji']).",
						skenarioujifeed1 = '".safestr($_POST['skenarioujifeed1'])."',
						errormsg = ".cekint($_POST['errormsg']).",
						errormsgfeed2 = '".safestr($_POST['errormsgfeed2'])."',
						errormsgfeed3 = '".safestr($_POST['errormsgfeed3'])."',
						functionfeed = '".safestr($_POST['functionfeed'])."',
						looksmenu = ".cekint($_POST['looksmenu']).",
						menufeed = ".cekint($_POST['menufeed']).",
						looksform = ".cekint($_POST['looksform']).",
						formfeed = '".safestr($_POST['formfeed'])."',
						looksall = ".cekint($_POST['looksall']).",
						looksallfeed = '".safestr($_POST['looksallfeed'])."',
						color = ".cekint($_POST['color']).",
						colorfeed1 = '".safestr($_POST['colorfeed1'])."',
						looksfeed = '".safestr($_POST['looksfeed'])."',
						easyuse = ".cekint($_POST['easyuse']).",
						easyusefeed1 = '".safestr($_POST['easyusefeed1'])."',
						easyusefeed2 = '".safestr($_POST['easyusefeed2'])."',
						helpuse = ".cekint($_POST['helpuse']).",
						recognize = ".cekint($_POST['recognize']).",
						recognizefeed1 = '".safestr($_POST['recognizefeed1'])."',
						easyfeed = '".safestr($_POST['easyfeed'])."'
					WHERE 
						testername = '".$_SESSION['testkptel']."'
					";
		$respost = mysql_query($querypre,$conn);
		if($respost == 1){
			echo '<p>Feedback berhasil ditambahkan, kami akan coba perbaiki bagian yang Anda anggap masih kurang</p>';
		}
		mysql_close();
	}else{
		?>
		<h2>POST-TEST</h2>
		<?php  
			if(isset($_SESSION['testkptel'])){
		?>
		<p>Terima kasih telah mencoba semua skenario uji yang telah kami siapkan. Setelah melakukan tahapan testing, Anda kami mohon untuk mengisi form feedback dibawah ini untuk menjadi masukan kami pada tahapan perbaikan aplikasi.</p>
		<h3>Fungsionalitas</h3>
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
		<ol>
			<li> Apakah semua skenario uji yang Anda kerjakan sudah berjalan dengan baik?<br>
				<input type="radio" name="skenariouji" value="3" /> semua skenario berjalan baik<br>
				<input type="radio" name="skenariouji" value="2" /> error semua<br>
				<input type="radio" name="skenariouji" value="1" /> ada yang error, yaitu nomor<br>
				<textarea name="skenarioujifeed1"></textarea></li>
			<li> Apakah ketika gagal melakukan suatu pekerjaan telah diberikan pesan error dengan cukup jelas?<br>
				<input type="radio" name="errormsg" value="4" /> cukup jelas<br>
				<input type="radio" name="errormsg" value="3" /> beberapa tidak jelas, yaitu ...<br>
				<textarea name="errormsgfeed3"></textarea><br>
				<input type="radio" name="errormsg" value="2" /> beberapa tidak ada pesan error, yaitu ...<br>
				<textarea name="errormsgfeed2"></textarea><br>
				<input type="radio" name="errormsg" value="1" /> tidak ada pesan error</li>
			<li> Berikan saran untuk aplikasi ini dari segi fungsionalitas <br>
				<textarea name="functionfeed"></textarea></li>
		</ol>
		<h3>Penampilan</h3>
		<ol>
			<li> Menubar<br>
				Beri nilai antara 1-5 untuk tampilan dari menubar<br>
				<input type="radio" name="looksmenu" value="5" /> 5(sangat baik)<br>
				<input type="radio" name="looksmenu" value="4" /> 4(baik)<br>
				<input type="radio" name="looksmenu" value="3" /> 3(cukup)<br>
				<input type="radio" name="looksmenu" value="2" /> 2(kurang)<br>
				<input type="radio" name="looksmenu" value="1" /> 1(tidak baik)<br>
				komentar<br>
				<textarea name="menufeed"></textarea></li>
			<li> Boxform<br>
				Beri nilai antara 1-5 untuk tampilan dari kotak form<br>
				<input type="radio" name="looksform" value="5" /> 5(sangat baik)<br>
				<input type="radio" name="looksform" value="4" /> 4(baik)<br>
				<input type="radio" name="looksform" value="3" /> 3(cukup)<br>
				<input type="radio" name="looksform" value="2" /> 2(kurang)<br>
				<input type="radio" name="looksform" value="1" /> 1(tidak baik)<br>
				komentar<br>
				<textarea name="formfeed"></textarea></li>
			<li> Tampilan keseluruhan<br>
				Beri nilai antara 1-5 untuk tampilan keseluruhan<br>
				<input type="radio" name="looksall" value="5" /> 5(sangat baik)<br>
				<input type="radio" name="looksall" value="4" /> 4(baik)<br>
				<input type="radio" name="looksall" value="3" /> 3(cukup)<br>
				<input type="radio" name="looksall" value="2" /> 2(kurang)<br>
				<input type="radio" name="looksall" value="1" /> 1(tidak baik)<br>
				komentar<br>
				<textarea name="looksallfeed"></textarea></li>
			<li> Apakah pemilihan warna theme aplikasi sudah cukup enak dipandang?<br>
				<input type="radio" name="color" value="2" /> cukup<br>
				<input type="radio" name="color" value="1" /> kurang, yakni pada bagian ...<br>
				<textarea name="colorfeed1"></textarea></li>
			<li> Berikan saran untuk aplikasi ini dari segi penampilan <br>
				<textarea name="looksfeed"></textarea></li>
		</ol>
		<h3>Kemudahan Penggunaan</h3>
		<ol>
			<li> Apakah Anda dengan mudah menjalankan suatu operasi?<br>
				<input type="radio" name="easyuse" value="3" /> mudah<br>
				<input type="radio" name="easyuse" value="2" /> membingungkan, yakni pada bagian ...<br>
				<textarea  name="easyusefeed2"></textarea><br>
				<input type="radio" name="easyuse" value="1" /> sulit, yakni pada bagian ...<br>
				<textarea name="easyusefeed1"></textarea></li>
				<li> Dalam testing yang telah Anda lakukan, berapa kali Anda menekan tombol bantuan 'Help'?<br>
				<input type="radio" name="helpuse" value="3" /> Lebih dari 3 kali<br>
				<input type="radio" name="helpuse" value="2" /> Antara 1-3 kali<br>
				<input type="radio" name="helpuse" value="1" /> Tidak Pernah</li>
			<li> Apakah Anda dapat dengan mudah mengenali keterkaitan simbol dengan fungsi yang ada pada aplikasi ini?<br>
				<input type="radio" name="recognize" value="2" /> mudah<br>
				<input type="radio" name="recognize" value="1" /> sulit, yakni pada bagian ...<br>
				<textarea name="recognizefeed1"></textarea></li>
			<li> Berikan saran untuk aplikasi ini dari segi kemudahan <br>
				<textarea name="easyfeed"></textarea></li>
		</ol>

		<input type="submit" value="Akhiri Test" name="posttest">
		</form>
		<?php
			}else{
				echo '<p>Maaf, Silakan memulai test dari <a href=".">sini</a></p>';
			}
	}
?>
</div>
</body>
</html>