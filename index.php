<?php
	date_default_timezone_set('Europe/Riga');
	function __autoload($class_name){
		$folders = array("", "core", "controllers");
		for($i=0; $i<count($folders);$i++)
			if(file_exists($folders[$i]."/".$class_name."_class.php"))
				require_once $folders[$i]."/".$class_name."_class.php";
	}
	define("ACTKEY", true);
	$router = new Router();
?>