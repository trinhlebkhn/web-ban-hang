<?php

use Phalcon\Events\Event;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Router;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Php as PhpEngine;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Mvc\Model\Metadata\Memory as MetaDataAdapter;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Phalcon\Flash\Session as Flash;
use Phalcon\Events\Manager as EventsManager;

/**
 * Shared configuration service
 */
$di->setShared('router', function () {
    $router = new Router();
    $router->setDefaultModule('frontend');
    $router->setDefaultNamespace('Graduate\Frontend\Controllers');
    return $router;
});

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->setShared('url', function () {
    $config = $this->getConfig();

    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);

    return $url;
});

/**
 * Setting up the view component
 */
$view = new View();
$di->setShared('view', function () use ($config) {
    $view = new View();
    $view->setViewsDir($config->application->viewsDir);
    $view->registerEngines([
        '.volt' => function ($view, $di) use ($config) {
            $volt = new VoltEngine($view, $di);
            $volt->setOptions([
                'compiledPath' => $config->application->cacheDir,
                'compiledSeparator' => '_'
            ]);
            $compiler = $volt->getCompiler();
            $compiler->addFunction('in_array', 'in_array');
            $compiler->addFunction('number_format', 'number_format');
            $compiler->addFunction('str_replace', 'str_replace');
            $compiler->addFunction('array_chunk', 'array_chunk');
            return $volt;
        },
        '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
    ]);

    return $view;
});

/**
 * Database connection is created based in the parameters defined in the configuration file
 */
$di->setShared('db', function () {
    $config = $this->getConfig();

    $class = 'Phalcon\Db\Adapter\Pdo\\' . $config->database->adapter;
    $params = [
        'host'     => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname'   => $config->database->dbname,
        'charset'  => $config->database->charset
    ];

    if ($config->database->adapter == 'Postgresql') {
        unset($params['charset']);
    }

    $connection = new $class($params);

    return $connection;
});

/**
 * Register the session flash service with the Twitter Bootstrap classes
 */
$di->set('flash', function () {
    return new Flash([
        'error'   => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice'  => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ]);
});

/**
 * Start the session the first time some component request the session service
 */
$di->setShared('session', function () {
    $session = new SessionAdapter();
    $session->start();

    return $session;
});

$di->setShared('uiHelper', function () {
    $obj = new UIHelper();
    return $obj;
});

/**
 * @return Dispatcher
 */
$di['dispatcher'] = function () {

    $events_manager = new EventsManager();

    // Attach a listener
    $events_manager->attach(
        "dispatch:beforeException",
        function (Event $event, \Phalcon\Dispatcher $dispatcher, Exception $exception) {
//            die($exception); // dong` vua` nay~ la cua anh , proj nay k co
        }
    );

    $dispatcher = new Dispatcher();

    // Bind the EventsManager to the dispatcher
    $dispatcher->setEventsManager($events_manager);

    return $dispatcher;
};

return $di;