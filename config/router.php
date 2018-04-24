<?php


$router = $di->get("router");
/* BACKEND */
$router->add("/backend", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'index',
    'action' => 'index',
]);

$router->add("/quan-tri", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'index',
    'action' => 'index',
]);

$router->add("/quan-tri/dang-nhap", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'auth',
    'action' => 'login',
]);

$router->add("/quan-tri/san-pham", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'product',
    'action' => 'index',
]);

/* END BACKEND */

foreach ($application->getModules() as $key => $module) {
    $namespace = str_replace('Module', 'Controllers', $module ["className"]);
//    d($namespace, $key, $module);
    $router->add('/' . $key . '/:params', array(
        'namespace' => $namespace,
        'module' => $key,
        'controller' => 'index',
        'action' => 'index',
        'params' => 1
    ))->setName($key);
    $router->add('/' . $key . '/:controller/:params', array(
        'namespace' => $namespace,
        'module' => $key,
        'controller' => 1,
        'action' => 'index',
        'params' => 2
    ));
    $router->add('/' . $key . '/:controller/:action/:params', array(
        'namespace' => $namespace,
        'module' => $key,
        'controller' => 1,
        'action' => 2,
        'params' => 3
    ));
}

$di->set("router", $router);