{% set listData = object['data'] %}
{% set menuBlockId = object['menu_block_id'] %}
<div class="box-header">
    <h3 class="box-title">
        <span class="pointer" onclick="closeMenu()">Tắt</span> |
        <span class="pointer" onclick="addMenu({{ menuBlockId }}, null)">Thêm menu</span>
    </h3>
</div>
<ul>
    {% for item in listData %}
        <li>
            <label class="name">{{ item['name'] }}</label>
            <span class="add-menu pointer">Thêm menu</span> |
            <span class="edit-menu pointer"> Sửa</span> |
            <span class="trash-menu pointer"> Xóa</span>
        </li>
        <ul>
            <li>menu con 1</li>
            <li>menu con 2</li>
            <li>menu con 3</li>
        </ul>
    {% endfor %}
</ul>