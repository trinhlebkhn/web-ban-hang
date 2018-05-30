{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="invoice">
        <div class="row" style="background: #ffffff; padding-bottom: 20px">
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        Chi tiết đơn hàng DH1
                        <small class="pull-right">Ngày tạo đơn: {{ data['date_create'] }}</small>
                    </h2>
                </div>
                <!-- /.col -->
            </div>
            <!-- info row -->
            <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                    <address>
                        Tên khách hàng: {{ data['customer_name'] }}<br>
                        Địa chỉ: {{ data['address'] }}<br>
                        Điện thoại: {{ data['phone'] }}<br>
                        Email: {{ data['email'] }}
                    </address>
                </div>
                <div class="col-sm-4 invoice-col">
                    <b>Invoice #007612</b><br>
                    <br>
                    <b>Order ID:</b> 4F3S8J<br>
                    <b>Payment Due:</b> 2/22/2014<br>
                    <b>Account:</b> 968-34567
                </div>
            </div>
            <!-- /.row -->

            <!-- Table row -->
            <div class="row">
                <div class="col-xs-12 table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Số lượng</th>
                            <th>Sản phẩm</th>
                            <th>Mã sản phẩm</th>
                            <th>Mô tả</th>
                            <th>Giá</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for item in data['list_product']%}
                            <tr>
                                <td>{{ item['quantity'] }}</td>
                                <td>{{ item['product_name'] }}</td>
                                <td>SP{{ item['product_id'] }}</td>
                                <td>{{ item['price'] }}</td>
                                <td>{{ item['subtotal'] }}</td>
                            </tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

            <div class="row">
                <!-- accepted payments column -->
                <div class="col-xs-6">
                    <p class="lead">Payment Methods:</p>
                    <img src="../../dist/img/credit/visa.png" alt="Visa">
                    <img src="../../dist/img/credit/mastercard.png" alt="Mastercard">
                    <img src="../../dist/img/credit/american-express.png" alt="American Express">
                    <img src="../../dist/img/credit/paypal2.png" alt="Paypal">

                    <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg
                        dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
                    </p>
                </div>
                <!-- /.col -->
                <div class="col-xs-6">
                    <p class="lead">Amount Due 2/22/2014</p>

                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th style="width:50%">Subtotal:</th>
                                <td>$250.30</td>
                            </tr>
                            <tr>
                                <th>Tax (9.3%)</th>
                                <td>$10.34</td>
                            </tr>
                            <tr>
                                <th>Shipping:</th>
                                <td>$5.80</td>
                            </tr>
                            <tr>
                                <th>Total:</th>
                                <td>$265.24</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!-- /.col -->
            </div>
        </div>
    </section>
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
