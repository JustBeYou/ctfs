<?php

session_start();
error_reporting(null);
require_once 'vendor/autoload.php';
// to be changed
define('SCRIPT', __FILE__);
define('DB', '/db');
define('HOST', 'http://localhost/app/');
define('DB_PATH', 'db');
define('CK_PATH', 'cookies');
use Gregwar\Captcha\PhraseBuilder;
use Gregwar\Captcha\CaptchaBuilder;
$phraseBuilder = new PhraseBuilder(5, 'm0v3r111en7');
$builder = new CaptchaBuilder( null, $phraseBuilder);
if (!isset($_SESSION['phrase']))
    $_SESSION['phrase'] = $builder->getPhrase();

require_once 'init.php';
if ($user->isUser)
    require_once 'pages/shot.php';
else
    require_once 'pages/new.php';
$builder = new CaptchaBuilder( null, $phraseBuilder);
$_SESSION['phrase'] = $builder->getPhrase();
?>