<section class="content">
    <div class="row">
        <div class="add-product">
            <form role="form">
                <div class="product-info col-md-6">
                    <div class="box-header with-border">
                        <h3 class="box-title">Thêm mới sản phẩm</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Tên sản phẩm</label>
                            <input type="text" name="product['name']" class="form-control" id="name" placeholder="Tên sản phẩm">
                        </div>
                        <div class="form-group">
                            <label>Danh mục</label>
                            <select id="basic2" name="product['category_id']" class="selectpicker form-control"
                                    title="Chọn danh mục" multiple>
                                <option selected="selected">Alabama</option>
                                <option>Alaska</option>
                                <option>California</option>
                                <option>Delaware</option>
                                <option>Tennessee</option>
                                <option>Texas</option>
                                <option>Washington</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Giá niêm yết</label>
                            <input type="text" name="product['price']" class="form-control" id="price" placeholder="Giá niêm yết">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Giá bán</label>
                            <input type="text" name="product['price_sell']" class="form-control" id="price_sell" placeholder="Giá bán">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Giá nhập</label>
                            <input type="text" name="product['price_import']" class="form-control" id="price_import" placeholder="Giá nhập">
                        </div>
                        <div class="form-group product-discount">
                            <label>Giảm giá: </label>
                            <label>
                                <span>Có</span>
                                <input type="radio" name="discount" id="discount" onclick="check_discount(1)" value="1">
                            </label>
                            <label>
                                <span>Không</span>
                                <input type="radio" name="discount" id="discount" onclick="check_discount(0)" value="0" >
                            </label>
                        </div>
                        <div class="form-group discount-type hidden">
                            <label>Loại giảm giá: </label>
                            <select class="selectpicker show-tick form-control" name="product['type_discount']" style="display: none !important;">
                                <option value="1">%</option>
                                <option value="2">VNĐ</option>
                            </select>
                        </div>
                        <div class="form-group product-status">
                            <label>Trạng thái: </label>
                            <label>
                                <input type="radio" name="product['status']" class="flat-red" checked>
                                <span>Hoạt động</span>
                            </label>
                            <label>
                                <input type="radio" name="product['status']" class="flat-red">
                                <span>Không hoạt động</span>
                            </label>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-danger">Hủy</button>
                        <button type="submit" class="btn btn-primary">Tạo mới</button>
                    </div>

                </div>
                <div class="product-image col-md-6">
                    <div class="box-header with-border">
                        <h3 class="box-title">Ảnh sản phẩm</h3>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">Ảnh đại điện</label>
                        <input type="file" id="exampleInputFile">
                        <p class="help-block">Ảnh không được vượt quá 5MB</p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>