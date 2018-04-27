<section id="add-category" class="content hidden">
    <div class="row">
        <div class="add-product">
            <form role="form" method="post">
                {{ this.flash.output() }}
                <div class="product-info col-md-6">
                    <div class="box-header with-border">
                        <h3 class="box-title">Thêm mới danh mục</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Tên Danh mục</label>
                            <input type="text" name="category[name]" class="form-control" id="name"
                                   placeholder="Tên danh mục">
                        </div>
                        <div class="form-group">
                            <label>Danh mục cha</label>
                            <select id="selectpicker" name="category[parent_id]" class="selectpicker form-control"
                                    title="Chọn danh mục" multiple>
                                {% for item in listCat %}
                                    <option value="{{ item['id'] }}">{{ item['name'] }}</option>
                                {% endfor %}
                            </select>
                        </div>
                        <div class="form-group product-status">
                            <label>Loại danh mục: </label>
                            <label>
                                <input type="radio" name="category[type]" class="flat-red" value="1" checked>
                                <span>Hàng hóa</span>
                            </label>
                            <label>
                                <input type="radio" name="category[type]" class="flat-red" value="2">
                                <span>Bài viết</span>
                            </label>
                        </div>
                        <div class="form-group product-status">
                            <label>Trạng thái: </label>
                            <label>
                                <input type="radio" name="category[status]" class="flat-red" value="1" checked>
                                <span>Hoạt động</span>
                            </label>
                            <label>
                                <input type="radio" name="category[status]" class="flat-red" value="2">
                                <span>Không hoạt động</span>
                            </label>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button class="btn btn-danger" onclick="removeAddCat(event)">Hủy</button>
                        <button type="submit" class="btn btn-primary">Tạo mới</button>
                    </div>

                </div>
                <div class="product-image col-md-6">
                    <div class="box-header with-border">
                        <h3 class="box-title">Ảnh đại diện</h3>
                        <small><i>Ảnh phải có định dạng *.jpg, *.png, *.bmp</i></small>
                    </div>
                    <div class="blog-avatar boxborder text-center d-flex justify-content-center align-items-center pointer"
                         onclick="avatar.click()">
                        <div class="d-inline-block">
                            <p>Ảnh đại diện</p>
                        </div>
                    </div>
                    <div class="img-avatar hidden" style="position: relative">
                        <img id="blog_avatar" src="" alt="">
                        <i class="fa fa-trash text-danger pointer" style="position: absolute;top: 10px;right: 15px"
                           onclick="removeImage()"></i>
                    </div>
                    <input #avatar class="hidden" type="file" id="avatar"
                           onchange="uploadImage(avatar,avatar.files[0])">
                    <input class="hidden" name="category[avatar]" id="src_avatar" type="text">
                </div>
            </form>
        </div>
    </div>
</section>
