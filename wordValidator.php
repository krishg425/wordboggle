<?php

$submittedWord = $_GET['submittedWord'];

require('./wordnik/Swagger.php');
$myAPIKey = 'f89806200986707bc690e0875d4091b069ddd015c48eab071';
$client = new APIClient($myAPIKey, 'http://api.wordnik.com/v4');
$submittedWord = "engdfdlish";
$wordApi = new WordApi($client);
$example = $wordApi->getTopExample($submittedWord);
//echo "Word validation of ".$submittedWord;

echo $example;
?>