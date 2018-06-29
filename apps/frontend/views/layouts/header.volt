{% include 'layouts/widget/widget-top-website.volt' %}
<div class="menu navbar navbar-static-top header-logo-center-menu-below oxy-mega-menu text-caps" id="masthead">
    <div class="logo-navbar container-logo">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" data-target=".main-navbar" data-toggle="collapse" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="shop-index.html"> <img alt="Lambda Theme - Shop" src="{{ websiteConfig.logo_file is not empty? websiteConfig.logo_file : resourcePAth~'assets/images/shop/lambda-shop.png' }}"> </a>
                <div class="logo-sidebar"></div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="nav-container clearfix">
            <nav class="collapse navbar-collapse main-navbar">
                <div class="menu-container">
                    <ul class="nav navbar-nav" id="menu-main">
                        {{ uiHelper.drawRecursiveMenu('layouts/recursive/main-menu', mainMenu) }}
                    </ul>
                </div>
                <div class="menu-sidebar">
                    {% include "layouts/widget/widget-cart.volt" %}
                </div>
            </nav>
        </div>
    </div>
</div>