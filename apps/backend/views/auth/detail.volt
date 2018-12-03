{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <div class="add">
                <form role="form" method="post">
                    <div style="overflow-y: auto; background-color: #fff;">
                        <div class="col-md-12">
                            {{ this.flash.output() }}
                        </div>
                        <div class="product-info col-md-6">
                            <div class="box-header with-border">
                                <h3 class="box-title">Thành viên</h3>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Tên Thành viên: </label> {{ data['fullname'] }}
                                </div>
                                <div class="form-group">
                                    <label>Email: </label> {{ data['email'] }}
                                </div>
                                <div class="form-group">
                                    <label>Số điện thoại: </label> {{ data['phone'] }}
                                </div>
                                <div class="form-group">
                                    <label>Ngày sinh: </label> {{ data['dob'] }}
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ: </label> {{ data['address'] }}
                                </div>
                                <div class="form-group">
                                    <label>Ngày tạo tài khoản: </label> {{ data['datecreate'] }}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product-image">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Ảnh đại diện</h3>
                                    <small><i>Ảnh phải có định dạng *.jpg, *.png, *.bmp</i></small>
                                </div>
                                <div class="row box-img">
                                    <div class="col-md-5 col-sm-12">
                                        {% if data['avatar'] | length > 0 %}
                                            <img src="{{ data['avatar'] }}" alt="{{ data['fullname'] }}" style="width: 150px; height: 200px;">
                                        {% else %}
                                            <img src="/assets_backend/upload/no-image.png" alt="{{ item['fullname'] }}" style="width: 150px; height: 200px;">
                                        {% endif %}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer pull-right manipulation">
                        <a href="/quan-tri/thanh-vien" class="btn btn-danger btn-cancel">Quay lại</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
