
$(document).ready(function () {
    $('.delete-item').on('click', function () {
        return confirm('Bạn có chắc chắn muốn xóa hay không?');
    })
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
    console.log("menu_block_id", menu_block_id);
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

function addMenu(menu_block_id) {
    $.ajax({
        url: '/backend/api_client/addMenu',
        method: 'post',
        dataType: 'json',
        data: {menu_block_id: menu_block_id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        $('#QuickView').html(data.content);
    });
    $('#QuickView').modal('show');
}

function checkTypeLinkMenu() {
    if ($('#type_link').val() != 2) {
        $('div.link_menu').addClass('hidden');
    } else {
        $('div.link_menu').removeClass('hidden');
    }
}

function removeFormAdd(event) {
    event.preventDefault();
    $('div#add').addClass('hidden');
}

function addMenu() {

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



