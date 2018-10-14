$(document).ready(function () {
    $('.delete-item').on('click', function () {
        return confirm('Bạn có chắc chắn muốn xóa hay không?');
    });

    $('input#name_menu').on('keyup', function () {
        console.log(11111);
        if ($(this).hasClass('error')) {
            $(this).removeClass('error');
        }
    });

});


function check_discount(value) {
    if (value) {
        $('.discount-type').removeClass('hidden');
    } else {
        $('.discount-type').addClass('hidden');
    }
}

function addFormAdd() {
    $('div#add').removeClass('hidden');
    $('section#add').removeClass('hidden');
}

function updateMenuBlock(id) {
    var data = {};
    data['id'] = id;
    data['model'] = 'MenuBlock';
    data['controller'] = 'menu';
    data['action'] = 'ajax';
    $.ajax({
        url: '/backend/api_client/getDetail',
        method: 'post',
        dataType: 'json',
        data: {data: data}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data.status) {
            console.log('content', data);
            $('div.add-menu div#add').removeClass('hidden');
            $('div.add-menu div#add').html(data.content);
        }
        else {
            snackbar(2, 'Có lỗi hệ thống xảy ra!');
        }
    });
}

function closeMenu() {
    $('div.add-menu div#menu').addClass('hidden');
}

function showListMenu(menu_block_id) {
    $.ajax({
        url: '/backend/api_client/getListMenu',
        method: 'post',
        dataType: 'json',
        data: {id: menu_block_id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data.status) {
            console.log('content', data);
            $('div.add-menu div#menu').removeClass('hidden');
            $('div.add-menu div#menu').html(data.content);
        }
        else {
            snackbar(2, 'Có lỗi hệ thống xảy ra!');
        }
    });
}

function addMenu(menu_block_id, parent_id) {
    $.ajax({
        url: '/backend/api_client/addMenu',
        method: 'post',
        dataType: 'json',
        data: {menu_block_id: menu_block_id, parent_id: parent_id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').html(data.content);
    });
    $('#QuickView').modal('show');
}

function checkTypeLinkMenu() {
    if ($('#type_link').val() != 4) {
        $('div.link_menu').addClass('hidden');
    } else {
        $('div.link_menu').removeClass('hidden');
    }
}

function removeFormAdd(event) {
    event.preventDefault();
    $('div#add').addClass('hidden');
    $('section#add').addClass('hidden');
}

function ajaxAddMenu() {
    var data = {};
    var id = $('#menu_id').val();
    var menu_block_id = $('#menu_block_id').val();
    var parent_id = $('#parent_id').val();
    var name = $('#name_menu').val();
    var target = $('#target').val();
    var sort = $('#sort').val();
    var type_link = $('#type_link').val();
    var link = $('#link').val();
    if (name == '') {
        snackbar(2, 'Vui lòng điền tên menu!');
        $('#name_menu').addClass('error');
        return;
    }
    data['id'] = id;
    data['menu_block_id'] = menu_block_id;
    data['parent_id'] = parent_id;
    data['name'] = name;
    data['target'] = target;
    data['sort'] = sort;
    data['type_link'] = type_link;
    data['link'] = link;
    $.ajax({
        url: '/backend/api_client/creatMenu',
        method: 'post',
        dataType: 'json',
        data: {data: data}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').modal('hide');
        if (data.status) {
            $('div.add-menu div#menu').html(data.content);
            snackbar(2, 'Thao tác thành công!');
        }
        else {
            snackbar(2, 'Có lỗi hệ thống xảy ra!');
        }
    });
}

function ajaxEditMenu(menu_id) {
    $.ajax({
        url: '/backend/api_client/editMenu',
        method: 'post',
        dataType: 'json',
        data: {id: menu_id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').html(data.content);
    });
    $('#QuickView').modal('show');
}

function deleteMenu(menu_id, menu_block_id) {
    var check = confirm('Bạn có chắc chắn muốn xóa hay không?');
    if (check) {
        $.ajax({
            url: '/backend/api_client/deleteMenu',
            method: 'post',
            dataType: 'json',
            data: {id: menu_id, menu_block_id: menu_block_id}
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi  xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                $('div.add-menu div#menu').html(data.content);
                snackbar(2, 'Thao tác thành công!');
            }
            else {
                snackbar(2, 'Có lỗi hệ thống xảy ra!');
            }
        });
    } else {
        return false;
    }
}

function ajaxCatHomePage() {
    $.ajax({
        url: '/backend/api_client/ajaxCatHomePage',
        method: 'post',
        dataType: 'json',
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').html(data.content);
    });
    $('#QuickView').modal('show');
}

function ajaxCatHome() {
    var id = $('#cat_home_id').val();
    var desc = $('#cat_home_desc').val();
    var sort = $('#cat_home_sort').val();

    if (id == '') {
        snackbar(2, 'Vui lòng chọn danh mục!');
        return;
    }

    var data = {};
    data['id'] = id;
    data['desc'] = desc;
    data['sort'] = sort;

    $.ajax({
        url: '/backend/api_client/addCatHome',
        method: 'post',
        dataType: 'json',
        data: {data: data}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('.list-cat-home-page').html(data.content);
    });
    $('#QuickView').modal('hide');
}

function editCatHome(id) {
    $.ajax({
        url: '/backend/api_client/ajaxCatHomePage',
        method: 'post',
        dataType: 'json',
        data: {id: id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').html(data.content);
    });
    $('#QuickView').modal('show');
}

/* Thêm thuộc loại tính */
function ajaxAddAttrProduct() {
    $.ajax({
        url: '/backend/api_client/addAttr',
        method: 'post',
        dataType: 'json',
        data: {}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').html(data.content);
    });
    $('#QuickView').modal('show');
}

/* Thuộc tính sản phẩm */
function ajaxAddAttribute() {
    var name = $('#name_attr').val();
    if (name == '') {
        snackbar(2, 'Vui lòng điền tên thuộc tính!');
        $('#name_attr').addClass('error');
        return;
    }
    var data = {};
    data['name'] = name;
    $.ajax({
        url: '/backend/api_client/createAttr',
        method: 'post',
        dataType: 'json',
        data: {data: data}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data.status) {
            $('#attribute').html(data.content);
            snackbar(2, 'Thao tác thành công!');
            $('#QuickView').modal('hide');
        }
        else return snackbar(2, data.message);
    });
}

function addAttrProduct() {
    $.ajax({
        url: '/backend/api_client/addAttrProduct',
        method: 'post',
        dataType: 'json',
        data: {}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data.status) {
            $('#list-attribute').append(data.content);
        }
    });
}

function removeAttrProduct(item) {
    var attrProductItem = item.closest('.item');
    console.log(attrProductItem);
    attrProductItem.remove();
}

function disableAttr(e, attrItem) {
    var value = e.target.value;
    var arrAttrDisable = JSON.parse($('#arr_attr_disable').val());
    var index = arrAttrDisable.indexOf(parseInt(value));
    if (index === -1) {
        arrAttrDisable.push(parseInt(value));
    } else {
        arrAttrDisable.splice(index, 1);
    }
    $.ajax({
        url: '/backend/api_client/disableAttr',
        method: 'post',
        dataType: 'json',
        data: {arrDisable: arrAttrDisable}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data.status) {
            $('#arr_attr_disable').val(JSON.stringify(arrAttrDisable));
            $('div.list-attribute .item').each(function (i) {
                var attribute = this.querySelector('select');
                $(attribute).html(data.content);
            });
            $(attrItem).val(value);
        }
    });
}