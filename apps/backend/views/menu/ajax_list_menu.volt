{% set listData = object['data'] %}
{% set menuBlockId = object['menu_block_id'] %}
<div class="box-header">
    <h3 class="box-title">
        <span class="pointer" onclick="closeMenu()">Tắt</span> |
        <span class="pointer" onclick="addMenu({{ menuBlockId }}, 0)">Thêm menu</span>
    </h3>
</div>
<ul>
    {% for item in listData %}
        <li>
            <label class="name">{{ item['name'] }}</label>
            <span class="add-menu pointer" onclick="addMenu({{ menuBlockId }}, {{ item['id'] }})">Thêm menu</span> |
            <span class="edit-menu pointer"> Sửa</span> |
            <span class="trash-menu pointer"> Xóa</span>
        </li>
        {% if item['child'] | length > 0 %}
            <ul>
                {% for child in item['child'] %}
                    <li>
                        <label class="name">{{ child['name'] }}</label>
                        <span class="add-menu pointer" onclick="addMenu({{ menuBlockId }}, {{ child['id'] }})">Thêm menu</span> |
                        <span class="edit-menu pointer"> Sửa</span> |
                        <span class="trash-menu pointer"> Xóa</span>
                    </li>
                {% endfor %}
            </ul>
        {% endif %}

    {% endfor %}
</ul>