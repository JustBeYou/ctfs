<?php
    $flag = 'SOME_TEST';
    $_ = '123';
    $ua = '123';

    echo md5($_); echo "\n";
    echo $_[0]; echo "\n";
    echo "---------\n";
    echo (md5($_) + $_[0]);
    echo md5($ua);
    echo "\n";
    if (md5($_) + $_[0] == md5($ua)) {
        echo "A\n";
        if ($_[0] == md5($_[0] . $flag)[0]) {
        echo $flag;
      }
    }
