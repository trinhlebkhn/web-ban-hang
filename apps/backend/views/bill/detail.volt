{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="invoice">
        <div class="row" style="background: #ffffff; padding-bottom: 20px">
            <div class="col-xs-12">
                <h2 class="page-header">
                    Chi tiết đơn hàng ĐH{{ data['id'] }}
                    <small class="pull-right">Ngày tạo đơn: {{ data['date_create'] }}</small>
                </h2>
            </div>
            <!-- info row -->
            <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                    <address style="line-height: 26px;">
                        <b>Tên khách hàng:</b> {{ data['customer_name'] }}<br>
                        <b>Địa chỉ:</b> {{ data['address'] }}<br>
                        <b>Điện thoại:</b> {{ data['phone'] }}<br>
                        <b>Email:</b> {{ data['email'] }}
                    </address>
                </div>
                <div class="col-sm-4 invoice-col" style="line-height: 26px;">
                    <b>Ngày chuyển tiền:</b> {{ data['date_payment'] }}<br>
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
                {% if data['status'] != 1 %}
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
                                        {{ uiHelper.formatNumber(data['total_price'] + data['ship_price'] - data['payment']) }}
                                        <b>VNĐ</b>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                {% endif %}
                <!-- /.col -->
            </div>
            {% if data['status'] == 2 %}
                <div class="row">
                    <div class="btn-vtp-driver">
                        <a href="/quan-tri/tao-van-don-hd-{{ data['id'] }}">
                            <button class="form-control btn-primary">Tạo vận đơn</button>
                        </a>
                    </div>
                </div>
            {% endif %}
        </div>
        {% if listOrderTracking is not empty %}
            <div class="row history_order-tracking" style="background: #ffffff; padding-bottom: 20px; padding-top: 20px;
    border-top: 1px dashed #bbb;">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        Hành trình vận đơn:
                    </h2>
                </div>
                <!-- info row -->
                <div class="col-xs-12">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Thời gian</th>
                            <th>Thông tin trạng thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for item in listOrderTracking %}
                            <tr>
                                <td>{{ item.ORDER_STATUSDATE }}</td>
                                <td>{{ item.ORDER_NOTE }}</td>
                            </tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
        {% endif %}
    </section>
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
