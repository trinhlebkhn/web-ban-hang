<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 4/7/2018
 * Time: 9:35 AM
 */
defined('BASE_PATH') || define('BASE_PATH', getenv('BASE_PATH') ?: realpath(dirname(__FILE__) . '/../..'));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/apps');

$env = new \Dotenv\Dotenv(BASE_PATH);
$env->load();

$config = [
    'database' => [
        'adapter'     => 'Mysql',
        'host'        => $_ENV['DB_HOST'],
        'port'        => $_ENV['DB_PORT'],
        'username'    => $_ENV['DB_USERNAME'],
        'password'    => $_ENV['DB_PASSWORD'],
        'dbname'      => $_ENV['DB_DBNAME'],
        'charset'     => 'utf8',
    ],
    'nl_payment' => [
        'nl_api'            => $_ENV['NL_API'],
        'nl_receiver'       => $_ENV['NL_RECEIVER'],
        'nl_merchant_id'    => $_ENV['NL_MERCHANT_ID'],
        'nl_merchant_pass'  => $_ENV['NL_MERCHANT_PASS'],
    ],
    'application' => [
        'appDir'         => APP_PATH . '/',
        'controllersDir' => APP_PATH . '/frontend/controllers/',
        'modelsDir'      => APP_PATH . '/models/',
        'migrationsDir'  => APP_PATH . '/migrations/',
        'viewsDir'       => APP_PATH . '/frontend/views/',
        'pluginsDir'     => APP_PATH . '/plugins/',
        'libraryDir'     => APP_PATH . '/library/',
        'cacheDir'       => APP_PATH . '/frontend/cache/',
        'serviceDir'       => APP_PATH . '/service/',
        'baseUri'        => preg_replace('/public([\/\\\\])index.php$/', '', $_SERVER["PHP_SELF"]),
    ]
];

return new \Phalcon\Config($config);
