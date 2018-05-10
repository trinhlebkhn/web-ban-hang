<div class="form-add-menu modal-form-add">
    {% set menu_block_id = object['menu_block_id'] %}
    <div class="header-dialog">
        <h3>Thông tin menu</h3>
    </div>
    <form role="form" method="post">
        <div class="row">
            <input type="text" name="{{ menu_block_id ? 'data[menu_block_id]' : 'data[parent_id]' }}" class="form-control hidden" id="id" placeholder="Tên Menu">
            <div class="form-group col-md-2 col-sm-6 col-xs-12">
                <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Tên menu</label>
                <input type="text" name="data[name]" class="form-control" id="name" placeholder="Tên Menu">
            </div>
            <div class="form-group col-md-2 col-sm-6 col-xs-12">
                <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Hành động</label>
                <select name="data[target]" class="form-control">
                    <option value="1">Mở tại trang</option>
                    <option value="2">Mở tại trang mới</option>
                </select>
            </div>
            <div class="form-group col-md-2 col-sm-6 col-xs-12">
                <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Vị trí </label>
                <input type="text" name="data[sort]" class="form-control" id="name" placeholder="Vị trí">
            </div>
            <div class="form-group col-md-3 col-sm-6 col-xs-12">
                <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Liên kết </label>
                <select id="type_link" name="" class="form-control" onchange="checkTypeLinkMenu()">
                    <option value="">Chọn liên kết</option>
                    <option value="1">Danh mục 1</option>
                    <option value="2">Danh mục sản phẩm</option>
                </select>
            </div>
            <div class="form-group col-md-3 col-sm-6 col-xs-12 link_menu hidden">
                <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Đối tượng danh mục </label>
                <select name="data[link]" class="form-control">
                    <option value="">Chọn danh mục</option>
                    <option value="1">Danh mục 1</option>
                    <option value="2">Danh mục 2</option>
                </select>
            </div>
        </div>
        <div class="box-footer pull-right manipulation">
            <button type="submit" class="btn btn-primary btn-add" onclick="addMenu()">Tạo mới</button>
            <button class="btn btn-danger btn-cancel" onclick="$('#QuickView').modal('hide')">Hủy</button>
        </div>
    </form>
</div>
