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
                            <li><a href="/thong-tin-khach-hang.html"><?= $auth['email'] ?></a></li>
                            <li><a href="/dang-xuat">Thoát </a></li>
                        </ul>
                    <?php } else { ?>
                        <ul class="menu">
                            <li><a href="/dang-nhap.html">Đăng nhập</a></li>
                            <li><a href="/dang-ki.html">Đăng ký </a></li>
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
                        </span>
                    </div>
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
                    <div class="sidebar-widget widget_shopping_cart">
    <h3 class="sidebar-header">Giỏ hàng</h3>
    <div class="widget_shopping_cart_content">
        <div class="mini-cart-overview dropdown navbar-right">
            <a data-toggle="dropdown" href="/shopping/cart">
                <i class="icon icon-bag animated pulse-two"></i>
                <span class="mini-cart-count total-item-cart"><?= ($this->cart->getTotalProduct() > 0 ? $this->cart->getTotalProduct() : 0) ?></span>
                <span class="amount total_price total"><?= number_format($this->cart->getTotalPrice()) ?> ₫</span>
            </a>
            <div class="product__shopcart">
                <ul class="dropdown-menu product_list_widget product__list">
                    <?php foreach ($this->cart->getContent() as $item) { ?>
                        <li>
                            <div class="product-mini tr">
                                <input type="hidden" class="rowId" value="<?= $item['id'] ?>">
                                <div class="product-image">
                                    <a href="shop-simple-product.html"> <img alt="<?= $item['name'] ?>" height="114" src="<?= $item['avatar'] ?>" width="90"> </a>
                                </div>
                                <div class="product-details">
                                    <h4 class="product-details-heading">
                                        <a href="<?= $this->uiHelper->makeLinkProduct($item) ?>">
                                            <?= $item['name'] ?>
                                            <?php foreach ($item['attribute'] as $value) { ?>
                                                - <?= $value['attribute_name'] ?>
                                            <?php } ?>
                                        </a>
                                    </h4>
                                    <p></p>
                                    <p><span class="quantity"><?= $item['quantity'] ?> × <span class="amount product__price__regular"><?= number_format($item['price_sell']) ?></span></span></p>
                                    <div class="btn-delete">
                                        <a class="remove product__delete pointer" title="Xóa sản phẩm" onclick="deleteProduct(<?= $item['id'] ?>)">×</a></div>
                                    </div>
                            </div>
                        </li>
                    <?php } ?>
                    <li>
                        <p class="total"><strong>Tổng tiền:</strong> <span class="amount"><?= number_format($this->cart->getTotalPrice()) ?> đ</span></p>
                        <div class="buttons">
                            <a href="/shopping/cart">Xem giỏ hàng</a>
                            <?php if ($auth) { ?>
                                <a href="/shopping/order_info">Thanh toán</a>
                            <?php } else { ?>
                                <a href="/auth/pay">Thanh toán</a>
                            <?php } ?>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- end product list -->
        </div>
    </div>
</div>
                </div>
            </nav>
        </div>
    </div>
</div>