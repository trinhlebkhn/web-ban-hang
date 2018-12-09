{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    {#{{ partial('layouts/breadcrumb', ['PageInfo' : PageInfo]) }}#}

    <!-- Main content -->
    <section class="content box-index">
        <div class="row">
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow pointer">
                    <div class="inner">
                        <h3>{{ uiHelper.formatNumber(totalUsers) }}</h3>

                        <p>Khách hàng đăng ký</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="/quan-tri/thanh-vien" class="small-box-footer">Xem thêm <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua pointer">
                    <div class="inner">
                        <h3>{{ uiHelper.formatNumber(totalBills) }}</h3>

                        <p>Tổng số hóa đơn</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-document-text"></i>
                    </div>
                    <a href="/quan-tri/hoa-don" class="small-box-footer">Xem thêm <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green pointer">
                    <div class="inner">
                        <h3>{{ uiHelper.formatNumber(totalRevenue) }} VNĐ</h3>

                        <p>Tổng doanh thu</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-plus-round"></i>
                    </div>
                    <a href="/quan-tri/hoa-don" class="small-box-footer">Xem thêm <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
