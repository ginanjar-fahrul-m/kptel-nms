<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');

class Account {
	public $user_id;
	public $username;
	public $fullname;
	public $email;
	public $password;

	public function __construct($_username, $_password){
		$this->username = $_username;
		$this->password = $_password;
	}
	
	public function add() {
		$sql = "INSERT INTO `user` (
									username, 
									fullname, 
									email, 
									password)
				VALUES (
						'".$this->username."',
						'".$this->fullname."', 
						'".$this->email."',
						'".sha1($this->password)."')";
		if (!mysql_query($sql))
		{
			die('Error: ' . mysql_error());
		}
	}
	
	public function update() {
		$sql = "UPDATE user 
				SET username = '".$this->username."', fullname = '".$this->fullname."', 
								email = '".$this->email."', password = '".sha1($this->password)."' 
				WHERE device_id = ".$this->user_id;
		if (!mysql_query($sql))
		{
			die('Error: ' . mysql_error());
		}
	}
	
	public function delete() {
		$sql = "DELETE from user
				WHERE user_id = ".$this->user_id;
		if (!mysql_query($sql))
		{
			die('Error: ' . mysql_error());
		}
	}
	
	public function get() {
		$sql = "SELECT * FROM user WHERE group_id = ".$this->user_id;
		$result = mysql_query($sql);
		$row = mysql_fetch_array($result);
		$this->username = $row['username'];
		$this->fullname = $row['fullname'];
		$this->email = $row['email'];
		$this->password = $row['password'];
	}
}
	
?>