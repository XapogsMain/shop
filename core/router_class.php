<?php

	class Router{
		
		private $config;
		
		public function __construct(){
			$this->config = new Config();
			$controller = $this->getController();
			switch($controller){
				case "admin":
					$obj = new Admin();
				break;
				case "buy":
					$obj = new Order();
				break;
				default:
					$obj = new Main();
				break;
			}
			$obj->getController();
		}
		
		public function getController(){
			$uri = $_SERVER['REQUEST_URI'];
			$controller = substr($uri, strlen($this->config->folder)+1);
			return $controller;
		}
		
	}

?>