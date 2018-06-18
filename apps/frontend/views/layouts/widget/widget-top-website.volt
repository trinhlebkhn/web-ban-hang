<div class="top-bar">
    <div class="container">
        {% if websiteConfig.location[0].openhours is not empty %}
            <div class="top top-left">
                <div class="sidebar-widget text-left small-screen-center widget_text"> Giờ mở cửa: {{ websiteConfig.location[0].openhours }} </div>
            </div>
        {% endif %}
        <div class="top top-right">
            <div class="sidebar-widget text-right small-screen-center widget_nav_menu" id="nav_menu-5">
                <div class="menu-top-bar-menu-container">
                    {% if auth %}
                        <ul class="menu">
                            <li><a href="/customer">{{ auth.email }}</a></li>
                            <li><a href="/auth/logout">Thoát </a></li>
                        </ul>
                    {% else %}
                        <ul class="menu">
                            <li><a href="/auth/login">Đăng nhập</a></li>
                            <li><a href="/auth/register">Đăng ký </a></li>
                        </ul>
                    {% endif %}
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