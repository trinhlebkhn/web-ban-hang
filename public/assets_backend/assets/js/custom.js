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

function ajaxAddCatHomePage() {
    $.ajax({
        url: '/backend/api_client/addCatHomePage',
        method: 'post',
        dataType: 'json',
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').html(data.content);
    });
    $('#QuickView').modal('show');
}

//
// $('#edit-cat').on('click', function () {
//     var parent = $(this).parent();
//     var id = parent.find('input.id').val();
//     $.ajax({
//         url: '/backend/api_client/getDetail',
//         method: 'post',
//         dataType: 'json',
//         data: {id: id, model: 'Category'}
//     }).fail(function (ui, status) {
//         snackbar(2, 'Có lỗi  xảy ra!');
//     }).done(function (data, status) {
//         if (data.status) {
//             if($('section#add').hasClass('hidden')){
//                 $('section#add').removeClass('hidden');
//             }
//         }
//         else {
//             snackbar(2, 'Có lỗi hệ thống xảy ra!');
//         }
//     });
// });



