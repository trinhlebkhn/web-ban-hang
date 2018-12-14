{% set listCat = object['list_cat'] %}
<option value="">Chọn danh mục</option>
{% for item in listCat %}
    <option value="{{ item['id'] }}" >{{ item['name'] }}</option>
{% endfor %}
