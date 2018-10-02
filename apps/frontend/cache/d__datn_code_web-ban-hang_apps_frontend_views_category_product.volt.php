<div class="top-bar">
    <div class="container">
        <?php if (!empty($websiteConfig->location[0]->openhours)) { ?>
            <div class="top top-left">
                <div class="sidebar-widget text-left small-screen-center widget_text"> Giờ mở cửa: <?= $websiteConfig->location[0]->openhours ?> </div>
            </div>
        <?php } ?>
        <div class="top top-right">
            <div class="sidebar-widget text-right small-screen-center widget_nav_menu" id="nav_menu-5">
                <div class="menu-top-bar-menu-container">
                    <?php if ($auth) { ?>
                        <ul class="menu">
                            <li><a href="/customer"><?= $auth->email ?></a></li>
                            <li><a href="/auth/logout">Thoát </a></li>
                        </ul>
                    <?php } else { ?>
                        <ul class="menu">
                            <li><a href="/auth/login">Đăng nhập</a></li>
                            <li><a href="/auth/register">Đăng ký </a></li>
                        </ul>
                    <?php } ?>
                </div>
            </div>
            <div class="sidebar-widget text-right small-screen-center widget_search">
                <form action="shop-index.html" method="get" name="searchform">
                    <div class="input-group"><input class="form-control" id="s" name="s" placeholder="Search" type="text"> <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit" id="searchsubmit" value="Search">
                                <i class="fa fa-search"></i>
                            </button>
                        </span></div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="menu navbar navbar-static-top header-logo-center-menu-below oxy-mega-menu text-caps" id="masthead">
    <div class="logo-navbar container-logo">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" data-target=".main-navbar" data-toggle="collapse" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="shop-index.html"> <img alt="Lambda Theme - Shop" src="<?= (!empty($websiteConfig->logo_file) ? $websiteConfig->logo_file : $resourcePAth . 'assets/images/shop/lambda-shop.png') ?>"> </a>
                <div class="logo-sidebar"></div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="nav-container clearfix">
            <nav class="collapse navbar-collapse main-navbar">
                <div class="menu-container">
                    <ul class="nav navbar-nav" id="menu-main">
                        <?= $this->uiHelper->drawRecursiveMenu('layouts/recursive/main-menu', $mainMenu) ?>
                    </ul>
                </div>
                <div class="menu-sidebar">
                    
                </div>
            </nav>
        </div>
    </div>
</div>
<div id="content" role="main">
    <article>
        <?= $this->partial('layouts/widget/widget-top-page-cat-product', ['catInfo' => $catInfo]) ?>
        <section class="section">
            <div class="container element-top-50 element-bottom-50">
                <div class="row">
                    <div class="col-md-4">
                        <?= $this->partial('layouts/breadcrumb', ['catInfo' => $catInfo]) ?>
                    </div>
                    <div class="col-md-5 text-right">
                        <p class="woocommerce-result-count"> Có tất cả <?= $Paginginfo['total_items'] ?> kêt quả </p>
                        <form class="woocommerce-ordering" method="get"><select name="orderby" class="orderby">
                                <option value="menu_order" selected='selected'>Mặc định</option>
                                
                                
                                
                                <option value="price">Giá tăng dần</option>
                                <option value="price-desc">Giá giảm dần</option>
                            </select>
                        </form>
                    </div>
                    <div class="col-md-3">
                        <div class="sidebar-widget">
                            <form role="search" method="get" id="searchform">
                                <div class="input-group">
                                    <input type="text" value="" name="s" class="form-control" placeholder="Tìm kiếm">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit" id="searchsubmit" value="">
                                            <i class="fa fa-search"></i>
                                        </button>
                                        <input type="hidden" name="post_type" value="product">
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <ul class="products list-container">
                        <?php foreach ($listData as $product) { ?>
                            <?= $this->partial('layouts/template-part/product-item', ['product' => $product]) ?>
                        <?php } ?>
                    </ul>
                    <div class="clear-fix"></div>
                    <?php if ($Paginginfo['total_page'] > 1 && $Paginginfo['total_page'] <= 5) { ?>
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="<?= $Current_link ?>?p=<?= ($Paginginfo['curent_page'] == 1 ? 1 : $Paginginfo['curent_page'] - 1) ?><?= $paramSearch ?>">Prev</a>
            </li>
            <?php foreach (range(1, $Paginginfo['total_page']) as $i) { ?>
                <li class="page-item <?= ($i == $Paginginfo['curent_page'] ? 'active' : '') ?>"><a class="page-link" href="<?= $Current_link ?>?p=<?= $i ?><?= $paramSearch ?>"><?= $i ?></a></li>
            <?php } ?>
            <li class="page-item">
                <a class="page-link" href="<?= $Current_link ?>?p=<?= ($Paginginfo['curent_page'] == $Paginginfo['total_page'] ? $Paginginfo['total_page'] : $Paginginfo['curent_page'] + 1) ?><?= $paramSearch ?>">Next</a>
            </li>
        </ul>
    </nav>
<?php } elseif ($Paginginfo['total_page'] > 5) { ?>
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="<?= $Current_link ?>?p=<?= ($Paginginfo['curent_page'] == 1 ? 1 : $Paginginfo['curent_page'] - 1) ?><?= $paramSearch ?>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <?php if ($Paginginfo['curent_page'] > 3 && $Paginginfo['curent_page'] <= $Paginginfo['total_page'] - 3) { ?>
                <li class="page-item">
                    <a class="page-link" href="<?= $Current_link ?>?p=1<?= $paramSearch ?>">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                <?php $MinPageView = $Paginginfo['curent_page'] - 1; ?>
                <?php $MaxPageView = $Paginginfo['curent_page'] + 1; ?>
                <?php foreach (range($MinPageView, $MaxPageView) as $i) { ?>
                    <li class="page-item <?= ($i == $Paginginfo['curent_page'] ? 'active' : '') ?>"><a class="page-link" href="<?= $Current_link ?>?p=<?= $i ?><?= $paramSearch ?>"><?= $i ?></a></li>
                <?php } ?>
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                <li class="page-item <?= ($Paginginfo['total_page'] == $Paginginfo['curent_page'] ? 'active' : '') ?>"><a class="page-link" href="<?= $Current_link ?>?p=<?= $Paginginfo['total_page'] ?><?= $paramSearch ?>"><?= $Paginginfo['total_page'] ?></a></li>

            <?php } elseif ($Paginginfo['curent_page'] > $Paginginfo['total_page'] - 3) { ?>
                <li class="page-item">
                    <a class="page-link" href="<?= $Current_link ?>?p=1<?= $paramSearch ?>">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                <?php $MinPageView = $Paginginfo['total_page'] - 2; ?>
                <?php foreach (range($MinPageView, $Paginginfo['total_page']) as $i) { ?>
                    <li class="page-item <?= ($i == $Paginginfo['curent_page'] ? 'active' : '') ?>"><a class="page-link" href="<?= $Current_link ?>?p=<?= $i ?><?= $paramSearch ?>"><?= $i ?></a></li>
                <?php } ?>

            <?php } else { ?>
                <?php foreach (range(1, 3) as $i) { ?>
                    <li class="page-item <?= ($i == $Paginginfo['curent_page'] ? 'active' : '') ?>"><a class="page-link" href="<?= $Current_link ?>?p=<?= $i ?><?= $paramSearch ?>"><?= $i ?></a></li>
                <?php } ?>
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                <li class="page-item <?= ($Paginginfo['total_page'] == $Paginginfo['curent_page'] ? 'active' : '') ?>"><a class="page-link" href="<?= $Current_link ?>?p=<?= $Paginginfo['total_page'] ?><?= $paramSearch ?>"><?= $Paginginfo['total_page'] ?></a></li>
            <?php } ?>
            <li class="page-item">
                <a class="page-link" href="<?= $Current_link ?>?p=<?= ($Paginginfo['curent_page'] == $Paginginfo['total_page'] ? $Paginginfo['total_page'] : $Paginginfo['curent_page'] + 1) ?><?= $paramSearch ?>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
<?php } ?>
<?php if ($Paginginfo['total_items'] == 0) { ?>
    <p class="text-success text-center" style="font-size: 15px;padding-top: 10px">Không tìm thấy kết quả nào</p>
<?php } ?>
                </div>
            </div>
        </section>
    </article>
</div>

