{% set listData = object['data'] %}
{% set menuBlockId = object['menu_block_id'] %}
<div class="box-header">
    <h3 class="box-title">
        <span class="pointer" onclick="closeMenu()">Tắt</span> |
        <span class="pointer" onclick="addMenu({{ menuBlockId }}, 0)">Thêm menu</span>
    </h3>
</div>
<ul>
    {{ uiHelper.drawRecursiveMenuAdmin('layouts/recursive/list-menu', listData, menuBlockId) }}
</ul>