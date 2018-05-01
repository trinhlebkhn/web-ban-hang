function check_discount(value) {
    if (value) {
        $('.discount-type').removeClass('hidden');
    } else {
        $('.discount-type').addClass('hidden');
    }
}

function addCat() {
    $('section#add').removeClass('hidden');
}

function removeAddCat(event) {
    event.preventDefault();
    $('section#add').addClass('hidden');
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



