{% set listWards = object['data'] %}
<option value="">--Chọn Phường/Xã--</option>
{% for item in listWards %}
    <option value="{{ item['id'] }}">{{ item['name'] }}</option>
{% endfor %}