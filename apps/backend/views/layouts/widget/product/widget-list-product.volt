<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <div class="row title">
                        <h3 class="box-title">Danh sách sản phẩm</h3>
                        <div class="pull-right">
                            <a href="/quan-tri/them-moi-san-pham">
                                <button type="button" class="btn btn-primary pointer">Thêm mới sản phẩm</button>
                            </a>
                        </div>
                    </div>
                    {% include 'layouts/filter/filter_product.volt' %}
                </div>

                <!-- /.box-header -->
                <div class="box-body table-responsive">
                    <div class="col-md-12">
                        {{ this.flash.output() }}
                    </div>
                    <table id="data-table-customer" class="table table-bordered table-hover table-product">
                        <thead>
                        <tr>
                            <th width="5%">STT</th>
                            <th>Ảnh sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Đường dẫn</th>
                            <th>Giá niêm yết</th>
                            <th>Giá bán </th>
                            <th>Trạng thái</th>
                            <th>Đồng bộ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for index, item in listData %}
                            <tr>
                                <td>{{ index + 1 }}</td>
                                <td><img src="{{ item['avatar']? item['avatar'] : '/assets_backend/upload/no-image.png' }}" alt=""></td>
                                <td>{{ item['name'] }}</td>
                                <td>{{ item['slug'] }}</td>
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
                                    <button type="button" class="btn {{ item['zalo_id'] !== null and item['zalo_id'] !== '' ? 'btn-warning' : 'btn-primary' }} pointer product-synchronized-zalo" data-pro='{{ item | json_encode | escape_attr }}'>
                                        {{ item['zalo_id'] !== null and item['zalo_id'] !== '' ? 'Cập nhật trên zalo' : 'Đồng bộ với zalo' }}
                                    </button>
                                </td>
                                <td>
                                    <a href="/quan-tri/chinh-sua-san-pham?id={{ item['id'] }}"><span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa sản phẩm"><i class="fa fa-list"></i></span></a>
                                    <a href="/quan-tri/xoa-san-pham?id={{ item['id'] }}"><span class="icon-manipulation pointer delete-item"  id="trash-cat" title="Xóa sản phẩm" ><i class="fa fa-trash"></i></span></a>
                                    <a class="{{ item['zalo_id'] is not empty ? '' : 'hidden' }}  remove-action" href="#"><span class="icon-manipulation pointer remove-synchronized-product"  title="Xóa đồng bộ zalo" zalo-id='{{ item['zalo_id'] }}' pro-id='{{ item['id'] }}'><i class="fa fa-times"></i></span></a>
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