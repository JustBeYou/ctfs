<?php

if(!defined('SCRIPT'))die();
require_once 'libs.php';
$user = new stdClass();
$destroy = true;
$isGenerate = false;
$message = null;
function authen(&$destroy, &$isGenerate, &$message){
    if (!isset($_COOKIE['username']) or ($_COOKIE['username']=="")){
       if (!isset($_GET['username']) or ($_GET['username']==""))
           return false;
       else
       {
           $_COOKIE['username'] = $_GET['username'];
           setcookie("username", $_GET['username']);
       }
    }
    if (isset($_GET['username']) and ($_GET['username'] != "") and ($_GET['username'] != $_COOKIE['username']))
    {
        $message = "Invalid session";
        return false;
    }
    $username = $_COOKIE['username'];
    if (is_numeric($username))
    {
        $message = "Invalid username";
        return false;
    }
    if (!array_key_exists($username, $_SESSION))
        {
            if (count($_SESSION) > 1)
            {
                $message = "Wrong session";
                $destroy=false;
                return false;
            }
            $isGenerate = true;
            if (!isset($_GET['ct']) or !isset($_SESSION['phrase']))
                return false;
            if ($_SESSION['phrase']!==$_GET['ct']){
                $message = "Wrong captcha.";
                return false;
            }
            $_SESSION[$username] = array();
        }
    if (!isset($_COOKIE['metadata'])){
        $meta = genmeta($username);
        $e_meta = encrypt($meta, $username);
        setcookie("metadata", $e_meta);
        $_COOKIE['metadata'] = $e_meta;
    }
    else
        return isValidMetadata($_COOKIE['metadata'], $username);
    return true;
}

if (! authen($destroy, $isGenerate, $message))
{
    setcookie(session_name(), null, -1);
    setcookie("username", null, -1);
    setcookie("metadata", null, -1);
    $user->isUser = False;
}
else
{
    $user->isUser = True;
    $user->metadata = decrypt($_COOKIE['metadata'], $_COOKIE['username']);
    if ($isGenerate)
        generate($user);
    if (isset($_GET['destroy']))
    {
        degenerate($user);
        session_destroy();
        setcookie(session_name(), null, -1);
        setcookie("username", null, -1);
        setcookie("metadata", null, -1);
        $user->isUser = False;
    }
}
?>