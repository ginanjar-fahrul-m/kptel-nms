<?php
	require("./includes/connect.php");
	class Group{
		public $group_id;
		public $parent_id;
		public $name;
		public $description;
		public $longitude;
		public $latitude;
		public function __construct($_group_id, $_parent_id, $_name, $_description, $_longitude, $_latitude){
			$this->group_id = $_group_id;
			$this->parent_id = $_parent_id;
			$this->name = $_name;
			$this->description = $_description;
			$this->longitude = $_longitude;
			$this->latitude = $_latitude;
		}
		public function addGroup(){
			$sql = "INSERT INTO group (group_id, parent_id, name, description, longitude, latitude)
					VALUES (".$this->group_id.", ".$this->parent_id.", '".$this->name."', '".$this->description."', 
							".$this->longitude.", ".$this->latitude.")";
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function updateGroup(){
			$sql = "UPDATE group 
					SET group_id = ".$this->group_id.", parent_id = ".$this->parent_id.", name = '".$this->name."', 
									description = '".$this->description."', longitude = ".$this->longitude.", latitude = ".$this->latitude." 
					WHERE group_id = ".$this->group_id;
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function deleteGroup(){
			$sql = "DELETE from group
					WHERE group_id = ".$this->group_id;
			if (!mysql_query($sql))
			{
				die('Error: ' . mysql_error());
			}
		}
		public function getGroup(){
			$sql = "SELECT * FROM group WHERE group_id = ".$this->group_id;
			$result = mysql_query($sql);
			$row = mysql_fetch_array($result);
			$this->parent_id = $row['parent_id'];
			$this->name = $row['name'];
			$this->description = $row['description'];
			$this->longitude = $row['longitude'];
			$this->latitude = $row['latitude'];
		}
	}
?>