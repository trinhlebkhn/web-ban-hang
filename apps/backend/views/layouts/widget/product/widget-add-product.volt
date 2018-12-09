<section class="content">
    <div class="row table-responsive">
        <div class="add add-product">
            <form role="form" method="post" id="add_product">
                <div style="overflow-y: auto; background-color: #fff;">
                    <div class="col-md-12">
                        {{ this.flash.output() }}
                    </div>
                    <div class="row bd-bt-dashed">
                        <div class="product-info col-md-6 col-sm-5">
                            <div class="box-header with-border">
                                <h3 class="box-title">Thêm mới sản phẩm</h3>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Tên sản <span class="error">*</span></label>
                                    <input type="text" name="product[name]" value="{{ data['name'] }}"
                                           class="form-control" id="name"
                                           placeholder="Tên sản phẩm">
                                </div>
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <textarea type="text" name="product[descript]" class="form-control"
                                              style="min-width: 100%; max-width: 100%; min-height: 80px" id="descript"
                                              placeholder="Mô tả sản phẩm">{{ data['descript'] }}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Danh mục <span class="error">*</span></label>
                                    <select id="cat_product" name="product[category_id]"
                                            class="selectpicker form-control" data-live-search="true">
                                        <option disabled>Chọn danh mục</option>
                                        {% for cat in listCats %}
                                            <option value="{{ cat['id'] }}"
                                                    {{ cat['id'] == data['category_id'] ? 'selected' : '' }} >{{ cat['name'] }}</option>
                                        {% endfor %}
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Giá niêm yết</label>
                                    <input type="text" name="product[price]" value="{{ data['price'] }}"
                                           class="form-control" id="price"
                                           placeholder="Giá niêm yết">
                                </div>
                                <div class="form-group">
                                    <label>Giá bán <span class="error">*</span></label>
                                    <input type="text" name="product[price_sell]" value="{{ data['price_sell'] }}"
                                           class="form-control" id="price_sell"
                                           placeholder="Giá bán">
                                </div>
                                <div class="form-group">
                                    <label>Giá nhập <span class="error">*</span></label>
                                    <input type="text" name="product[price_import]" value="{{ data['price_import'] }}"
                                           class="form-control" id="price_import"
                                           placeholder="Giá nhập">
                                </div>
                                <div class="form-group">
                                    <label>Cân nặng <span class="error">*</span></label>
                                    <input type="text" name="product[weight]" value="{{ data['weight'] }}"
                                           class="form-control" id="weight"
                                           placeholder="Cân nặng">
                                </div>
                                {#<div class="form-group">#}
                                {#<label>Kích thước</label>#}
                                {#<div class="row box-size">#}
                                {#<input type="text" name="product[length]" value="{{ data['weight'] }}"#}
                                {#class="form-control" id="length"#}
                                {#placeholder="Dài">#}
                                {#<input type="text" name="product[width]" value="{{ data['weight'] }}"#}
                                {#class="form-control weight" id="width"#}
                                {#placeholder="Rộng">#}
                                {#<input type="text" name="product[height]" value="{{ data['weight'] }}"#}
                                {#class="form-control" id="height"#}
                                {#placeholder="Cao">#}
                                {#</div>#}
                                {#</div>#}
                                <div class="form-group product-status">
                                    <label>Trạng thái: </label>
                                    <div class="choose-radio">
                                        <label>
                                            <input type="radio" name="product[status]" class="flat-red"
                                                   value="1" {{ data['status'] == null or data['status'] == 1 ? 'checked' : '' }}>
                                            <span>Hoạt động</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="product[status]"
                                                   class="flat-red" {{ data['status'] == 2 ? 'checked' : '' }} value="2">
                                            <span>Không hoạt động</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-7">
                            <div class="product-image">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Ảnh đại diện</h3>
                                    <small><i>Ảnh phải có định dạng *.jpg, *.png, *.bmp</i></small>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5">
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
                                        <input class="hidden" name="product[avatar]" value="{{ data['avatar'] }}"
                                               id="src_avatar" type="text">
                                    </div>
                                    <div class="col-sm-7 img-slide-product">
                                        {% for index, item in data['image'] %}
                                            <div class="col-sm-4 col-xs-6">
                                                <div class="img-product-single" style="position: relative">
                                                    <img id="blog_avatar" src="{{ item }}" alt=""
                                                         style="width: 100%; height: 100%;">
                                                    <i class="fa fa-trash text-danger pointer"
                                                       style="position: absolute;top: 10px;right: 15px"
                                                       onclick="removeImgProduct({{ index }})"></i>
                                                </div>
                                                <input class="hidden" name="product[image][{{ index }}]"
                                                       value="{{ item }}" id="list_img" type="text">
                                            </div>
                                        {% endfor %}
                                        {% if data['image'] | length < 9 %}
                                            <div class="col-sm-4 col-xs-6">
                                                <div class="boxborder text-center d-flex justify-content-center align-items-center pointer img-product-single"
                                                     onclick="img_product.click()">
                                                    <div class="d-inline-block" style="margin: auto">
                                                        <p>Ảnh slide</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <input #img_product class="hidden" type="file" id="img_product"
                                                   onchange="uploadImgProduct(img_product,img_product.files[0], {{ data['id'] }})">
                                        {% endif %}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 bd-bt-dashed box-attr">
                        <div class="row title pd-bt-10">
                            <h3 class="col-md-12 box-title" style="font-size: 18px">Thuộc tính sản phẩm</h3>
                        </div>
                        <div class="list-attribute" id="list-attribute">
                            <input id="arr_attr_disable" type="text" class="hidden" value="[]">
                            {% if data['id'] != null and data['attribute_id'] is not empty %}
                                {% for index, item in data['attribute_id'] %}
                                    <div class="row item {{ index == 0 ? 'first-item' : '' }}">
                                        <div class="col-md-6 col-sm-6">
                                            <div id="item_0" class="attribute d-flex">
                                                {#<select name="product[attribute_id]" class="form-control" onchange="disableAttr(event, this)">#}
                                                <select name="product[attribute_id][]" class="form-control">
                                                    <option disabled>Chọn thuộc tính</option>
                                                    {% for attr in listAttr %}
                                                        <option value="{{ attr['id'] }}" {{ attr['id'] == item ? 'selected' : '' }}>{{ attr['name'] }}</option>
                                                    {% endfor %}
                                                </select>
                                                <button type="button" class="btn btn-primary"
                                                        onclick="ajaxAddAttrProduct()"
                                                        title="Thêm thuộc tính"><i
                                                            class="fa fa-plus"></i></button>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 d-flex value-attribute">
                                            <div id="item_0" class="attribute d-flex">
                                                <input type="text" class="form-control" placeholder=""
                                                       name="product[attribute_value][]"
                                                       value="{{ data['attribute_value'][index] }}">
                                                <button type="button" class="btn btn-primary" onclick="addAttrProduct()"
                                                        title="Thêm thuộc tính sản phẩm"><i
                                                            class="fa fa-plus"></i></button>
                                                {% if index != 0 %}
                                                    <button type="button" class="btn btn-danger delete-item"
                                                            onclick="removeAttrProduct(this)"
                                                            title="Xóa thuộc tính sản phẩm"><i
                                                                class="fa fa-trash"></i></button>
                                                {% endif %}
                                            </div>
                                        </div>
                                    </div>
                                {% endfor %}
                            {% else %}
                                <div class="row item first-item">
                                    <div class="col-md-6">
                                        <div id="item_0" class="attribute d-flex">
                                            {#<select name="product[attribute_id]" class="form-control" onchange="disableAttr(event, this)">#}
                                            <select name="product[attribute_id][]" class="form-control">
                                                <option disabled>Chọn thuộc tính</option>
                                                {% for attr in listAttr %}
                                                    <option value="{{ attr['id'] }}">{{ attr['name'] }}</option>
                                                {% endfor %}
                                            </select>
                                            <button type="button" class="btn btn-primary" onclick="ajaxAddAttrProduct()"
                                                    title="Thêm thuộc tính"><i
                                                        class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                    <div class="col-md-6 d-flex value-attribute">
                                        <div id="item_0" class="attribute d-flex">
                                            <input type="text" class="form-control" placeholder=""
                                                   name="product[attribute_value][]">
                                            <button type="button" class="btn btn-primary" onclick="addAttrProduct()"
                                                    title="Thêm thuộc tính sản phẩm"><i
                                                        class="fa fa-plus"></i></button>
                                            {#<button type="button" class="btn btn-danger delete-item" onclick="removeAttrProduct(this)" title="Xóa thuộc tính sản phẩm"><i#}
                                            {#class="fa fa-trash"></i></button>#}
                                        </div>
                                    </div>
                                </div>
                            {% endif %}

                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="product-description">
                            <div class="form-group">
                                <label>Nội dung</label>
                                <textarea type="text" id="product_content" name="product[content]"
                                          style="max-width: 100%; min-height: 100px"
                                          class="form-control" id="product-content"
                                          placeholder="Mô tả sản phẩm">{{ data['content'] }}</textarea>
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
<script src="/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace('product_content');
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#add_product').bootstrapValidator({
            message: 'Vui lòng nhập giá trị',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'product[name]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập tên sản phẩm!'
                        }
                    }
                },
                'product[price_sell]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập giá bán!'
                        }
                    }
                },
                'product[price_import]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập nhập hàng!'
                        }
                    }
                },
                'product[weight]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập cân nặng!'
                        }
                    }
                },
                'product[category_id]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng chọn danh mục!'
                        }
                    }
                }
            }
        });
    });
</script>
