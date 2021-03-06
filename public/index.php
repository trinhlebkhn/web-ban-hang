<?php
use Phalcon\Di\FactoryDefault;

error_reporting(E_ALL); ini_set('display_errors', true);
error_reporting(E_ERROR); ini_set('display_errors', true);
//ini_set('display_errors', 1); error_reporting(E_ALL);
define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/apps');

(require __DIR__ . '/../vendor/autoload.php');

try {

    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new FactoryDefault();
    $application = new \Phalcon\Mvc\Application($di);
    $config = include APP_PATH . "/frontend/config/config.php";
    /**
     * Read buttin
     */
    include BASE_PATH . '/config/buitin.php';

    /**
     * Handle routes
     */

    /**
     * Read services
     */
    include BASE_PATH . '/config/services.php';

    include BASE_PATH . '/config/modules.php';

    include BASE_PATH . '/config/router.php';

    include BASE_PATH . "/config/loader.php";
    /**
     * Handle the request
     */
    echo str_replace(["\n","\r","\t"], '', $application->handle()->getContent());
} catch (\Exception $e) {
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}
