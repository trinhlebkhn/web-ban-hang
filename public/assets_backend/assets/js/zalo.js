$('.synchronized-zalo').on('click', function () {
    var btn = $(this);
    var data_cat = $(this).attr('data-cat');
    var catObj = JSON.parse(data_cat);
    if(catObj.avatar !== null && catObj.avatar !== undefined) {
        $.ajax({
            url: '/backend/api_client/synchronizedCategoryForZalo',
            method: 'post',
            dataType: 'json',
            data: {data: data_cat}
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi  xảy ra!');
        }).done(function (data, status) {
            if(status) {
                snackbar(1, "Thao tác thành công!");
                btn.removeClass('btn-primary');
                btn.addClass('btn-warning');
                btn.html('Cập nhật trên zalo');
                btn.attr('data-cat', data.data);
            }
            else snackbar(2, data.message);
        });
    } else snackbar(2, 'Danh mục thiếu ảnh đại diện!');

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