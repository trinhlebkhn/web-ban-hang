{% include "layouts/header.volt" %}

{% include "layouts/sidebar.volt" %}

<div class="content-wrapper">
    <section class="content">
        <div class="row add-menu">
            <div class="col-md-12">
                <div class="col-md-6">
                    <div class="box-header">
                        <h3 class="box-title">Danh sách Menu</h3>
                        <div class="pull-right">
                            <button type="button" class="btn btn-primary pointer" onclick="addFormAdd()">Thêm khối Menu
                            </button>
                        </div>
                    </div>
                    {{ this.flash.output() }}
                    <div class="table-responsive">
                        <table class="table" style="border: 1px solid #f3f3f3">
                            <tbody>
                            {% for item in listData %}
                                {% if item['del_flag'] != 1 %}
                                    <tr>
                                        <td width="70%">{{ item['name'] }}</td>
                                        <td width="30%">
                                            <span class="pointer" onclick="showListMenu({{ item['id'] }})">Xem</span> |
                                            <span class="pointer" onclick="updateMenuBlock({{ item['id'] }})">Sửa</span>
                                            |
                                            <a href="/quan-tri/xoa-menu-block?id={{ item['id'] }}" class="delete-item"><span class="pointer">Xóa</span>
                                            </a>
                                        </td>
                                    </tr>
                                {% endif %}
                            {% endfor %}
                            </tbody>
                        </table>
                    </div>
                    {#<div class="pagination">#}
                    {#{% include 'layouts/pagination.volt' %}#}
                    {#</div>#}
                </div>
                <div class="col-md-6">
                    <div id="add" class="hidden">
                        <form role="form" method="post">
                            <div class="form-group">
                                <label style="font-size: 20px; padding-top: 5px; padding-bottom: 20px; font-weight: 100">Tên
                                    khối Menu</label>
                                <input type="text" name="data[name]" class="form-control" id="name"
                                       placeholder="Tên khối Menu">
                            </div>
                            <div class="form-group">
                                <input type="checkbox" class="minimal" name="data[is_main]" id="is_main" value="1"> Chọn
                                làm menu chính
                            </div>
                            <div class="box-footer pull-right manipulation">
                                <button type="submit" class="btn btn-primary btn-add">Tạo mới</button>
                                <button class="btn btn-danger btn-cancel" onclick="removeFormAdd(event)">Hủy</button>
                            </div>
                        </form>
                    </div>
                    <div id="menu"></div>
                </div>
            </div>
        </div>
    </section>
</div>

{% include "layouts/footer.volt" %}
<!-- ./wrapper -->
