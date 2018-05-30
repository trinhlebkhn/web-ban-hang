<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->

    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/assets_backend/assets/img/logobiznet.png" class="img-circle" alt="logo đại lý">
            </div>
            <div class="pull-left info">
                <p>{{ AgencyInfo.company_name }}</p>
                <a href="#"><i class="fa fa-user-circle"></i> {{ AgencyInfo.name }}</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Tìm kiếm...">
                <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i
                                    class="fa fa-search"></i>
                        </button>
                    </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li>
                <a href="/">
                    <i class="fa fa-user-circle-o"></i>
                    <span>Quản lý thành viên</span>
                    {#<span class="pull-right-container">#}
                    {#<i class="fa fa-angle-left pull-right"></i>#}
                    {#</span>#}
                </a>
            </li>
            <li>
                <a href="/quan-tri/danh-muc">
                    <i class="fa fa-list"></i>
                    <span>Quản lý danh mục</span>
                </a>
            </li>
            <li>
                <a href="/quan-tri/san-pham">
                    <i class="fa fa-product-hunt"></i>
                    <span>Quản lý sản phẩm</span>
                </a>
            </li>
            <li>
                <a href="/quan-tri/menu-block">
                    <i class="fa fa-product-hunt"></i>
                    <span>Quản lý menu</span>
                </a>
            </li>
            <li class="treeview">
                <a href="/contract">
                    <i class="fa fa-edit"></i>
                    <span>Quản lý bài viết</span>
                </a>
            </li>
            <li>
                <a href="/quan-tri/hoa-don">
                    <i class="fa fa-briefcase"></i>
                    <span>Quản lý hóa đơn</span>
                </a>
            </li>
            <li>
                <a href="/agency">
                    <i class="fa fa-fw fa-cogs"></i> <span>Cấu hình</span>
                    {#<span class="pull-right-container">#}
                    {#<i class="fa fa-angle-left pull-right"></i>#}
                    {#</span>#}
                </a>
                {#<ul class="treeview-menu">#}
                {#<li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i>Blog</a>#}
                {#</li>#}
                {#</ul>#}
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>