<div class="form-add-menu modal-form-add">
    {% set data = object['data'] %}
    {% set menu_block_id = object['menu_block_id'] %}
    {% set parent_id = object['parent_id'] %}
    <div class="header-dialog">
        <h3>Thông tin menu</h3>
    </div>
    <div class="row">
        <input type="text"  class="form-control hidden" id="menu_block_id" value="{{ menu_block_id }}">
        <input type="text"  class="form-control hidden" id="parent_id" value="{{ parent_id }}">
        <input type="text"  class="form-control hidden" id="menu_id" value="{{ data['id'] }}">
        <div class="form-group col-md-2 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Tên menu</label>
            <input type="text" name="data[name]" class="form-control" id="name_menu" value="{{ data['name'] }}" placeholder="Tên Menu" onchange="$(this).removeClass('error')">
        </div>
        <div class="form-group col-md-2 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Hành động</label>
            <select name="data[target]" class="form-control" id="target">
                <option value="1" {{ data['target'] == 1 ? 'selected' : '' }} >Mở tại trang</option>
                <option value="2" {{ data['target'] == 2 ? 'selected' : '' }}>Mở tại trang mới</option>
            </select>
        </div>
        <div class="form-group col-md-2 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Vị trí </label>
            <input type="text" name="data[sort]" class="form-control" id="sort" value="{{ data['sort'] }}" placeholder="Vị trí">
        </div>
        <div class="form-group col-md-3 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Liên kết </label>
            <select id="type_link" name="" class="form-control" onchange="checkTypeLinkMenu()">
                <option value="">Chọn liên kết</option>
                <option value="1" {{ data['type_link'] == 1? 'selected' : '' }}>Trang sản phẩm</option>
                <option value="2" {{ data['type_link'] == 2? 'selected' : '' }}>Trang tin tức</option>
                <option value="3" {{ data['type_link'] == 3? 'selected' : '' }}>Trang liên hệ</option>
                <option value="4" {{ data['type_link'] == 4? 'selected' : '' }}>Danh mục sản phẩm</option>
            </select>
        </div>
        <div class="form-group col-md-3 col-sm-6 col-xs-12 link_menu {{ data['type_link'] != 4? 'hidden' : '' }}">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Đối tượng danh mục </label>
            <select name="data[link]" class="form-control" id="link">
                <option value="">Chọn danh mục</option>
                <option value="2">Danh mục sản phẩm</option>
            </select>
        </div>
    </div>
    <div class="box-footer pull-right manipulation">
        <button type="submit" class="btn btn-primary btn-add" onclick="ajaxAddMenu()">{{ data['id'] ? 'Cập nhật' : 'Tạo mới' }}</button>
        <button class="btn btn-danger btn-cancel" onclick="$('#QuickView').modal('hide')">Hủy</button>
    </div>
</div>
