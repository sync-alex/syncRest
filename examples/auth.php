<?php
if (!isset($_SERVER['PHP_AUTH_USER'])) {
    header('WWW-Authenticate: Basic realm="My Realm"');
    header('HTTP/1.0 401 Unauthorized');
    echo 'Text to send if user hits Cancel button';
    exit;
} elseif ($_SERVER['PHP_AUTH_USER']!='user' && $_SERVER['PHP_AUTH_PW']!='pass') {
    header('HTTP/1.0 403 Forbidden');
    echo 'Forbidden';
    exit;
}

include "api.php";

$api = new PHP_CRUD_API(array(
		'dbengine'=>'SQLServer',
		'hostname'=>'(local)',
		'username'=>'',
		'password'=>'',
		'database'=>'xxx',
		'charset'=>'UTF-8'
));
$api->executeCommand();
