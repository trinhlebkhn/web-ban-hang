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

function showModal() {
    $('#QuickView').modal('show');
}

function deleteObj() {
    confirm('Bạn có chắc chắn muốn xóa không?');
}

function removeFormAdd(event) {
    event.preventDefault();
    $('div#add').addClass('hidden');
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



