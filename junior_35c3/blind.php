<?php
  function __autoload($cls) {
    include $cls;
  }

  class Black {
    public function __construct($string, $default, $keyword, $store) {
      if ($string) ini_set("highlight.string", "#0d0d0d");
      if ($default) ini_set("highlight.default", "#0d0d0d");
      if ($keyword) ini_set("highlight.keyword", "#0d0d0d");

      if ($store) {
            setcookie('theme', "Black-".$string."-".$default."-".$keyword, 0, '/');
      }
    }
  }

  class Green {
    public function __construct($string, $default, $keyword, $store) {
      if ($string) ini_set("highlight.string", "#00fb00");
      if ($default) ini_set("highlight.default", "#00fb00");
      if ($keyword) ini_set("highlight.keyword", "#00fb00");

      if ($store) {
            setcookie('theme', "Green-".$string."-".$default."-".$keyword, 0, '/');
      }
    }
  }


    $_ = "SplFileInfo-.";
    $args = explode('-', $_);
    if (class_exists($args[0])) {
      $c = new $args[0]($args[1], $args[2], $args[3], '');
        echo $c;
    }
