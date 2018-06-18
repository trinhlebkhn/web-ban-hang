<option value="">--Chọn Phường/Xã--</option>
{% for item in ward %}
    <option value="{{ item.id }}">{{ item.name }}</option>
{% endfor %}