<div class="form-add-attr modal-form-add">
    <div class="header-dialog">
        <h3>Thông tin thuộc tính</h3>
    </div>
    <div class="row">
        <div class="col-md-12 form-group d-flex box-add-attribute">
            <label class="col-md-5" style="font-size: 20px; padding-top: 5px; font-weight: 100">Tên thuộc tính</label>
            <input type="text" name="data[name]" class="form-control col-md-7" id="name_attr" value="{{ data['name'] }}"
                   placeholder="Ví dụ: Dây da, Màu sắc,..." onkeyup="$(this).removeClass('error')">
        </div>
    </div>
    <div class="box-footer pull-right manipulation">
        <button type="submit" class="btn btn-primary btn-add"
                onclick="ajaxAddAttribute()">{{ data['id'] ? 'Cập nhật' : 'Tạo mới' }}</button>
        <button class="btn btn-danger btn-cancel" onclick="$('#QuickView').modal('hide')">Hủy</button>
    </div>
</div>
