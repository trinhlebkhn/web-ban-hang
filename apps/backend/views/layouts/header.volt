<header class="main-header">
    <!-- Logo -->
    <a class="logo pointer" href="/quan-tri">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>AD</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>ADMIN</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->

    <nav class="navbar navbar-static-top">
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                {% if admin %}
                    <li>
                        <a href="/quan-tri/dang-xuat" style="font-size: 21px" title="Đăng xuất"><i class="fa fa-sign-out"></i></a>
                    </li>
                {% endif %}
            </ul>
        </div>
    </nav>

</header>