<?php

require_once('includes/config.php');
require_once('includes/connection.class.php');
require_once('includes/session.php');

class Device {
	public $device_id = null;
	public $group_id = null;
	public $device_type_id = null;
	public $name = null;
	public $description = null;
	public $longitude = null;
	public $latitude = null;
	public $cacti_id = null;

	public function add() {
		global $config;
		
		$sql = "INSERT INTO `device` (
					`group_id`,
					`device_type_id`,
					`name`,
					`description`,
					`longitude`,
					`latitude`,
					`cacti_id`)
				VALUES (
					".$this->group_id.",
					".$this->device_type_id.",
					'".$this->name."',
					'".$this->description."', 
					".$this->longitude.",
					".$this->latitude.",
					".$this->cacti_id.")";
		
		session_get($config['session']['app_db_sess'])->query($sql);
	}

	public function update() {
		global $config;
		
		if($this->device_id != null) {
			$sql = "UPDATE device 
					SET
						group_id = ".$this->group_id.",
						device_type_id = ".$this->device_type_id.",
						name = '".$this->name."',
						description = '".$this->description."',
						longitude = ".$this->longitude.",
						latitude = ".$this->latitude." 
					WHERE device_id = ".$this->device_id;
			
			session_get($config['session']['app_db_sess'])->query($sql);
		}
	}

	public function delete() {
		global $config;
		
		$sql = "DELETE from device
				WHERE device_id = ".$this->device_id;
		
		session_get($config['session']['app_db_sess'])->query($sql);
	}

	public function get() {
		global $config;
		
		$sql = "SELECT * FROM device WHERE device_id = ".$this->device_id;
		$result = session_get($config['session']['app_db_sess'])->query($sql);;
		
		$row = mysql_fetch_assoc($result);
		
		$this->device_id = $row['device_id'];
		$this->group_id = $row['group_id'];
		$this->device_type_id = $row['device_type_id'];
		$this->name = $row['name'];
		$this->description = $row['description'];
		$this->longitude = $row['longitude'];
		$this->latitude = $row['latitude'];
		$this->cacti_id = $row['cacti_id'];
	}
}
?>