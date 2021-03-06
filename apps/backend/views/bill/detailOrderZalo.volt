{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="invoice">
        <div class="row" style="background: #ffffff; padding-bottom: 20px">
            <div class="col-xs-12">
                <h2 class="page-header">
                    Chi tiết đơn hàng {{ data['id'] }}
                    <small class="pull-right">Ngày tạo đơn: {{ data['date_create'] }}</small>
                </h2>
            </div>
            <!-- info row -->
            <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                    <address style="line-height: 26px;">
                        <b>Tên khách hàng:</b> {{ data['customerName'] }}<br>
                        <b>Địa chỉ:</b> {{ data['deliverAddress'] }}<br>
                        <b>Điện thoại:</b> {{ data['customerPhone'] }}<br>
                    </address>
                </div>
            </div>
            <!-- /.row -->

            <!-- Table row -->
            <div class="row">
                <div class="col-xs-12 table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mã sản phẩm</th>
                            <th>Tên Sản phẩm</th>
                            <th>Giá (/1 sản phẩm - VNĐ)</th>
                            <th>Số lượng</th>
                            <th>Giá tạm tính (VNĐ)</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for index, item in data['list_product'] %}
                            <tr>
                                <td>{{ index + 1 }}</td>
                                <td>SP{{ item['product_id'] }}</td>
                                <td>{{ item['product_name'] }}</td>
                                <td>{{ uiHelper.formatNumber(item['price']) }}</td>
                                <td>{{ item['quantity'] }}</td>
                                <td>{{ uiHelper.formatNumber(item['subtotal']) }}</td>
                            </tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">

                {% if data['status'] == 1 %}
                    <div class="col-xs-6">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th style="width:50%">Tạm tính:</th>
                                    <td>{{ uiHelper.formatNumber(data['price']) }} <b>VNĐ</b></td>
                                </tr>
                                <tr>
                                    <th>Phí ship:</th>
                                    <td>{{ uiHelper.formatNumber(data['ship_price']) }} <b>VNĐ</b></td>
                                </tr>
                                <tr>
                                    <th>Tổng tiền:</th>
                                    <td>{{ uiHelper.formatNumber(data['total_price']) }} <b>VNĐ</b></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="table-responsive">
                            <table class="table">
                                <form method="post">
                                    <tr>
                                        <th>Số tiền đã thanh toán:</th>
                                        <td>
                                            <input class="form-control" name="payment" type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <button type="submit" class="form-control btn-primary">Cập nhật</button>
                                        </td>
                                    </tr>
                                </form>
                            </table>
                        </div>
                    </div>
                {% endif %}
                {% if data['status'] != 1 %}
                    <div class="col-xs-6">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th style="width:50%">Tạm tính:</th>
                                    <td>{{ uiHelper.formatNumber(data['price']) }} <b>VNĐ</b></td>
                                </tr>
                                <tr>
                                    <th>Phí ship:</th>
                                    <td>{{ uiHelper.formatNumber(data['ship_price']) }} <b>VNĐ</b></td>
                                </tr>
                                <tr>
                                    <th>Tổng tiền:</th>
                                    <td>{{ uiHelper.formatNumber(data['total_price']) }} <b>VNĐ</b></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th>Số tiền đã thanh toán:</th>
                                    <td>
                                        {{ uiHelper.formatNumber(data['payment']) }} <b>VNĐ</b>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Còn lại:</th>
                                    <td>
                                        {{ uiHelper.formatNumber(data['total_price'] - data['payment']) }}
                                        <b>VNĐ</b>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                {% endif %}
                <!-- /.col -->
            </div>
        </div>
    </section>
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
