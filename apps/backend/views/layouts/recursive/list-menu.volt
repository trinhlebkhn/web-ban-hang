{% for item in data %}
    <li>
        <label class="name">{{ item['name'] }}</label>
        <span class="add-menu pointer" onclick="addMenu({{ menuBlockId }}, {{ item['id'] }})">Thêm menu</span> |
        <span class="edit-menu pointer" onclick="ajaxEditMenu({{ item['id'] }})"> Sửa</span> |
       <span class=" delete-item trash-menu pointer" onclick="deleteMenu({{ item['id'] }})" > Xóa</span>
    </li>
    {% if item['child'] | length > 0 %}
        <ul>
            {{ uiHelper.drawRecursiveMenuAdmin('layouts/recursive/list-menu', item['child'], menuBlockId) }}
        </ul>
    {% endif %}
{% endfor %}