<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header">
                    <div class="row title">
                        <h3 class="box-title">Danh sách đơn hàng</h3>
                        {#<div class="pull-right">#}
                        {#<a href="/quan-tri/tao-moi-danh-muc" class="btn btn-primary pointer">Thêm mới danh mục</a>#}
                        {#</div>#}
                    </div>
                    {% include 'layouts/filter/filter_bill.volt' %}
                </div>
                <div class="table-responsive">
                    {{ this.flash.output() }}
                    <table class="table table-striped table-bordered table-bill">
                        <thead>
                        <tr>
                            <th style="width: 5%">Đơn hàng</th>
                            <th>Khách hàng</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for item in listBill %}
                            <tr>
                                <td class="code-bill" width="20%">
                                    <div><a href="/quan-tri/chi-tiet-hoa-don-hd{{ item['id'] }}">HD{{ item['id'] }}</a></div>
                                    <div><i class="fa fa fa-clock-o color-gray-icon"></i> {{ item['date_create'] }}</div>
                                    <div><i class="fa fa fa-envelope"></i>{{ item['email'] }}</div>
                                </td>
                                <td class="customer-bill">
                                    <div><i class="fa fa-phone color-gray-icon"></i> {{ item['phone'] }}</div>
                                    <div><i class="fa fa-user color-gray-icon"></i>{{ item['customer_name'] }}</div>
                                    <div><i class="fa fa-map-marker color-gray-icon"></i>{{ item['address'] }}</div>
                                </td>
                                <td>

                                    <button type="button" class="btn btn-success pointer">Hoạt động</button>
                                </td>
                                <td class="communication">
                                    <a href="">
                                        <button class="pointer bg-green" title="Xác nhận"><i class="fa fa-check"></i></button>
                                    </a>
                                    <a href="">
                                        <button class="pointer bg-red" title="Hủy"><i class="fa fa-times"></i></button>
                                    </a>
                                    <a href="">
                                        <button class="pointer bg-yellow" title="Gọi lại"><i class="fa fa-phone"></i></button>
                                    </a>
                                </td>
                            </tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </div>
                <div class="pagination pull-right">
                    {% include 'layouts/pagination.volt' %}
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
