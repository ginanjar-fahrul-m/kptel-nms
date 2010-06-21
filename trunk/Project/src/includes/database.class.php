<?php

/** database.class.php
 * Class wrapper untuk fungsi-fungsi database (MySQL)
 */

class Connection {
	private $log_prefix = "[DATABASE]";
	
	private $db_hostname = null;
	private $db_username = null;
	private $db_password = null;
	private $db_database = null;
	
	private $db_connection = null;
	private $is_connected = false;
	
	// Class constructor
	// Mengisi atribut-atribut penting untuk melakukan koneksi ke database server
	public function __construct($_db_hostname, $_db_username, $_db_password, $_db_database) {
		$this->db_hostname = $_db_hostname;
		$this->db_username = $_db_username;
		$this->db_password = $_db_password;
		$this->db_database = $_db_database;
	}
	
	// Method open
	// Membuka koneksi menuju ke database server
	public function open() {
		if($this->is_connected) {
			echo "$this->log_prefix Error: Already connected. Cannot open new connection.\n";
		} else {
			$this->db_connection = mysql_connect(
										$this->db_hostname,
										$this->db_username,
										$this->db_password,
										true
									);
			mysql_select_db($this->db_database, $this->db_connection);
			
			if(!$this->db_connection) {
				echo "$this->log_prefix Error: ".mysql_error."\n";
			} else {
				$this->is_connected = true;
			}
		}
	}
	
	// Method close
	// Menutup koneksi ke database server
	public function close() {
		if(!$this->is_connected) {
			echo "$this->log_prefix Error: No connection has been established to the database. Cannot close connection.\n";
		} else {
			mysql_close($this->db_connection);
			$is_connected = false;
		}
	}
	
	public function query($query_string) {
		$res = mysql_query($query_string);
		return $res;
	}
}

?>