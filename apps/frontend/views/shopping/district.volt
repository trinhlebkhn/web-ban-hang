<option value="">--Chọn quận huyện--</option>
{% for item in district %}
    <option value="{{ item.id }}">{{ item.name }}</option>
{% endfor %}