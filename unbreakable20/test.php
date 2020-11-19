<?php
$test = "sth -or -exec ls / ; -quit";
$a = shell_exec("find /tmp -iname ".escapeshellcmd($test));
$b = base64_encode($a);
$c = strtoupper($b);

echo "output: ".$a."\n";
echo "b64: ".$b."\n";
echo "upper: ".$c."\n";
