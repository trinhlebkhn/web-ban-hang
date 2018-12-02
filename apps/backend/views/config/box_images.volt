{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}

<div class="content-wrapper">
    <section class="content box-slider">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <div class="row title">
                            <h3 class="col-md-12 box-title">
                                Cấu hình
                                {% if type == 1 %}
                                    slider
                                {% elseif type == 2 %}
                                    khối quảng cáo
                                {% elseif type == 3 %}
                                    khối thương hiệu
                                {% endif %}
                            </h3>
                        </div>
                        <form action="" method="post" id="config_img">
                            <div class="add-slider">
                                <div class="col-sm-5 col-md-3">
                                    <div class="{{ data['avatar'] == null  ? '' : 'hidden' }} blog-avatar boxborder text-center d-flex justify-content-center align-items-center pointer"
                                         onclick="avatar.click()">
                                        <div class="d-inline-block" style="margin: auto">
                                            <p>Ảnh</p>
                                        </div>
                                    </div>
                                    <div class="img-avatar {{ data['avatar'] == null  ? 'hidden' : '' }}"
                                         style="position: relative">
                                        <img id="blog_avatar" src="{{ data['avatar'] }}" alt="">
                                        <i class="fa fa-trash text-danger pointer"
                                           style="position: absolute;top: 10px;right: 15px"
                                           onclick="removeImage()"></i>
                                    </div>
                                    <input #avatar class="hidden" type="file" id="avatar"
                                           onchange="uploadImage(avatar,avatar.files[0])">
                                    <input class="hidden" name="data[avatar]" value="{{ data['avatar'] }}"
                                           id="src_avatar" type="text">
                                </div>
                                <div class="row form-group col-sm-7 col-md-9">
                                    <div class="col-md-3">
                                        <label>Đường dẫn</label>
                                    </div>
                                    <div class="col-md-9 link">
                                        <input type="text" class="form-control" name="data[link]"
                                               value="{{ data['link'] }}"
                                               placeholder="Đường dẫn">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-9">
                                            <div class="btn-add-slider">
                                                <button type="submit"
                                                        class="btn btn-primary pointer">{{ data['id'] is empty ? 'Thêm slider' : 'Chỉnh sửa' }}
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="table-responsive">
                        {{ this.flash.output() }}
                        <table class="table table-striped table-bordered table-contract">
                            <thead>
                            <tr>
                                <th style="width: 5%">#</th>
                                <th>Ảnh</th>
                                <th>Link</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody class="list-cat-home-page">
                            {% for index, item in listImages %}
                                <tr>
                                    <td>{{ index + 1 }}</td>
                                    <td width="20%">
                                        <div class="cover">
                                            <img src="{{ item['avatar'] }}" alt="Slider + {{ index + 1 }}">
                                        </div>
                                    </td>
                                    <td>{{ item['link'] }}</td>
                                    <td>
                                        {% if type == 1 %}
                                            <a href="/quan-tri/chinh-sua-slider?id={{ item['id'] }}">
                                                <span class="icon-manipulation pointer" id="edit-cat"
                                                      title="Chỉnh sửa slider">
                                                    <i class="fa fa-list"></i>
                                                </span>
                                            </a>
                                            <a href="/quan-tri/xoa-slider?id={{ item['id'] }}">
                                                <span class="icon-manipulation pointer delete-item" id="trash-cat"
                                                      title="Xóa slider"><i class="fa fa-trash"></i>
                                                </span>
                                            </a>
                                        {% elseif type == 2 %}
                                            <a href="/quan-tri/chinh-sua-banner?id={{ item['id'] }}">
                                                <span class="icon-manipulation pointer" id="edit-cat"
                                                      title="Chỉnh sửa slider"><i class="fa fa-list"></i></span>
                                            </a>
                                            <a href="/quan-tri/xoa-banner?id={{ item['id'] }}">
                                                <span class="icon-manipulation pointer delete-item" id="trash-cat"
                                                      title="Xóa slider"><i class="fa fa-trash"></i>
                                                </span>
                                            </a>
                                        {% elseif type == 3 %}
                                            <a href="/quan-tri/chinh-sua-thuong-hieu?id={{ item['id'] }}">
                                                <span class="icon-manipulation pointer" id="edit-cat"
                                                      title="Chỉnh sửa slider"><i class="fa fa-list"></i></span>
                                            </a>
                                            <a href="/quan-tri/xoa-thuong-hieu?id={{ item['id'] }}">
                                                <span class="icon-manipulation pointer delete-item" id="trash-cat"
                                                      title="Xóa slider"><i class="fa fa-trash"></i>
                                                </span>
                                            </a>
                                        {% endif %}

                                    </td>
                                </tr>
                            {% endfor %}
                            </tbody>
                        </table>
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
<script type="text/javascript">
    $(document).ready(function () {
        $('#config_img').bootstrapValidator({
            message: 'Vui lòng nhập giá trị',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'data[link]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập đường dẫn!'
                        }
                    }
                },
            }
        });
    });
</script>
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
