<div class="form-add-menu modal-form-add">
    <div class="header-dialog">
        <h3>Thêm danh mục trang chủ</h3>
    </div>
    <div class="row">
        <input type="text"  class="form-control hidden" id="menu_block_id" value="{{ menu_block_id }}">
        <input type="text"  class="form-control hidden" id="parent_id" value="{{ parent_id }}">
        <input type="text"  class="form-control hidden" id="menu_id" value="{{ data['id'] }}">
        <div class="form-group col-md-4 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Chọn menu</label>
            <select name="data[target]" class="form-control" id="target">
                <option value="1" {{ data['target'] == 1 ? 'selected' : '' }} >Mở tại trang</option>
                <option value="2" {{ data['target'] == 2 ? 'selected' : '' }}>Mở tại trang mới</option>
            </select>
        </div>
        <div class="form-group col-md-4 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Mô tả </label>
            <textarea placeholder="Mô tả" style="width: 100%; min-height: 35px"></textarea>
        </div>
        <div class="form-group col-md-4 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Vị trí </label>
            <input type="text" name="data[sort]" class="form-control" id="sort" value="{{ data['sort'] }}" placeholder="Vị trí">
        </div>
    </div>
    <div class="box-footer pull-right manipulation">
        <button type="submit" class="btn btn-primary btn-add" onclick="ajaxAddMenu()">{{ data['id'] ? 'Cập nhật' : 'Tạo mới' }}</button>
        <button class="btn btn-danger btn-cancel" onclick="$('#QuickView').modal('hide')">Hủy</button>
    </div>
</div>
