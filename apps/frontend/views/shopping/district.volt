{% set listDistricts = object['data'] %}
<option value="">--Chọn quận huyện--</option>
{% for item in listDistricts %}
    <option value='{{ item.DISTRICT_ID }}'>{{ item.DISTRICT_NAME }}</option>
{% endfor %}