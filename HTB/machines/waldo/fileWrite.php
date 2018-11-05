<?php

if($_SERVER['REQUEST_METHOD'] === "POST"){
	header('Content-Type: application/json');
	$condition['result'] = false;
	if(isset($_POST['listnum'])){
		if(is_numeric($_POST['listnum'])){
			$myFile = "/var/www/html/.list/list" . $_POST['listnum'];
			$handle = fopen($myFile, 'w');
			$data = $_POST['data'];
			fwrite($handle, $data);
			fclose();
			$condition['result'] = true;
		}
	}
	echo json_encode($condition);
}
