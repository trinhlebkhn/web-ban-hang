<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header">
                    <div class="row title">
                        <h3 class="box-title">Danh sách liên hệ</h3>
                    </div>
                </div>
                <div class="table-responsive">
                    {{ this.flash.output() }}
                    <table class="table table-striped table-bordered table-contact">
                        <thead>
                        <tr>
                            <th style="width: 5%">#</th>
                            <th>Họ tên khách hàng</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Nội dung</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for index, item in listData %}
                            <tr>
                                <td scope="row">{{ index + 1 }}</td>
                                <td>{{ item['name'] }}</td>
                                <td>{{ item['email'] }}</td>
                                <td>{{ item['phone'] }}</td>
                                <td>{{ item['message'] }}</td>
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