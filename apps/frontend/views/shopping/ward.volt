{% set listWards = object['data'] %}
<option value="">--Chọn Phường/Xã--</option>
{% for item in listWards %}
    <option value='{{ item | json_encode }}'>{{ item['name'] }}</option>
{% endfor %}