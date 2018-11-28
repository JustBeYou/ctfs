<?php


session_start();
require_once 'vendor/autoload.php';

use Gregwar\Captcha\PhraseBuilder;
use Gregwar\Captcha\CaptchaBuilder;

$phraseBuilder = new PhraseBuilder(5, 'm0v3r111en7');
$builder = new CaptchaBuilder( null, $phraseBuilder);
$builder->build();
$_SESSION['phrase'] = $builder->getPhrase();

header('Content-type: image/jpeg');
$builder->output();

?>