<header class="main-header">
    <!-- Logo -->
    <a class="logo pointer">
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
                <?php if ($admin) { ?>
                    <li>
                        <a href="/quan-tri/dang-xuat" style="font-size: 21px" title="Đăng xuất"><i class="fa fa-sign-out"></i></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </nav>

</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->

    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/assets_backend/assets/img/logobiznet.png" class="img-circle" alt="logo đại lý">
            </div>
            <div class="pull-left info">
                <p><?= $AgencyInfo->company_name ?></p>
                <a href="#"><i class="fa fa-user-circle"></i> <?= $AgencyInfo->name ?></a>
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

<div class="content-wrapper">
    <section class="content box-slider">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <div class="row title">
                            <h3 class="col-md-12 box-title">Cấu hình slider</h3>
                        </div>
                        <form action="" method="post">
                            <div class="row add-slider">
                                <div class="col-md-3">
                                    <div class="<?= ($data['avatar'] == null ? '' : 'hidden') ?> blog-avatar boxborder text-center d-flex justify-content-center align-items-center pointer"
                                         onclick="avatar.click()">
                                        <div class="d-inline-block" style="margin: auto">
                                            <p>Ảnh</p>
                                        </div>
                                    </div>
                                    <div class="img-avatar <?= ($data['avatar'] == null ? 'hidden' : '') ?>"
                                         style="position: relative">
                                        <img id="blog_avatar" src="<?= $data['avatar'] ?>" alt="">
                                        <i class="fa fa-trash text-danger pointer"
                                           style="position: absolute;top: 10px;right: 15px"
                                           onclick="removeImage()"></i>
                                    </div>
                                    <input #avatar class="hidden" type="file" id="avatar"
                                           onchange="uploadImage(avatar,avatar.files[0])">
                                    <input class="hidden" name="data[avatar]" value="<?= $data['avatar'] ?>"
                                           id="src_avatar" type="text">
                                </div>
                                <div class="col-md-9">
                                    <div class="form-gorup">
                                        <label>Đường dẫn</label>
                                        <input type="text" class="form-control" name="data[link]"
                                               placeholder="Đường dẫn">
                                    </div>
                                    <div class="form-group btn-add-slider">
                                        <button type="submit" class="btn btn-primary pointer">Thêm slider
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="table-responsive">
                        <?= $this->flash->output() ?>
                        <table class="table table-striped table-bordered table-contract">
                            <thead>
                            <tr>
                                <th style="width: 5%">#</th>
                                <th>Slider</th>
                                <th>Link</th>
                            </tr>
                            </thead>
                            <tbody class="list-cat-home-page">
                            <?php foreach ($listSliders as $index => $item) { ?>
                                <tr>
                                    <td><?= $index + 1 ?></td>
                                    <td width="20%">
                                        <div class="cover">
                                            <img src="<?= $item->avatar ?>" alt="Slider + <?= $index + 1 ?>">
                                        </div>
                                    </td>
                                    <td><?= $item->link ?></td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
</div>
<!-- /.content-wrapper -->

    
        
    
    
    

<!-- ./wrapper -->
