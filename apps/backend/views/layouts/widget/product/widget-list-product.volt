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
                    <table id="data-table-customer" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>Mã sản phẩm</th>
                            <th>Ảnh sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá sản phẩm</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Trident</td>
                            <td>Internet
                                Explorer 4.0
                            </td>
                            <td>Win 95+</td>
                            <td> 4</td>
                            <td>
                                <a href="/quan-tri/chinh-sua-san-pham?id={{ item['id'] }}"><span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa sản phẩm"><i class="fa fa-list"></i></span></a>
                                <a href="/quan-tri/xoa-san-pham?id={{ item['id'] }}"><span class="icon-manipulation pointer" id="trash-cat" title="Xóa sản phẩm"><i class="fa fa-trash"></i></span></a>
                            </td>
                        </tr>
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