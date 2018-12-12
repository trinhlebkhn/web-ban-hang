<div class="top-bar">
    <div class="container">
        {% if websiteConfig['time_open'] is not empty or websiteConfig['time_close'] is not empty %}
            <div class="top top-left">
                <div class="sidebar-widget text-left small-screen-center widget_text"> Giờ mở cửa: {{ websiteConfig['time_open'] }} - {{ websiteConfig['time_close'] }} </div>
            </div>
        {% endif %}
        <div class="top top-right">
            <div class="sidebar-widget text-right small-screen-center widget_nav_menu" id="nav_menu-5">
                <div class="menu-top-bar-menu-container">
                    {% if auth %}
                        <ul class="menu">
                            <li><a href="/thong-tin-khach-hang.html">{{ auth['email'] }}</a></li>
                            <li><a href="/dang-xuat">Thoát </a></li>
                        </ul>
                    {% else %}
                        <ul class="menu">
                            <li><a href="/dang-nhap.html">Đăng nhập</a></li>
                            <li><a href="/dang-ki.html">Đăng ký </a></li>
                        </ul>
                    {% endif %}
                </div>
            </div>
            {#<div class="sidebar-widget text-right small-screen-center widget_search">#}
                {#<form action="shop-index.html" method="get" name="searchform">#}
                    {#<div class="input-group"><input class="form-control" id="s" name="s" placeholder="Search" type="text"> <span class="input-group-btn">#}
                            {#<button class="btn btn-primary" type="submit" id="searchsubmit" value="Search">#}
                                {#<i class="fa fa-search"></i>#}
                            {#</button>#}
                        {#</span>#}
                    {#</div>#}
                {#</form>#}
            {#</div>#}
        </div>
    </div>
</div>