<?php

class Configuration {
	private $db_cacti = 'cacti';
	private $db_app = 'appsMonitor';
	
	public function get_cacti_database() {
		return $db_cacti;
	}
	
	public function get_app_database() {
		return $db_app;
	}
}