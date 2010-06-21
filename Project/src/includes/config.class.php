<?php

class Configuration {
	private $db_hostname = '127.0.0.1';
	private $db_username = 'kptel';
	private $db_password = 'kptel';
	
	private $db_cacti = 'cacti';
	private $db_app = 'appsMonitor';
	
	public function get_db_hostname() {
		return $this->db_hostname;
	}
	
	public function get_db_username() {
		return $this->db_username;
	}
	
	public function get_cacti_database() {
		return $this->$db_cacti;
	}
	
	public function get_app_database() {
		return $this->$db_app;
	}
}