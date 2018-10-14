{% set listData = object['data'] %}
{% set item = object['item'] %}
{% set arrDisable = object['arrDisable'] %}
<option disabled>Chọn thuộc tính</option>
{% for attr in listData %}
    <option value="{{ attr['id'] }}"
            {{ attr['id'] == item['id'] ? 'selected' : '' }}
            {{ uiHelper.check_in_array(attr['id'], arrDisable) ? 'disabled' : '' }}>{{ attr['name'] }}
    </option>
{% endfor %}