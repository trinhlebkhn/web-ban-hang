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
                    <table class="table  table-bill">
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
                                    <div>{{ item['orderCode'] }}</div>
                                    <div><i class="fa fa fa-clock-o color-gray-icon"></i> {{ item['createdTime'] }}
                                    </div>
                                </td>
                                <td class="customer-bill">
                                    <div><i class="fa fa-phone color-gray-icon"></i> {{ item['customerPhone'] }}</div>
                                    <div><i class="fa fa-user color-gray-icon"></i>{{ item['customerName'] }}</div>
                                    <div><i class="fa fa-map-marker color-gray-icon"></i>{{ item['deliverAddress'] }}</div>
                                </td>
                                <td class="bill-status">
                                    {% if item['status'] == 1 %}
                                        <div class="d-flex">
                                            <div class="circle bg-yellow"></div>
                                            <smal>Mới</smal>
                                        </div>
                                    {% elseif item['status'] == 2 %}
                                        <div class="d-flex">
                                            <div class="circle bg-green"></div>
                                            <smal>Xác nhận</smal>
                                        </div>
                                    {% elseif item['status'] == 3 %}
                                        <div class="d-flex">
                                            <div class="circle bg-light-green"></div>
                                            <smal>Đang chuyển</smal>
                                        </div>
                                    {% elseif item['status'] == 4 %}
                                        <div class="d-flex">
                                            <div class="circle bg-success"></div>
                                            <smal>Thành công</smal>
                                        </div>
                                    {% elseif item['status'] == 5 %}
                                        <div class="d-flex">
                                            <div class="circle bg-amber"></div>
                                            <smal>Gọi lại</smal>
                                        </div>
                                    {% elseif item['status'] == 6 %}
                                        <div class="d-flex">
                                            <div class="circle bg-gray"></div>
                                            <smal>Hủy</smal>
                                        </div>
                                    {% endif %}
                                </td>
                                <td class="communication">
                                    {% if item['status'] == 1 %}
                                        <a href="/doi-trang-thai-don-hang-b2{{ item['id'] }}">
                                            <button class="pointer bg-green" title="Xác nhận"><i
                                                        class="fa fa-check"></i></button>
                                        </a>
                                        <a href="/doi-trang-thai-don-hang-b6{{ item['id'] }}">
                                            <button class="pointer bg-gray" title="Hủy"><i class="fa fa-times"></i>
                                            </button>
                                        </a>
                                        <a href="/doi-trang-thai-don-hang-b5{{ item['id'] }}">
                                            <button class="pointer bg-yellow" title="Gọi lại"><i
                                                        class="fa fa-phone"></i></button>
                                        </a>
                                    {% endif %}
                                    {% if item['status'] == 6 %}
                                        <a href="/doi-trang-thai-don-hang-b2{{ item['id'] }}">
                                            <button class="pointer bg-green" title="Xác nhận"><i
                                                        class="fa fa-check"></i></button>
                                        </a>
                                        <a href="/doi-trang-thai-don-hang-b5{{ item['id'] }}">
                                            <button class="pointer bg-amber" title="Gọi lại"><i
                                                        class="fa fa-phone"></i></button>
                                        </a>
                                        <a href="/doi-trang-thai-don-hang-b1{{ item['id'] }}">
                                            <button class="pointer bg-yellow" title="Mới"><i class="fa fa-angle-right"></i>
                                            </button>
                                        </a>
                                    {% endif %}
                                    {% if item['status'] != 1 and item['status'] != 6 %}
                                        {% if item['status'] != 3 %}
                                            <a href="/doi-trang-thai-don-hang-b3{{ item['id'] }}">
                                                <button class="pointer bg-light-green" title="Đang chuyển"><i
                                                            class="fa fa-truck"></i></button>
                                            </a>
                                        {% endif %}
                                        {% if item['status'] != 5 %}
                                            <a href="/doi-trang-thai-don-hang-b5{{ item['id'] }}">
                                                <button class="pointer bg-yellow" title="Gọi lại"><i
                                                            class="fa fa-phone"></i></button>
                                            </a>
                                        {% endif %}
                                        {% if item['status'] != 4 %}
                                            <a href="/doi-trang-thai-don-hang-b4{{ item['id'] }}">
                                                <button class="pointer bg-success" title="Thành công"><i
                                                            class="fa fa-check"></i></button>
                                            </a>
                                        {% endif %}
                                        {% if item['status'] == 5 %}
                                            <a href="/doi-trang-thai-don-hang-b1{{ item['id'] }}">
                                                <button class="pointer bg-yellow" title="Mới"><i class="fa fa-angle-right"></i>
                                                </button>
                                            </a>
                                        {% endif %}
                                    {% endif %}
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
