<?php

	class Admin{
		
		private $tmpl;
		private $config;
		private $valid;
		private $db;
		
		public function __construct(){
			$this->config = new Config;
			$this->valid = new Validators();
			$this->db = DataBase::getInstance();
			$this->tmpl = new Template($this->config->tmpl);	
		}
		public function getController(){
			if(isset($_POST["send"]) && $this->valid->checkName($_POST["login"]) && $this->valid->checkPass($_POST["pass"])){
				$logins = parse_ini_file("configs/admins.ini");	
				$login = $_POST["login"];
				$pass = $_POST["pass"];
				if($logins[$login] == $pass){
					$_SESSION["id"] = $login;
					header("Location: ".$this->config->folder."/admin");
					exit;
				}
			}
			elseif(isset($_SESSION["id"])){
				if(isset($_GET["logout"])){
					unset($_SESSION["id"]);
					header("Location: ".$this->config->path);
					exit;
				}
				if(isset($_GET["complete"])){
					$this->db->Update("orders", array("compleeted"=>"1"), array("id"=>$_GET["complete"]));
				}
				$data = $this->db->Select("orders", "*", array("compleeted"=>"0"));
				for($i = 0; $i < count($data); $i++){
					$data[$i]["data"] = date("Y-m-d H:i:s", $data[$i]["data"]);
					$goods = json_decode($data[$i]["goods"]);
					$str = "";
					$sum = 0;
					foreach($goods as $key => $value){
						$good = $this->db->singleSelect("prices", array("title", "price"), array("id"=>$key));
						$str .= $good["title"]." ".$value." pieces<br />";
						$sum += $good["price"]*$value;
					}
					$data[$i]["goods"] = $str;
					$data[$i]["sum"] = $sum;
				}
				$this->tmpl->set("data", $data);
				$this->tmpl->display("admin_main");
			}
			else{
				$this->tmpl->set("path", $this->config->path);
				$this->tmpl->display("admin_login");
			}
		}
		
	}

?>