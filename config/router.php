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

/* Quản trị sản phẩm */
$router->add("/quan-tri/san-pham", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'product',
    'action' => 'index',
]);

$router->add("/quan-tri/them-moi-san-pham", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'product',
    'action' => 'add',
]);

$router->add("/quan-tri/chinh-sua-san-pham", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'product',
    'action' => 'add',
]);

$router->add("/quan-tri/xoa-san-pham", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'product',
    'action' => 'delete',
]);

$router->add("/quan-tri/danh-sach-san-pham", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'product',
    'action' => 'getListProduct',
]);

/* QUẢN TRỊ MENU */
$router->add("/quan-tri/menu-block", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'menu',
    'action' => 'index',
]);

$router->add("/quan-tri/xoa-menu-block", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'menu',
    'action' => 'delete',
]);



/* Quản trị danh mục */
$router->add("/quan-tri/danh-muc", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'category',
    'action' => 'index',
]);

$router->add("/quan-tri/tao-moi-danh-muc", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'category',
    'action' => 'update',
]);

$router->add("/quan-tri/chinh-sua-danh-muc", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'category',
    'action' => 'update',
]);

$router->add("/quan-tri/xoa-danh-muc", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'category',
    'action' => 'deleteCategory',
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