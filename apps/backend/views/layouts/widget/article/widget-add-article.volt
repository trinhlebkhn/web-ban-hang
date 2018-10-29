<section class="content">
    <div class="row">
        <div class="add">
            <form role="form" method="post">
                <div style="overflow-y: auto; background-color: #fff;">
                    <div class="col-md-12">
                        {{ this.flash.output() }}
                    </div>
                    <div class="row bd-bt-dashed">
                        <div class="product-info col-md-6">
                            <div class="box-header with-border">
                                <h3 class="box-title">Thêm mới bài viết</h3>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Tên bài viết</label>
                                    <input type="text" name="data[name]" value="{{ data['name'] }}"
                                           class="form-control" id="name"
                                           placeholder="Tên bài viết">
                                </div>
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <textarea type="text" name="data[caption]" class="form-control"
                                              style="min-width: 100%; max-width: 100%; min-height: 80px" id="descript"
                                              placeholder="Mô tả bài viết">{{ data['caption'] }}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Danh mục</label>
                                    <select id="cat_product" name="data[category_id]"
                                            class="selectpicker form-control" data-live-search="true">
                                        <option>Chọn danh mục</option>
                                        {% for cat in listCats %}
                                            <option value="{{ cat['id'] }}"
                                                    {{ cat['id'] == data['category_id'] ? 'selected' : '' }} >{{ cat['name'] }}</option>
                                        {% endfor %}
                                    </select>
                                </div>
                                <div class="form-group product-status">
                                    <label>Trạng thái: </label>
                                    <label>
                                        <input type="radio" name="data[status]" class="flat-red" value="1" checked>
                                        <span>Hoạt động</span>
                                    </label>
                                    <label>
                                        <input type="radio" name="data[status]" class="flat-red" value="2">
                                        <span>Không hoạt động</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product-image">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Ảnh đại diện</h3>
                                    <small><i>Ảnh phải có định dạng *.jpg, *.png, *.bmp</i></small>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 col-sm-12">
                                        <div class="{{ data['avatar'] == null  ? '' : 'hidden' }} blog-avatar boxborder text-center d-flex justify-content-center align-items-center pointer"
                                             onclick="avatar.click()">
                                            <div class="d-inline-block" style="margin: auto">
                                                <p>Ảnh đại diện</p>
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
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 bd-bt-dashed pd-t-10">
                        <div class="product-description">
                            <div class="form-group">
                                <label>Nội dung</label>
                                <textarea type="text" name="data[content]" style="max-width: 100%; min-height: 100px"
                                          class="form-control" id="product-content"
                                          placeholder="Mô tả bài viết">{{ data['content'] }}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="bd-bt-dashed pd-bt-10">
                        <div class="row title pd-bt-10">
                            <h3 class="col-md-12 box-title" style="font-size: 18px">Thiết lập SEO</h3>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label>Tiêu đề SEO</label>
                            </div>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="data[seo_title]"
                                       value="{{ data['seo_title'] }}" placeholder="">
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label>Từ khóa SEO</label>
                            </div>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="data[seo_key]"
                                       value="{{ data['seo_key'] }}" placeholder="">
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-3">
                                <label>Mô tả SEO</label>
                            </div>
                            <div class="col-md-9">
                                <input class="form-control" type="text" name="data[seo_description]"
                                       value="{{ data['seo_description'] }}" placeholder="">
                            </div>
                        </div>
                    </div>

                </div>

                <div class="box-footer pull-right manipulation">
                    <button type="submit"
                            class="btn btn-primary btn-add">{{ data['id'] != null ? 'Cập nhật' : 'Tạo mới' }} </button>
                    <a href="/quan-tri/san-pham" class="btn btn-danger btn-cancel">Hủy</a>
                </div>
            </form>
        </div>
    </div>
</section>