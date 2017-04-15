<?php

	class Main{
		
		private $template;
		private $config;
		private $db;
		
		public function __construct(){
			$this->config = new Config;
			$this->template = new Template($this->config->tmpl);			
			$this->db = DataBase::getInstance();
		}
		
		public function getController(){
			$goods = $this->db->Select("prices");
			$this->template->set("goods", $goods);
			$this->template->set("title", $this->config->title);
			$this->template->display("index");
		}
		
	}

?>