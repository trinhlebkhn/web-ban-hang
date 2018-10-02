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
<div id="content" role="main">
    <div id="page-register" role="dialog">
        <form id="form-register" method="post">
            
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Đăng ký tài khoản</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-7 col-xs-12 col-sm-7 account__input">
                                <div class="form-group">
                                    <div class="row">
                                        <?= $this->flash->output() ?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Email:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input name="pageRegister[email]" autofocus value="<?= $data['email'] ?>" type="email" class="form-control" placeholder="Email..." maxlength="40" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Mật khẩu:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input type="password" id="pageRegister_password" name="pageRegister[password]" class="form-control" placeholder="Mật khẩu từ 6 đến 32 ký tự" maxlength="32" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Nhập lại mật khẩu:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input type="password" id="repassword" name="pageRegister[password_again]" class="form-control" maxlength="32" placeholder="*******" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Họ tên:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input name="pageRegister[fullname]" type="text" value="<?= $data['fullname'] ?>" class="form-control" placeholder="Nhập họ tên" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Giới tính:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <div class="row">
                                                <div class="col-xs-4">
                                                    <div class="check__action -radio">
                                                        <input type="radio" checked="checked" value="1" class="checkbox" name="pageRegister[gender]" required>
                                                        <span class="icon"></span>
                                                        Nam
                                                    </div>
                                                </div>
                                                <div class="col-xs-4">
                                                    <div class="check__action -radio">
                                                        <input type="radio" class="checkbox" value="2" name="pageRegister[gender]" required>
                                                        <span class="icon"></span>
                                                        Nữ
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Số điện thoại:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input name="pageRegister[phone]" type="text" value="<?= $data['phone'] ?>" class="form-control" placeholder="Nhập số điện thoại" maxlength="14" minlength="8" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Ngày Sinh:</div>
                                        </div>
                                        <div class="input__wrap pageBirthday-picker">
                                            <select class="birth-day form-control" name="pageRegister_birth[day]" required>
                                                <option value="">Ngày</option>
                                                <?php foreach (range(1, 31) as $i) { ?>
                                                    <option value="<?= $i ?>"><?= $i ?></option>
                                                <?php } ?>
                                            </select>
                                            <select class="birth-month form-control" name="pageRegister_birth[month]" required>
                                                <option value="">Tháng</option>
                                                <?php foreach (range(1, 12) as $i) { ?>
                                                    <option value="<?= $i ?>"><?= $i ?></option>
                                                <?php } ?>
                                            </select>
                                            <select class="birth-year form-control" name="pageRegister_birth[year]" required>
                                                <option value="">Năm</option>
                                                <?php $yearCurrent = date('Y'); ?>
                                                <?php $maxYear = $yearCurrent - 14; ?>
                                                <?php foreach (range($maxYear, 1990) as $i) { ?>
                                                    <option value="<?= $i ?>"><?= $i ?></option>
                                                <?php } ?>
                                            </select>
                                            <div id="register_notification_date" style="display: none" class="displaynone help-block">Ngày sinh không hợp lệ</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="register check__action">
                                        <div class="checkbox">
                                            <label onclick="check_idea_register()">
                                                <input name="pageRegister_has" id="agree_idea" class="input-checkbox checkbox pageRegister_has" type="checkbox" required> Tôi đồng ý mọi điều khoản của Website
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div id="myCaptcha" class="g-recaptcha" data-sitekey="<?= $google_captcha->site_key ?>"></div>
                                <br>
                                <div class="form-group login__action">
                                    <button type="submit" id="pageRegister_btn" class="btn btn-submit">Đăng Ký</button>
                                </div>
                                <div class="login__note">
                                    Bạn đã có tài khoản? <a href="/auth/login">Đăng nhập</a>
                                </div>
                            </div>
                            <div class="account_login__social col-md-5 col-xs-12 col-sm-5">
                                <div class="title"><span>Đăng nhập với </span></div>
                                <div class="list__buttons">
                                    
                                    <a href="<?= $facebook_login ?>/auth/website_google?domain=http://<?= $domain ?>/auth/google" class="btn btn-google">
                                        
                                        <span class="-ap icon-google icon"></span>
                                        Đăng nhập với Google
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>
