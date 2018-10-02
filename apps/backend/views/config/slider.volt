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
                            <h3 class="col-md-12 box-title">Cấu hình slider</h3>
                        </div>
                        <form action="" method="post">
                            <div class="row add-slider">
                                <div class="col-md-3">
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
                                <div class="col-md-9">
                                    <div class="form-gorup">
                                        <label>Đường dẫn</label>
                                        <input type="text" class="form-control" name="data[link]"
                                               placeholder="Đường dẫn">
                                    </div>
                                    <div class="form-group btn-add-slider">
                                        <button type="submit" class="btn btn-primary pointer">Thêm slider
                                        </button>
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
                                <th>Slider</th>
                                <th>Link</th>
                            </tr>
                            </thead>
                            <tbody class="list-cat-home-page">
                            {% for index, item in listSliders %}
                                <tr>
                                    <td>{{ index + 1 }}</td>
                                    <td width="20%">
                                        <div class="cover">
                                            <img src="{{ item.avatar }}" alt="Slider + {{ index + 1 }}">
                                        </div>
                                    </td>
                                    <td>{{ item.link }}</td>
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
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
