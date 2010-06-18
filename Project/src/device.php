<?php
	require("./includes/connect.php");
	class Device{
		public $device_id;
		public $group_id;
		public $device_type_id;
		public $name;
		public $description;
		public $longitude;
		public $latitude;
		public function __construct($_device_id, $_group_id, $_device_type_id, $_name, $_description, $_longitude, $_latitude){
			$this->device_id = $_device_id;
			$this->group_id = $_group_id;
			$this->device_type_id = $_device_type_id;
			$this->name = $_name;
			$this->description = $_description;
			$this->longitude = $_longitude;
			$this->latitude = $_latitude;
		}
		public function addDevice(){
			$sql = "INSERT INTO device (group_id, device_type_id, name, description, longitude, latitude)
					VALUES (".$this->group_id.", ".$this->device_type_id.", ".$this->name.", ".$this->description.", 
							".$this->longitude.", ".$this->latitude.")";
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function updateDevice(){
			$sql = "UPDATE device 
					SET group_id = ".$this->group_id.", device_type_id = ".$this->device_type_id.", name = ".$this->name.", 
									description = ".$this->description.", longitude = ".$this->longitude.", latitude = ".$this->latitude." 
					WHERE device_id = ".$this->device_id;
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function deleteDevice(){
			$sql = "DELETE from device
					WHERE device_id = ".$this->device_id;
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function getDevice(){
			$sql = "SELECT * FROM device WHERE device_id = ".$this->device_id;
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);
			$this->group_id = $row['group_id'];
			$this->device_type_id = $row['device_type_id'];
			$this->name = $row['name'];
			$this->description = $row['description'];
			$this->longitude = $row['longitude'];
			$this->latitude = $row['latitude'];
		}
	}
?>