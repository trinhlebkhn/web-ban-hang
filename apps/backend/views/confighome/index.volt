{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}

<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <div class="row title">
                            <h3 class="box-title">Cấu hình hiển thị trang chủ</h3>
                            <div class="pull-right">
                                <span class="btn btn-primary pointer" onclick="ajaxCatHomePage()">Thêm mới danh mục</span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        {{ this.flash.output() }}
                        <table class="table table-striped table-bordered table-contract">
                            <thead>
                            <tr>
                                <th style="width: 5%">#</th>
                                <th>Tên danh mục</th>
                                <th>Mô tả</th>
                                <th>Vị trí</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody class="list-cat-home-page">
                            {% for index, item in listCat %}
                                <tr>
                                    <td scope="row">{{ index + 1 }}</td>
                                    <td>{{ item['name'] }}</td>
                                    <td>{{ item['desc'] }}</td>
                                    <td>
                                        {{ item['sort'] }}
                                    </td>
                                    <td>
                                        <span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa vị trí danh mục" onclick="editCatHome({{ item['id'] }})"><i class="fa fa-list"></i></span>
                                        <a href="/quan-tri/xoa-danh-muc-trang-chu{{ item['id'] }}"><span class="icon-manipulation pointer delete-item" id="trash-cat" title="Xóa danh mục"><i class="fa fa-trash"></i></span></a>
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
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
