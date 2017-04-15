<?php

	class Order{
		
		private $valid;
		private $db;
		private $config;
		
		public function __construct(){
			$this->valid = new Validators();
			$this->db = DataBase::getInstance();			
			$this->config = new Config();			
		}
		public function getController(){
			if($this->valid->checkName($_POST["name"]) && $this->valid->checkName($_POST["surname"])){
				$name = $_POST["name"];
				$surname = $_POST["surname"];
				$order = $_COOKIE["cart"];
				$this->db->Insert("orders", array("name"=>$name, "lastname"=>$surname, "goods"=>$order, "data"=>time()));
				setcookie("cart", "", time()-1, "/");
			}
			header("Location: ".$this->config->folder);
			exit("Error");
		}
		
	}

?>