<?php

if($_SERVER['REQUEST_METHOD'] === "POST"){
	if(isset($_POST['listnum'])){
		header('Content-Type: application/json');
		if(is_numeric($_POST['listnum'])){
			$myFile = "/var/www/html/.list/list" . $_POST['listnum'];
			unlink($myFile);
			header('Content-Type: application/json');
			echo '[true]';
		}else{
			header('Content-Type: application/json');
			echo '[false]';
		}
	}else{
		header('Content-Type: application/json');
		echo '[false]';
	}
}
