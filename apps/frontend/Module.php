<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 4/6/2018
 * Time: 2:56 PM
 */


namespace Graduate\Frontend;

use Phalcon\Db\Adapter\Pdo\Mysql;
use Phalcon\Loader;
use Phalcon\Mvc\View;
use Phalcon\DiInterface;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;

class Module implements ModuleDefinitionInterface
{
    /**
     * Register a specific autoloader for the module
     */
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces(
            [
                "Graduate\Frontend\Controllers" => __DIR__ . "/controllers/",
                "Graduate\Frontend\Models"      => __DIR__ . "/models/",
            ]
        );
        $loader->registerDirs([
            __DIR__ . '/service/',
            __DIR__.'/../library/'
        ]);

        $loader->register();
    }

    /**
     * Register specific services for the module
     */
    public function registerServices(DiInterface $di)
    {
        $config = include __DIR__ . "/config/config.php";

        // Registering the view component
        $di['view'] = function () use ($config) {
            $view = new View();
            $view->setViewsDir($config->get('application')->viewsDir);
            $view->registerEngines(array(
                '.volt' => function ($view, $di) use ($config) {

                    $volt = new VoltEngine($view, $di);

                    $volt->setOptions(array(
                        'compiledPath' => $config->application->cacheDir,
                        'compiledSeparator' => '_',
                        'stat' => true,
                        'compileAlways' => true
                    ));
                    //load function php
                    return $volt;
                },
                '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
            ));
//            d($view);
            return $view;
        };


        /**
         * Database connection is created based in the parameters defined in the configuration file
         */
        $di['db'] = function () use ($config) {
            $sql = new Mysql($config->database->toArray());
            return $sql;
        };
    }
}