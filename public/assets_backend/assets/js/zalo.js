$('.synchronized-zalo').on('click', function () {
    var data_cat = $(this).attr('data-cat');
    console.log(data_cat);
    $.ajax({
        url: '/backend/api_client/synchronizedCategoryForZalo',
        method: 'post',
        dataType: 'json',
        data: {data: data_cat}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {

    });
});