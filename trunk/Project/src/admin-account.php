<?php
	require("./includes/connect.php");
	class User{
		public $user_id;
		public $username;
		public $fullname;
		public $email;
		public $password;
		public function __construct($_user_id, $_username, $_fullname, $_email, $_password){
			$this->user_id = $_user_id;
			$this->username = $_username;
			$this->fullname = $_fullname;
			$this->email = $_email;
			$this->password = $_password;
		}
		public function addUser(){
			$sql = "INSERT INTO user (user_id, username, fullname, email, password)
					VALUES (".$this->user_id.", '".$this->username."', '".$this->fullname."', 
							'".$this->email."', '".sha1($this->password)."')";
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function updateUser(){
			$sql = "UPDATE user 
					SET username = '".$this->username."', fullname = '".$this->fullname."', 
									email = '".$this->email."', password = '".sha1($this->password)."' 
					WHERE device_id = ".$this->user_id;
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function deleteUser(){
			$sql = "DELETE from user
					WHERE user_id = ".$this->user_id;
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function getUser(){
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