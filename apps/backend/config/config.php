<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 4/7/2018
 * Time: 9:35 AM
 */
defined('BASE_PATH') || define('BASE_PATH', getenv('BASE_PATH') ?: realpath(dirname(__FILE__) . '/../..'));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/apps');


return new \Phalcon\Config([
    'database' => [
        'adapter'     => 'Mysql',
        'host'        => $_ENV['DB_HOST'],
        'port'        => $_ENV['DB_PORT'],
        'username'    => $_ENV['DB_USERNAME'],
        'password'    => $_ENV['DB_PASSWORD'],
        'dbname'      => $_ENV['DB_DBNAME'],
        'charset'     => 'utf8',
    ],
    'zalo' => [
        'app_id '        => $_ENV['ZALO_APP_ID_CFG '],
        'app_key'        => $_ENV['ZALO_APP_SECRET_KEY_CFG '],
        'oa_id'          => $_ENV['ZALO_OA_ID_CFG '],
        'oa_key'         => $_ENV['ZALO_OA_SECRET_KEY_CFG '],
    ],
    'application' => [
        'appDir'         => APP_PATH . '/',
        'controllersDir' => APP_PATH . '/backend/controllers/',
        'modelsDir'      => APP_PATH . '/models/',
        'migrationsDir'  => APP_PATH . '/migrations/',
        'viewsDir'       => APP_PATH . '/backend/views/',
        'pluginsDir'     => APP_PATH . '/plugins/',
        'libraryDir'     => APP_PATH . '/library/',
        'cacheDir'       => APP_PATH . '/backend/cache/',
        'serviceDir'       => APP_PATH . '/service/',

        // This allows the baseUri to be understand project paths that are not in the root directory
        // of the webpspace.  This will break if the public/index.php entry point is moved or
        // possibly if the web server rewrite rules are changed. This can also be set to a static path.
        'baseUri'        => preg_replace('/public([\/\\\\])index.php$/', '', $_SERVER["PHP_SELF"]),
    ]
]);

