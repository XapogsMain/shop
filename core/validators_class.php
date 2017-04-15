<?php

	class Validators{
		
		public function __construct(){}
		
		public function checkName($name){
			if(preg_match("/^[a-z]+$/i", $name)) return true;
			return false;
		}
		
	}

?>