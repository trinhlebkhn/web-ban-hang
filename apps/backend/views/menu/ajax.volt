{% set data = object['data'] %}
<form role="form" method="post">
    <div class="form-group">
        <label style="font-size: 20px; padding-top: 5px; padding-bottom: 20px; font-weight: 100">Tên khối Menu</label>
        <input type="text" name="data[name]" value="{{ data['name'] }}" class="form-control" id="name" placeholder="Tên khối Menu">
        <input type="text" name="data[id]" value="{{ data['id'] }}" class="form-control hidden" id="id">
        <input type="text" name="data[check]" value="{{ data['is_main'] ? data['is_main'] : '' }}" class="form-control hidden" id="id">
    </div>
    <div class="form-group">
        <input type="checkbox" class="minimal" name="data[is_main]" {{ data['is_main'] == 1 ? 'checked' : '' }} id="is_main"  value="1"> Chọn làm menu chính
    </div>
    <div class="box-footer pull-right manipulation">
        <button type="submit" class="btn btn-primary btn-add">Cập nhật</button>
        <button class="btn btn-danger btn-cancel" onclick="removeFormAdd(event)">Hủy</button>
    </div>
</form>