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
        <ul class="sidebar-menu" data-widget="tree">
            <li>
                <a href="/quan-tri/thanh-vien">
                    <i class="fa fa-user-circle-o"></i>
                    <span>Quản lý thành viên</span>
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
                    <i class="fa fa-tags"></i>
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
                <a href="/quan-tri/cau-hinh-trang-chu">
                    <i class="fa fa-window-maximize"></i>
                    <span>Cấu hình trang chủ</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cogs" aria-hidden="true"></i> <span>Cấu hình</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                         </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="/quan-tri/slider">
                            <i class="fa fa-arrows" aria-hidden="true"></i>
                            <span>Cấu hình slide</span>
                        </a>
                    </li>
                    <li>
                        <a href="/ket-cau">
                            <i class="fa fa-cog" aria-hidden="true"></i>
                            <span>Cấu hình banner quảng cáo</span>
                        </a>
                    </li>
                    <li>
                        <a href="/danh-gia">
                            <i class="fa fa-line-chart" aria-hidden="true"></i>
                            <span>Quản lý đánh giá</span>
                        </a>
                    </li>
                    <li>
                        <a href="/duong">
                            <i class="fa fa-road" aria-hidden="true"></i>
                            <span>Quản lý danh sách đường</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>