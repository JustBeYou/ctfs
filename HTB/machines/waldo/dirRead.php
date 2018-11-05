<?php

if($_SERVER['REQUEST_METHOD'] === "POST"){
	if(isset($_POST['path'])){
		header('Content-type: application/json');
		$_POST['path'] = str_replace( array("../", "..\""), "", $_POST['path']);
		echo json_encode(scandir("/var/www/html/" . $_POST['path']));
	}else{
		header('Content-type: application/json');
		echo '[false]';
	}
}
