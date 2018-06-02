{% set listCat = object['listCat'] %}
{% set obj = object['obj'] %}


<div class="form-add-menu modal-form-add">
    <div class="header-dialog">
        <h3>Thêm danh mục trang chủ</h3>
    </div>
    <div class="row">
        <div class="form-group col-md-4 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Chọn danh mục</label>
            <select name="data[id]" class="form-control" id="cat_home_id">
                <option value="">Chọn danh mục</option>
                {% for item in listCat %}
                    <option value="{{ item['id'] }}" {{ item['id'] == obj['id'] ? 'selected' : 'disabled' }}>{{ item['name'] }}</option>
                {% endfor %}
            </select>
        </div>
        <div class="form-group col-md-4 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Mô tả </label>
            <textarea placeholder="Mô tả" style="height: 35px; max-width: 100%; min-height: 35px; min-width: 100%" id="cat_home_desc">{{ obj['desc'] }}</textarea>
        </div>
        <div class="form-group col-md-4 col-sm-6 col-xs-12">
            <label style="font-size: 20px; padding-top: 5px; font-weight: 100">Vị trí </label>
            <input type="text" name="data[sort]" class="form-control" id="cat_home_sort" value="{{ obj['sort'] }}" placeholder="Vị trí">
        </div>
    </div>
    <div class="box-footer pull-right manipulation">
        <button type="submit" class="btn btn-primary btn-add" onclick="ajaxCatHome()">Xác nhận</button>
        <button class="btn btn-danger btn-cancel" onclick="$('#QuickView').modal('hide')">Hủy</button>
    </div>
</div>
