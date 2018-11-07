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
        if(status) snackbar(1, "Thao tác thành công!");
        else snackbar(2, data.message);
    });
});

$('.product-synchronized-zalo').on('click', function () {
    var data_pro = $(this).attr('data-pro');
    $.ajax({
        url: '/backend/api_client/synchronizedProductForZalo',
        method: 'post',
        dataType: 'json',
        data: {data: data_pro}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if(status) snackbar(1, data.message);
        else snackbar(2, data.message);
    });
});