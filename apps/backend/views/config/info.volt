{% include "layouts/header.volt" %}
<!-- Left side column. contains the logo and sidebar -->
{% include "layouts/sidebar.volt" %}

<div class="content-wrapper">
    <section class="content box-slider">
        <form method="post" id="config_info">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-header">
                            <div class="row title bd-bt-dashed pd-bt-10">
                                <h3 class="col-md-12 box-title">Thông tin website</h3>
                            </div>
                            <div>
                                {{ this.flash.output() }}
                            </div>
                            <div class="box-info-website">
                                <div class="bd-bt-dashed pd-bt-10">
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Tên website</label>
                                        </div>
                                        <div class="col-md-9 website-name">
                                            <input class="form-control" type="text" name="data[website_name]"
                                                   value="{{ data['website_name'] }}"
                                                   placeholder="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group bd-bt-dashed pd-bt-10">
                                    <div class="col-md-3">
                                        <label>Avatar</label>
                                    </div>
                                    <div class="col-md-9">
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
                                </div>
                                <div class="row form-group bd-bt-dashed pd-bt-10">
                                    <div class="col-md-3">
                                        <label>Favicon</label>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="{{ data['favicon'] == null  ? '' : 'hidden' }} blog-favicon boxborder text-center d-flex justify-content-center align-items-center pointer"
                                             onclick="favicon.click()">
                                            <div class="d-inline-block" style="margin: auto">
                                                <p>Ảnh</p>
                                            </div>
                                        </div>
                                        <div class="img-favicon {{ data['favicon'] == null  ? 'hidden' : '' }}"
                                             style="position: relative">
                                            <img id="favicon_img" src="{{ data['favicon'] }}" alt="">
                                            <i class="fa fa-trash text-danger pointer"
                                               style="position: absolute;top: 10px;right: 15px"
                                               onclick="removeFavicon()"></i>
                                        </div>
                                        <input #favicon class="hidden" type="file" id="favicon"
                                               onchange="uploadFavicon(favicon,favicon.files[0])">
                                        <input class="hidden" name="data[favicon]" value="{{ data['favicon'] }}"
                                               id="src_favicon" type="text">
                                    </div>
                                </div>
                                <div class="bd-bt-dashed pd-bt-10 box-seo">
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Chọn khối menu chân trang</label>
                                        </div>
                                        <div class="col-md-9">
                                            <select id="menu_footer" name="data[list_block_menu_footer][]" class="selectpicker form-control" data-live-search="true"
                                                    multiple>
                                                <option disabled>Chọn khối menu</option>
                                                {% for item in listBoxMenu %}
                                                    <option value="{{ item['id'] }}"
                                                            {{ uiHelper.check_in_array(item['id'], data['list_block_menu_footer']) ? 'selected' : '' }} >{{ item['name'] }}</option>
                                                {% endfor %}
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="bd-bt-dashed pd-bt-10 box-seo">
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Chọn menu chân trang</label>
                                        </div>
                                        <div class="col-md-9">
                                            <select id="menu_footer" name="data[block_menu_bottom_footer]" class="selectpicker form-control" data-live-search="true">
                                                <option disabled>Chọn khối menu</option>
                                                {% for item in listBoxMenu %}
                                                    <option value="{{ item['id'] }}"
                                                            {{ item['id'] == data['block_menu_bottom_footer'] ? 'selected' : '' }} >{{ item['name'] }}</option>
                                                {% endfor %}
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="bd-bt-dashed pd-bt-10 box-seo">
                                    <div class="row title pd-bt-10">
                                        <h3 class="col-md-12 box-title">Thông tin seo</h3>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Tiêu đề seo</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[seo_title]"
                                                   value="{{ data['seo_title'] }}"
                                                   placeholder="Ví dụ: Website đồng hồ chất lượng cao">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Từ khóa seo</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[seo_key]"
                                                   value="{{ data['seo_key'] }}"
                                                   placeholder="Ví dụ: Đồng hồ đẹp, đồng hồ chính hãng,....">
                                        </div>
                                    </div>
                                </div>
                                <div class="bd-bt-dashed pd-bt-10">
                                    <div class="row title pd-bt-10">
                                        <h3 class="col-md-12 box-title">Mạng xã hội</h3>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Link Facebook</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[facebook_link]"
                                                   value="{{ data['facebook_link'] }}" placeholder="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Link Google</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[google_link]"
                                                   value="{{ data['google_link'] }}" placeholder="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Link Twitter</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[twitter_link]"
                                                   value="{{ data['twitter_link'] }}" placeholder="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Link Linkedin</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[linkedin_link]"
                                                   value="{{ data['linkedin_link'] }}" placeholder="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Link Youtube</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[youtube_link]"
                                                   value="{{ data['youtube_link'] }}" placeholder="">
                                        </div>
                                    </div>
                                </div>
                                <div class="bd-bt-dashed pd-bt-10">
                                    <div class="row title pd-bt-10">
                                        <h3 class="col-md-12 box-title" style="margin-top: 15px;">Thời gian</h3>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Giờ mở cửa</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[time_open]"
                                                   value="{{ data['time_open'] }}" placeholder="Ví dụ: 8:00">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-3">
                                            <label>Giờ đóng cửa</label>
                                        </div>
                                        <div class="col-md-9">
                                            <input class="form-control" type="text" name="data[time_close]"
                                                   value="{{ data['time_close'] }}" placeholder="Ví dụ: 22:00">
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer pull-right manipulation">
                                    <button type="submit" class="btn btn-primary btn-add">Lưu</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
        </form>
        <!-- /.row -->
    </section>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#config_info').bootstrapValidator({
            message: 'Vui lòng nhập giá trị',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'data[website_name]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập tên website!'
                        }
                    }
                },
                'data[list_block_menu_footer]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng chọn khối menu chân trang!'
                        }
                    }
                },
                'data[block_menu_bottom_footer]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng chọn menu chân trang!'
                        }
                    }
                },
            }
        });
    });
</script>

<!-- /.content-wrapper -->
{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
