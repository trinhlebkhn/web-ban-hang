<section class="content">
    <div class="row">
        <div class="add-product">
            <form role="form" method="post">
                <div class="product-info col-md-6">
                    <div class="box-header with-border">
                        <h3 class="box-title">Thêm mới danh mục</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Tên Danh mục</label>
                            <input type="text" name="category[name]" class="form-control" id="name" placeholder="Tên sản phẩm">
                        </div>
                        {#<div class="form-group">#}
                            {#<label>Danh mục cha</label>#}
                            {#<select id="selectpicker" name="category['category_id']" class="selectpicker form-control"#}
                                    {#title="Chọn danh mục" multiple>#}
                                {#<option selected="selected">Alabama</option>#}
                                {#<option>Alaska</option>#}
                                {#<option>California</option>#}
                                {#<option>Delaware</option>#}
                                {#<option>Tennessee</option>#}
                                {#<option>Texas</option>#}
                                {#<option>Washington</option>#}
                            {#</select>#}
                        {#</div>#}
                        <div class="form-group product-status">
                            <label>Trạng thái: </label>
                            <label>
                                <input type="radio" name="category[status]" class="flat-red" value="1" checked>
                                <span>Hoạt động</span>
                            </label>
                            <label>
                                <input type="radio" name="category[status]" class="flat-red" value="0">
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
