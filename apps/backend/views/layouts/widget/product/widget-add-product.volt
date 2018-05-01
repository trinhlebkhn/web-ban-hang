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
                            <h3 class="box-title">Thêm mới sản phẩm</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input type="text" name="product[name]" class="form-control" id="name"
                                       placeholder="Tên sản phẩm">
                            </div>
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select id="cat_product" name="product[category_id][]" class="selectpicker form-control"
                                        multiple>
                                    {% for cat in listCats %}
                                        <option value="{{ cat['id'] }}">{{ cat['name'] }}</option>
                                    {% endfor %}
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Giá niêm yết</label>
                                <input type="text" name="product[price]" class="form-control" id="price"
                                       placeholder="Giá niêm yết">
                            </div>
                            <div class="form-group">
                                <label>Giá bán</label>
                                <input type="text" name="product[price_sell]" class="form-control" id="price_sell"
                                       placeholder="Giá bán">
                            </div>
                            <div class="form-group">
                                <label>Giá nhập</label>
                                <input type="text" name="product[price_import]" class="form-control" id="price_import"
                                       placeholder="Giá nhập">
                            </div>
                            <div class="form-group product-discount">
                                <label>Giảm giá: </label>
                                <label>
                                    <input type="radio" name="discount" id="discount" onclick="check_discount(1)"
                                    value="1">
                                    <span>Có</span>
                                </label>
                                <label>
                                    <input type="radio" name="discount" id="discount" onclick="check_discount(0)"
                                    value="0">
                                    <span>Không</span>
                                </label>
                            </div>
                            <div class="form-group discount-type hidden">
                                <label>Loại giảm giá: </label>
                                <select class="selectpicker show-tick form-control" name="product[type_discount]"
                                        style="display: none !important;">
                                    <option value="1">%</option>
                                    <option value="2">VNĐ</option>
                                </select>
                            </div>
                            <div class="form-group product-status">
                                <label>Trạng thái: </label>
                                <label>
                                    <input type="radio" name="product[status]" class="flat-red" value="1" checked>
                                    <span>Hoạt động</span>
                                </label>
                                <label>
                                    <input type="radio" name="product[status]" class="flat-red" value="2">
                                    <span>Không hoạt động</span>
                                </label>
                            </div>
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
                        <input class="hidden" name="product[avatar]" id="src_avatar" type="text">
                    </div>
                </div>
                <div class="box-footer pull-right manipulation">
                    <button type="submit" class="btn btn-primary btn-add">Tạo mới</button>
                    <button class="btn btn-danger btn-cancel" onclick="removeAddCat(event)">Hủy</button>
                </div>
            </form>
        </div>
    </div>
</section>