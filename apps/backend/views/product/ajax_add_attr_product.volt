{% set listAttr = object['listAttr'] %}
<div class="row item">
    <div class="col-md-6">
        <div id="item_0" class="attribute d-flex">
            {#<select name="product[attribute_id]" class="form-control" onchange="disableAttr(event, this)">#}
            <select name="product[attribute_id][]" class="form-control">
                <option disabled>Chọn thuộc tính</option>
                {% for attr in listAttr %}
                    <option value="{{ attr['id'] }}" >{{ attr['name'] }}</option>
                {% endfor %}
            </select>
            <button type="button" class="btn btn-primary" onclick="ajaxAddAttrProduct()" title="Thêm thuộc tính"><i
                        class="fa fa-plus"></i></button>
        </div>
    </div>
    <div class="col-md-6 d-flex value-attribute">
        <input type="text" class="form-control" placeholder="" name="product[attribute_value][]">
        <button type="button" class="btn btn-primary" onclick="addAttrProduct()" title="Thêm thuộc tính sản phẩm"><i
                    class="fa fa-plus"></i></button>
        <button type="button" class="btn btn-danger delete-item" onclick="removeAttrProduct(this)" title="Xóa thuộc tính sản phẩm"><i
                    class="fa fa-trash"></i></button>
    </div>
</div>