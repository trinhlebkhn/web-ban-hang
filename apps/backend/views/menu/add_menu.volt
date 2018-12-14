<div class="form-add-menu modal-form-add">
    {% set data = object['data'] %}
    {% set menu_block_id = object['menu_block_id'] %}
    {% set parent_id = object['parent_id'] %}
    {% set listCat = object['list_cat'] %}
    <div class="header-dialog">
        <h3>Thông tin menu</h3>
    </div>
    <div class="row">
        <input type="text" class="form-control hidden" id="menu_block_id" value="{{ menu_block_id }}">
        <input type="text" class="form-control hidden" id="parent_id" value="{{ parent_id }}">
        <input type="text" class="form-control hidden" id="menu_id" value="{{ data['id'] }}">
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
                <option value="1" {{ data['type_link'] == 1? 'selected' : '' }}>Đường dẫn tùy chọn</option>
                <option value="2" {{ data['type_link'] == 2? 'selected' : '' }}>Danh mục tin tức</option>
                <option value="3" {{ data['type_link'] == 3? 'selected' : '' }}>Danh mục sản phẩm</option>
            </select>
        </div>
        <div class="form-group col-md-3 col-sm-6 col-xs-12 link_menu_category {{ data['type_link'] == 1 or data['type_link'] == '' or  listCat | length == 0? 'hidden' : '' }}">
            <div class="form-group col-md-3 col-sm-6 col-xs-12 link_menu_category">
                <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Chọn danh mục </label>
                <select name="data[cat_id]" class="form-control" id="choose_cat">
                    <option value="">Chọn danh mục</option>
                    {% for item in listCat %}
                        <option value="{{ item['id'] }}" {{ data['cat_id'] == item['id'] ? 'selected' : '' }} >{{ item['name'] }}</option>
                    {% endfor %}
                </select>
            </div>
        </div>
        <div class="form-group col-md-3 col-sm-6 col-xs-12 {{ data['type_link'] == 1 ? '' : 'hidden' }}" id="flexible_link">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Đường dẫn</label>
            <input type="text" name="data[link]" class="form-control" value="{{ data['link'] }}" placeholder="Đường dẫn" id="link">
        </div>
    </div>
    <div class="box-footer pull-right manipulation">
        <button type="submit" class="btn btn-primary btn-add" onclick="ajaxAddMenu()">{{ data['id'] ? 'Cập nhật' : 'Tạo mới' }}</button>
        <button class="btn btn-danger btn-cancel" onclick="$('#QuickView').modal('hide')">Hủy</button>
    </div>
</div>
