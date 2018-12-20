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
                <div class="logo pull-left">
                    <a class="navbar-brand" href="/"> <img alt="Lambda Theme - Shop"
                                                                    src="{{ websiteConfig['avatar'] is not empty? websiteConfig['avatar'] : resourcePAth~'assets/images/shop/lambda-shop.png' }}">
                    </a>
                </div>
                <div class="logo-sidebar"></div>
                <div class="menu-sidebar pull-right">
                    <div class="sidebar-widget text-right small-screen-center widget_search">
                        <form action="{{ Current_link is not empty ? Current_link : 'tim-kiem.html' }}" method="get"
                              name="searchform">
                            <div class="input-group"><input class="form-control" id="query" name="strSearch"
                                                            placeholder="Tìm kiếm......"
                                                            value="{{ strSearch is not empty ? strSearch : '' }}"
                                                            type="text">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="submit" id="searchsubmit" value="Search">
                                    <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </div>
                    {% include "layouts/widget/widget-cart.volt" %}
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12 desktop-cat">
                {% include "layouts/widget/widget-category.volt" %}
            </div>
            <div class="col-md-9 col-sm-12 col-xs-12">
                <div class="nav-container clearfix box-menu">
                    <nav class="collapse navbar-collapse main-navbar">
                        <div class="row">
                            <div class="col-sm-6 cat-ipad">
                                {% include "layouts/widget/widget-category.volt" %}
                            </div>
                            <div class="col-md-12 col-sm-6">
                                <div class="menu-container">
                                    <ul class="nav navbar-nav" id="menu-main">
                                        {{ uiHelper.drawRecursiveMenu('layouts/recursive/main-menu', mainMenu) }}
                                        <li class="menu-item"><a href="/lien-he.html">Liên hệ</a></li>
                                    </ul>
                                </div>
                                <div class="menu-sidebar">
                                    {% include "layouts/widget/widget-cart.volt" %}
                                </div>
                                {% include "layouts/widget/widget-category.volt" %}
                                <div class="menu-sidebar form-search">
                                    <div class="sidebar-widget text-right small-screen-center widget_search">
                                        <form action="{{ Current_link is not empty ? Current_link : 'tim-kiem.html' }}"
                                              method="get" name="searchform">
                                            <div class="input-group"><input class="form-control" id="query"
                                                                            name="strSearch"
                                                                            placeholder="Tìm kiếm......" type="text"
                                                                            value="{{ strSearch is not empty ? strSearch : '' }}">
                                                <span class="input-group-btn">
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
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>