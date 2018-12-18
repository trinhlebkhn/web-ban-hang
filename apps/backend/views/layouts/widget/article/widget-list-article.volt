<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <div class="row title">
                        <h3 class="box-title">Danh sách bài viết</h3>
                        <div class="pull-right">
                            <a href="/quan-tri/them-bai-viet">
                                <button type="button" class="btn btn-primary pointer">Thêm mới bài viết</button>
                            </a>
                        </div>
                    </div>
                    {% include 'layouts/filter/filter_article.volt' %}
                </div>

                <!-- /.box-header -->
                <div class="box-body">
                    <div class="col-md-12">
                        {{ this.flash.output() }}
                    </div>
                    <table id="data-table-customer" class="table table-bordered table-hover table-product">
                        <thead>
                        <tr>
                            <th width="5%">STT</th>
                            <th>Tên bài viết</th>
                            <th>Đường dẫn</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for index, item in listData %}
                            <tr>
                                <td>{{ index + 1 }}</td>
                                <td>{{ item['name'] }}</td>
                                <td>{{ item['slug'] }}</td>
                                <td>
                                    {% if item['status'] == 1 %}
                                        <button type="button" class="btn btn-success pointer">Hoạt động</button>
                                    {% elseif item['status'] == 2 %}
                                        <button type="button" class="btn btn-danger pointer">Không hoạt động</button>
                                    {% endif %}
                                </td>
                                <td>
                                    <a href="/quan-tri/chinh-sua-bai-viet?id={{ item['id'] }}"><span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa sản phẩm"><i class="fa fa-list"></i></span></a>
                                    <a href="/quan-tri/xoa-bai-viet?id={{ item['id'] }}"><span class="icon-manipulation pointer delete-item"  id="trash-cat" title="Xóa sản phẩm" ><i class="fa fa-trash"></i></span></a>
                                </td>
                            </tr>
                        {% endfor %}

                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="pagination pull-right">
                    {% include 'layouts/pagination.volt' %}
                </div>
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>