<?php

use Defuse\Crypto\Crypto;
use Defuse\Crypto\Key;
use Gregwar\Image\Image;

function random($n){
    return bin2hex(random_bytes($n));
}
function genmeta($username){
    return array(
        "username" => $username,
        "time" => time(),
        "path" => 'users' . "/" . random(10)
    );
}

function encrypt($data, $username){
    $blowfish_secret = Key::createNewRandomKey();;
    $ciphertext = Crypto::encrypt(serialize($data), $blowfish_secret);

    $blowfish_secret = $blowfish_secret->saveToAsciiSafeString();
    $_SESSION[$username]["blowfish_secret"] = $blowfish_secret;
    return $ciphertext;
}

function isValidMetadata($ciphertext, $username){
    $blowfish_secret = $_SESSION[$username]["blowfish_secret"];
    $blowfish_secret = Key::loadFromAsciiSafeString($blowfish_secret);
    try {
        $data = unserialize(Crypto::decrypt($ciphertext, $blowfish_secret));
        return true;
    } catch (\Defuse\Crypto\Exception\WrongKeyOrModifiedCiphertextException $ex) {
        return false;
    }
}

function decrypt($ciphertext, $username){
    $blowfish_secret = $_SESSION[$username]["blowfish_secret"];
    $blowfish_secret = Key::loadFromAsciiSafeString($blowfish_secret);
    try {
        $data = unserialize(Crypto::decrypt($ciphertext, $blowfish_secret));
        return $data;
    } catch (\Defuse\Crypto\Exception\WrongKeyOrModifiedCiphertextException $ex) {
        return null;
    }
}

function generate($user){
    function wrapper($meta)
    {
        if (!is_dir($meta['path']))
            if (!mkdir($meta['path']))
                return false;
        if (!copy('index.png', $meta['path'].'/' . 'index.png'))
            return false;
        if (!is_file($meta['path'] . "/" . DB_PATH))
            if (! copy(DB, $meta['path'] . "/" . DB_PATH))
               return false;
        if (!is_file($meta['path'] . "/" . CK_PATH))
            if (! file_put_contents($meta['path'] . "/". CK_PATH, null))
                return false;
        return true;
    }
    if (!wrapper($user->metadata))
        @rmdir($user->metadata['path']);
}

function degenerate($user){
    $meta = $user->metadata;
    function xrmdir($dir) {
        $items = scandir($dir);
        foreach ($items as $item) {
            if ($item === '.' || $item === '..') {
                continue;
            }
            $path = $dir.'/'.$item;
            if (is_dir($path)) {
                xrmdir($path);
            } else {
                unlink($path);
            }
        }
        rmdir($dir);
    }
    xrmdir($user->metadata['path']);
}

function curl($url, $user){
    $meta = $user->metadata;
    $cookie_file = $meta['path']. "/" . CK_PATH;
    $rebuildUrl = validate($url);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $rebuildUrl);
    curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_TIMEOUT_MS, 2000);
    $content = curl_exec ($ch);
    curl_close ($ch);
    return $content;
}

function cache($url, $user){
    $meta = $user->metadata;
    $cookies = $meta['path']. "/" . CK_PATH;
    $cachefile = $meta['path'] . "/" . random(10). ".jpg";
    $rebuildUrl = validate($url);
    file_to_jpg($rebuildUrl, $cachefile, $cookies);
    $db = new SQLite3($meta['path'] . "/" . DB_PATH, SQLITE3_OPEN_CREATE | SQLITE3_OPEN_READWRITE);
    $statement = $db->prepare('INSERT INTO "link" ("url", "path") VALUES (:url, :path)');
    $statement->bindValue(':url', $rebuildUrl);
    $statement->bindValue(':path', $cachefile);
    $statement->execute();
}

function applyWatermark($cacheFile){
    $img = Image::open($cacheFile);
    $watermark = Image::open('img/good.jpg');
    $img->merge($watermark, $img->width()-$watermark->width(),
        $img->height()-$watermark->height())
        ->save($cacheFile, 'jpg');
}

function random_pic($dir = 'img/pepe/')
{
    $files = glob($dir . '/*.*');
    $file = array_rand($files);
    return $files[$file];
}

function file_to_jpg($url, $cachefile, $cookies){
    session_commit();
    $url = escapeshellarg($url);
    if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
        // TODO: never do.
        copy(random_pic(), $cachefile);
    }
    else{
        $cmd = "unset LD_LIBRARY_PATH;timeout 5 xvfb-run -a phantomjs --cookies-file={$cookies} prntscrn.js {$url} {$cachefile} 2>&1";
        $output= shell_exec($cmd);
        if (!is_file($cachefile)){
            copy(random_pic(), $cachefile);
        }
        else
            applyWatermark($cachefile);
    }
    session_start();
    return $cachefile;

}

function getCache($user){
    $meta = $user->metadata;
    $result = array();
    $db = new SQLite3($meta['path'] . "/". DB_PATH, SQLITE3_OPEN_CREATE | SQLITE3_OPEN_READWRITE);
    $statement = $db->prepare('SELECT * from "link" order by id desc');
    $r = $statement->execute();

    while($res = $r->fetchArray(SQLITE3_ASSOC))
        $result[] = $res;
    return $result;
}

function validate($url){
    $url_parts = parse_url($url);
    if (!isset($url_parts['scheme']) or !array_key_exists($url_parts['scheme'], array('http'=>0, 'https'=>1)))
        return (HOST);
    $rebuildUrl = $url_parts['scheme'] . "://" . $url_parts['host'] . $url_parts['path'] . "?". $url_parts['query'];

    return $rebuildUrl;
}
function isValidURL($url){
    return true;
}
?>