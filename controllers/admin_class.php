<?php

	class Admin{
		
		private $tmpl;
		private $config;
		
		public function __construct(){
			$this->config = new Config;
			$this->tmpl = new Template($this->config->tmpl);	
		}
		public function getController(){
			$this->tmpl->set("path", $this->config->path);
			$this->tmpl->display("admin_login");
		}
		
	}

?>