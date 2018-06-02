{% set listCat = object['listCat'] %}

{% for index, item in listCat %}
    <tr>
        <td scope="row">{{ index + 1 }}</td>
        <td>{{ item['name'] }}</td>
        <td>{{ item['desc'] }}</td>
        <td>
            {{ item['sort'] }}
        </td>
        <td>
            <span class="icon-manipulation pointer" id="edit-cat" title="Chỉnh sửa vị trí danh mục" onclick="editCatHome({{ item['id'] }})"><i class="fa fa-list"></i></span>
            <a href="/quan-tri/xoa-danh-muc?id={{ item['id'] }}"><span class="icon-manipulation pointer delete-item" id="trash-cat" title="Xóa danh mục"><i class="fa fa-trash"></i></span></a>
        </td>
    </tr>
{% endfor %}