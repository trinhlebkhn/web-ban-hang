<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Danh sách danh mục</h3>
                    <div class="pull-right">
                        <button type="button" class="btn btn-primary pointer" onclick="addCat()">Thêm mới danh mục</button>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-contract">
                        <thead>
                        <tr>
                            <th style="width: 5%">STT</th>
                            <th>Tên danh mục</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for item in listCat %}
                            <tr>
                                <td scope="row">{{ item['id'] }}</td>
                                <td>{{ item['name'] }}</td>
                                <td>
                                    {% if item['status'] == 1 %}
                                        <button type="button" class="btn btn-success pointer">Hoạt động</button>
                                    {% elseif item['status'] == 2 %}
                                        <button type="button" class="btn btn-danger pointer">Không hoạt động</button>
                                    {% endif %}
                                </td>
                                <td>

                                </td>
                            </tr>
                        {% endfor %}
                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                    {% include 'layouts/pagination.volt' %}
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>