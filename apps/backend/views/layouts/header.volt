<header class="main-header">
    <!-- Logo -->
    <a href="/" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>BIZ</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>BIZSALE</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->

    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        {% if AgencyInfo.datecreate|length > 0 %}
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="../assets/img/logobiznet.png" class="user-image" alt="User Image">
                            <span class="hidden-xs">{{ AgencyInfo.company_name }}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="../assets/img/logobiznet.png" class="img-circle" alt="User Image">

                                <p>
                                    {{ AgencyInfo.name }}
                                    <small>Ngày đăng ký: {{ AgencyInfo.datecreate }}</small>
                                </p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="/agency/index" class="btn btn-default btn-flat">Hồ Sơ</a>
                                </div>
                                <div class="pull-right">
                                    <a href="/auth/logout" class="btn btn-default btn-flat">Đăng Xuất</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        {% endif %}
    </nav>

</header>