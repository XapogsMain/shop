<?php
	if(!defined("ACTKEY")){ 
		header('Location: /');
		exit();
	}
	class Template{
		
		private $dir_tmpl; 
		private $arr = array();

		public function __construct($dir_tmpl) {
			$this->dir_tmpl = $dir_tmpl;
		}

		public function set($name, $value) {
			$this->arr[$name] = $value;
		}

		public function delete($name) {
			unset($this->arr[$name]);
		}

		public function __get($name) {
			if (isset($this->arr[$name])) return $this->arr[$name];
			return "";
		}

		public function display($template) {
			echo $this->getContent($template);
		}
		
		public function getContent($template){
			$template = $this->dir_tmpl.$template.".tpl";
			ob_start();
			include ($template);
			return ob_get_clean();
		}
		
	}
	
?>