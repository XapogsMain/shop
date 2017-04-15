<?php
	if(!defined("ACTKEY")){ 
		header('Location: /');
		exit();
	}
	final class Database{
		
		private static $instance;
		private $config;
		private $mysqli;
		
		public static function getInstance(){
			if (!(self::$instance instanceof self)) {
				self::$instance = new self();
			}
			return self::$instance;
		} 
		private function __construct(){
			$this->config = new Config();
			$this->mysqli = new mysqli($this->config->db_host, $this->config->db_login, $this->config->db_pass, $this->config->db_table);
			$this->mysqli->query("SET NAMES 'utf8'");
			$this->mysqli->set_charset("utf8");
		}
		public function Insert($table, $values){
			$query = "INSERT ".$this->config->db_prefix.$table." SET ";
			$query .= $this->Set($values);
			$this->mysqli->query($query);
			return $this->mysqli->insert_id;
		}
		public function Select($table, $columns="*", $where=null, $properties=array()){
			$ret = $this->selection($table, $columns, $where, $properties);
			return $ret[0];
		}
		public function columnSelect($table, $column, $where=null, $properties=array()){
			$ret = $this->selection($table, $column, $where, $properties);
			if($ret[1] == 1){
				return $ret[0][0][$column];
			}
			else return $ret[0];
		}
		public function singleSelect($table, $columns="*", $where=null, $properties=array()){
			$ret = $this->selection($table, $columns, $where, $properties);
			if($ret[1] == 1){
				return $ret[0][0];
			}
			else return $ret[0];
		}
		private function selection($table, $columns, $where, $properties){
			$query = "SELECT ";
			$query .= $this->From($columns);
			$query .= " FROM `".$this->config->db_prefix.$table."` ";
			$query .= $this->Where($where);
			$query .= $this->Properties($properties);
			$result = $this->mysqli->query($query);
			if($result)
				while ($row = $result->fetch_assoc()) 
					$return[] = $row;
			else $return = false;
			$num_rows = $result->num_rows;
			$result->close();
			return array($return, $num_rows);
		}
		public function Remove($table, $where){
			$query = "DELETE FROM `".$this->config->db_prefix.$table."` ";
			$query .= $this->Where($where);
			return $this->mysqli->query($query);
		}
		public function Update($table, $set, $where){
			$query = "UPDATE `".$this->config->db_prefix.$table."` SET ";
			$query .= $this->Set($set);
			$query .= $this->Where($where);
			return $this->mysqli->query($query);
		}
		
		private function Set($set){
			foreach($set as $key => $value)
				$query .= " `".$key."`='".$value."', ";
			return substr($query, 0, -2)." ";
		}
		private function Where($data){
			$where="";
			if($data != null){
				$where = " WHERE ";
				$i=0;
				foreach($data as $key => $value){
					if(is_array($value)){
						$where .= " `".$value[0]."` ".$value[1]." '".$value[2]."' ";
					}
					else{
						$where .= " `".$key."` = '".$value."' ";
					}
					if($i != (count($data)-1)) $where .= " AND ";
					$i++;
				}
			}
			return $where;
		}
		private function From($data){
			if(is_array($data)){
				foreach($data as $value){
					$data_list .= "`".$value."`, ";
				}
				return (substr($data_list, 0, -2)." ");
			}
			elseif($data=='*'){
				return ($data." ");
			}
			else{
				return ("`".$data."` ");
			}
		}
		private function Properties($properties){
			$str="";
			if(isset($properties["order"]))	$str .= " ORDER BY `".$properties["order"]."` ";
			if($properties["desc"] == true) $str .= " DESC ";
			if(isset($properties["limit"])) $str .= " LIMIT ".$properties["limit"]." ";
			return $str;
		}
		
		public function __destruct(){
			$this->mysqli->close();
		}
		private function __wakeup(){}
		private function __clone(){}
		private function __sleep(){}
	}
	
?>