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
<!-- End menu -->


<script>
    $(document).ready(function () {
        //        $("#popup").click();
    });
</script>
<div id="content" role="main">
    <article>
        
        <?php foreach ($cat_home_data as $item) { ?>
    <section class="section">
        <div class="container container-vertical-middle">
            <div class="row vertical-middle">
                <div class="col-md-3">
                    <h2 class="text-left element-top-20 element-bottom-20 text-normal os-animation normal default" data-os-animation="fadeIn" data-os-animation-delay="0s">
                        <a class="category_home" href="<?= $this->uiHelper->makeLinkCategory($item) ?>"><?= $item->name ?></a>
                    </h2>
                </div>
                <div class="col-md-9">
                    <hr class="element-top-0 element-bottom-0 os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                </div>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="divider-wrapper">
                        <div class="visible-xs element-height-30"></div>
                        <div class="visible-sm element-height-30"></div>
                        <div class="visible-md element-height-30"></div>
                        <div class="visible-lg element-height-30"></div>
                    </div>
                    <div class="woocommerce columns-4">
                        <div class="row">
                            <ul class="products">
                                <?php $arrayListProduct = array_chunk($item->product, 4); ?>
                                <?php foreach ($arrayListProduct[0] as $product) { ?>
                                    <?= $this->partial('layouts/template-part/product-item', ['product' => $product]) ?>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php if ($index == 0) { ?>
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="figure element-top-30 element-bottom-30 os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                            <a class="figure-image" href="shop-mens-category.html" target="_self"> <img alt="box_feature_1" src="<?= $websiteConfig->box_feature->images[0]->image ?>"> </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <?php } elseif ($index == 1) { ?>
        <section class="section">
            <div class="container">
                <div class="row">
                    <?php foreach ($websiteConfig->box_feature->images as $i => $v) { ?>
                        <?php if ($i > 0) { ?>
                            <div class="col-md-4 text-center">
                                <div class="figure element-top-20 element-bottom-20 image-effect-zoom-in os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                                    <a class="figure-image" href="shop-mens-category.html" target="_self"> <img alt="" src="<?= $v->image ?>"> </a>
                                </div>
                            </div>
                        <?php } ?>
                    <?php } ?>
                </div>
            </div>
        </section>
    <?php } ?>
<?php } ?>

        
    </article>
</div>


