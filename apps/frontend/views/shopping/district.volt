{% set listDistricts = object['data'] %}
<option value="">--Chọn quận huyện--</option>
{% for item in listDistricts %}
    <option value='{{ item | json_encode }}'>{{ item['name'] }}</option>
{% endfor %}