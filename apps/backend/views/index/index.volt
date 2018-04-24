{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    {#{{ partial('layouts/breadcrumb', ['PageInfo' : PageInfo]) }}#}

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        {#<h3>{{ DashboardInfo['total_customer'] ? DashboardInfo['total_customer'] : "0" }}</h3>#}

                        <p>Khách hàng đăng ký</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="/customer" class="small-box-footer">Xem thêm <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        {#<h3>{{ DashboardInfo['total_contract'] ? DashboardInfo['total_contract'] : "0" }}</h3>#}

                        <p>Hợp đồng</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-document-text"></i>
                    </div>
                    <a href="/contract" class="small-box-footer">Xem thêm <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        {#<h3>{{ uihelper.format_number(DashboardInfo['sum_contract_new']) }} VNĐ</h3>#}

                        <p>Doanh thu hợp đồng mới</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-plus-round"></i>
                    </div>
                    <a href="/contract?type=new" class="small-box-footer">Xem thêm <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        {#<h3>{{ uihelper.format_number(DashboardInfo['sum_contract_extend']) }} VNĐ</h3>#}

                        <p>Doanh thu hợp đồng gia hạn thêm</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-ios-refresh-outline"></i>
                    </div>
                    <a href="/contract?type=extend" class="small-box-footer">Xem thêm <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
        </div>

        {#THỐNG KÊ KHÁCH HÀNG#}
        {#<div class="row">
            <div class="col-md-6">
                <!-- BAR CHART -->
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">Thống kê khách hàng</h3>

                        #}{#<div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>#}{#
                    </div>
                    <div class="box-body">
                        <div class="chart">
                            <canvas id="barChart_Customer" style="height:230px"></canvas>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

            </div>
        </div>#}
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
