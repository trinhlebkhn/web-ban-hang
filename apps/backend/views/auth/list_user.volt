{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <div class="row title">
                            <div class="col-md-4 col-sm-6 pd-l-0">
                                <h3 class="box-title">Danh sách thành viên</h3>
                            </div>
                            {% include 'layouts/filter/filter_user.volt' %}
                        </div>
                    </div>
                    <div class="box-data">
                        <div class="table-responsive">
                            {{ this.flash.output() }}
                            <table class="table table-striped table-bordered table-contract">
                                <thead>
                                <tr>
                                    <th style="width: 5%">STT</th>
                                    <th>Ảnh đại diện</th>
                                    <th>Tên thành viên</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Địa chỉ</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                {% for index, item in listData %}
                                    <tr>
                                        <td scope="row">{{ index + 1 }}</td>
                                        <td class="img-user">
                                            {% if item['avatar'] | length > 0 %}
                                                <img src="{{ item['avatar'] }}" alt="{{ item['fullname'] }}">
                                            {% else %}
                                                <img src="/assets_backend/upload/no-image.png" alt="{{ item['fullname'] }}">
                                            {% endif %}
                                        </td>
                                        <td><a href="/quan-tri/chi-tiet-thanh-vien-id{{ item['id'] }}">{{ item['fullname'] }}</a></td>
                                        <td>{{ item['email'] }}</td>
                                        <td>{{ item['phone'] }}</td>
                                        <td>{{ item['address'] }}</td>
                                        <td>
                                            <a href="/quan-tri/chi-tiet-thanh-vien-id{{ item['id'] }}"><span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa danh mục"><i class="fa fa-list"></i></span></a>
                                        </td>
                                    </tr>
                                {% endfor %}
                                </tbody>
                            </table>
                        </div>
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
