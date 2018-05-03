<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Danh sách sản phẩm</h3>
                    <div class="pull-right">
                        <a href="/quan-tri/them-moi-san-pham">
                            <button type="button" class="btn btn-primary pointer">Thêm mới sản phẩm</button>
                        </a>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="data-table-customer" class="table table-bordered table-hover table-product">
                        <thead>
                        <tr>
                            <th width="5%">STT</th>
                            <th>Ảnh sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá niêm yết</th>
                            <th>Giá bán </th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for item in listData %}
                            <tr>
                                <td>{{ item['id'] }}</td>
                                <td><img src="{{ item['avatar']? item['avatar'] : '/assets_backend/upload/no-image.png' }}" alt=""></td>
                                <td>{{ item['name'] }}</td>
                                <td>{{ uiHelper.formatNumber(item['price']) }}</td>
                                <td>{{ uiHelper.formatNumber(item['price_sell']) }}</td>
                                <td>
                                    {% if item['status'] == 1 %}
                                        <button type="button" class="btn btn-success pointer">Hoạt động</button>
                                    {% elseif item['status'] == 2 %}
                                        <button type="button" class="btn btn-danger pointer">Không hoạt động</button>
                                    {% endif %}
                                </td>
                                <td>
                                    <a href="/quan-tri/chinh-sua-san-pham?id={{ item['id'] }}"><span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa sản phẩm"><i class="fa fa-list"></i></span></a>
                                    <a href="/quan-tri/xoa-san-pham?id={{ item['id'] }}" onclick="alert('Bạn có muốn xóa sản phẩm không?')"><span class="icon-manipulation pointer" id="trash-cat" title="Xóa sản phẩm" ><i class="fa fa-trash"></i></span></a>
                                </td>
                            </tr>
                        {% endfor %}

                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>