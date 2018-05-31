{% set data = object['data'] %}
{% set data_obj = object['data_obj'] %}
{% for index, item in data %}
    <div class="col-md-4 col-sm-6">
        <div class="img-product-single" style="position: relative">
            <img id="blog_avatar" src="{{ item }}" alt="" style="width: 100%; height: 100%;">
            <i class="fa fa-trash text-danger pointer" style="position: absolute;top: 10px;right: 15px"
               onclick="removeImgProduct({{ index }})"></i>
        </div>
        <input class="hidden" name="product[image][{{ index }}]" value="{{ item }}" id="list_img" type="text">
    </div>
{% endfor %}
{% if data | length < 9 %}
    <div class="col-md-4 col-sm-6">
        <div class="boxborder text-center d-flex justify-content-center align-items-center pointer img-product-single"
             onclick="img_product.click()">
            <div class="d-inline-block" style="margin: auto">
                <p>Ảnh slide</p>
            </div>
        </div>
    </div>
    <input #img_product class="hidden" type="file" id="img_product"
           onchange="uploadImgProduct(img_product,img_product.files[0], {{ data['id'] }})">
{% endif %}


