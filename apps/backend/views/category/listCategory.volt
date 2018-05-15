<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Danh sách danh mục</h3>
                    <div class="pull-right">
                        <a href="/quan-tri/tao-moi-danh-muc" class="btn btn-primary pointer">Thêm mới danh mục</a>
                    </div>
                </div>
                <div class="table-responsive">
                    {{ this.flash.output() }}
                    <table class="table table-striped table-bordered table-contract">
                        <thead>
                        <tr>
                            <th style="width: 5%">#</th>
                            <th>Tên danh mục</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for item in listCat %}
                            {% if item['del_flag'] != 1 %}
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
                                        <a href="/quan-tri/chinh-sua-danh-muc?id={{ item['id'] }}"><span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa danh mục"><i class="fa fa-list"></i></span></a>
                                        <a href="/quan-tri/xoa-danh-muc?id={{ item['id'] }}"><span class="icon-manipulation pointer delete-item" id="trash-cat" title="Xóa danh mục"><i class="fa fa-trash"></i></span></a>
                                    </td>
                                </tr>
                            {% endif %}
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