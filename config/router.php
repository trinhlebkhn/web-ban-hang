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

$router->add("/quan-tri/tao-van-don-hd-{id:[0-9]+}", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'bill',
    'action' => 'createOrderVtp',
    'id' => 1,
]);

/* Đơn hàng Zalo */
$router->add("/quan-tri/hoa-don-zalo", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'bill',
    'action' => 'zalo',
]);

$router->add("/quan-tri/chi-tiet-hoa-don-zl", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'bill',
    'action' => 'detailOrderZalo',
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

$router->add("/quan-tri/xoa-danh-muc-trang-chu{id:[0-9]+}", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'confighome',
    'action' => 'delete',
    'id' => 1,
]);

/* Thông tin trang chủ */
$router->add("/quan-tri/thong-tin-trang-chu", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'info',
]);



/* slider*/
$router->add("/quan-tri/slider", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'box_images',
    'type' => '1'
]);

$router->add("/quan-tri/chinh-sua-slider", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'box_images',
    'type' => '1'
]);

$router->add("/quan-tri/xoa-slider", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'delete_image',
    'type' => '1'
]);

/* Banner quảng cáo */
$router->add("/quan-tri/banner-quang-cao", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'box_images',
    'type' => '2'
]);

$router->add("/quan-tri/chinh-sua-banner", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'box_images',
    'type' => '2'
]);

$router->add("/quan-tri/xoa-banner", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'delete_image',
    'type' => '2'
]);

/* Khối thương hiệu */
$router->add("/quan-tri/khoi-thuong-hieu", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'box_images',
    'type' => '3'
]);

$router->add("/quan-tri/chinh-sua-thuong-hieu", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'box_images',
    'type' => '3'
]);

$router->add("/quan-tri/xoa-thuong-hieu", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'config',
    'action' => 'delete_image',
    'type' => '3'
]);


/* Module bài viết */
$router->add("/quan-tri/quan-ly-bai-viet", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'article',
    'action' => 'index',
]);

$router->add("/quan-tri/them-bai-viet", [
    'module' => 'backend',
    'namespace' => 'Graduate\Backend\Controllers',
    'controller' => 'article',
    'action' => 'add',
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

/* Khách hàng*/
$router->add("/dang-ki.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'auth',
    'action' => 'register',
]);

$router->add("/dang-nhap.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'auth',
    'action' => 'login',
]);

$router->add("/dang-xuat", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'auth',
    'action' => 'logout',
]);

$router->add("/thong-tin-khach-hang.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'customer',
    'action' => 'index',
]);

$router->add("/thay-doi-mat-khau.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'customer',
    'action' => 'update_password',
]);

$router->add("/don-hang.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'customer',
    'action' => 'order',
]);

$router->add("/chi-tiet-don-hang-p{id:[0-9]+}.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'customer',
    'action' => 'order_detail',
]);

$router->add("/dat-hang.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'shopping',
    'action' => 'order_info',
]);

$router->add("/gio-hang.html", [
    'module' => 'frontend',
    'namespace' => 'Graduate\Frontend\Controllers',
    'controller' => 'shopping',
    'action' => 'cart',
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