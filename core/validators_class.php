<?php

	class Validators{
		
		public function __construct(){}
		
		public function checkName($name){
			if(preg_match("/^[a-z]+$/i", $name)) return true;
			return false;
		}
		
		public function checkPass($pass){
			if(preg_match("/^[a-z0-9A-Z]+$/", $pass)) return true;
			return false;
		}
		
	}

?>