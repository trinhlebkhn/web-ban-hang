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
    'action' => 'delete',
]);


/* Quản trị hóa đơn */
$router->add("/quan-tri/hoa-don", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'bill',
    'action' => 'index',
]);

$router->add("/quan-tri/chi-tiet-hoa-don-hd{id:[0-9]+}", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'bill',
    'action' => 'detail',
    'id' => 2,
]);

$router->add("/doi-trang-thai-don-hang-b{status:[0-9]}{id:[0-9]+}", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'bill',
    'action' => 'changeStatus',
    'status' => 1,
    'id' => 1,
]);

/* Quản trị User */
$router->add("/quan-tri/dang-nhap", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'auth',
    'action' => 'login',
]);

$router->add("/quan-tri/dang-xuat", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'auth',
    'action' => 'logout',
]);


$router->add("/quan-tri/thanh-vien", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'auth',
    'action' => 'list_user',
]);

$router->add("/quan-tri/chi-tiet-thanh-vien-id{id:[0-9]+}", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'auth',
    'action' => 'detail',
    'id' => 1,
]);

/* Cấu hình trang chủ */
$router->add("/quan-tri/cau-hinh-trang-chu", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'confighome',
    'action' => 'index',
]);

$router->add("/quan-tri/xoa-danh-muc-trang-chu", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'confighome',
    'action' => 'delete',
]);

/* END BACKEND */


/* START FRONTEND */

/* Category */
$router->add("/{slug}-pc{id:[0-9]+}.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'category',
    'action' => 'product',
]);

$router->add("/{slug}-ac{id:[0-9]+}.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'category',
    'action' => 'article',
]);

/* chi tiết sản phẩm */
$router->add("/{slug}-p{id:[0-9]+}.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'product',
    'action' => 'detail',
]);


/* END FRONTEND */


foreach ($application->getModules() as $key => $module) {
    $namespace = str_replace('Module', 'Controllers', $module ["className"]);
//    d($namespace, $key, $module);
    $router->add('/' . $key . '/:params', [
        'namespace' => $namespace,
        'module' => $key,
        'controller' => 'index',
        'action' => 'index',
        'params' => 1
    ])->setName($key);
    $router->add('/' . $key . '/:controller/:params', [
        'namespace' => $namespace,
        'module' => $key,
        'controller' => 1,
        'action' => 'index',
        'params' => 2
    ]);
    $router->add('/' . $key . '/:controller/:action/:params', [
        'namespace' => $namespace,
        'module' => $key,
        'controller' => 1,
        'action' => 2,
        'params' => 3
    ]);
}
$di->set("router", $router);