$('.synchronized-zalo').on('click', function () {
    var btn = $(this);
    var data_cat = $(this).attr('data-cat');
    var catObj = JSON.parse(data_cat);
    if (catObj.avatar !== null && catObj.avatar !== undefined) {
        $.ajax({
            url: '/backend/api_client/synchronizedCategoryForZalo',
            method: 'post',
            dataType: 'json',
            data: {data: data_cat}
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi  xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                btn.removeClass('btn-primary');
                btn.addClass('btn-warning');
                btn.html('Cập nhật trên zalo');
                if (data.data !== null || data.data !== undefined) btn.attr('data-cat', data.data);
                snackbar(1, "Thao tác thành công!");
            }
            else snackbar(2, data.message);
        });
    } else snackbar(2, 'Danh mục thiếu ảnh đại diện!');

});

$('.product-synchronized-zalo').on('click', function () {
    var btn = $(this);
    var parent = btn.closest('tr');
    var data_pro = $(this).attr('data-pro');
    var productObj = JSON.parse(data_pro);
    if (productObj.avatar !== null && productObj.avatar !== undefined && productObj.avatar.trim() !== '') {
        $.ajax({
            url: '/backend/api_client/synchronizedProductForZalo',
            method: 'post',
            dataType: 'json',
            data: {data: data_pro}
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi  xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                btn.removeClass('btn-primary');
                btn.addClass('btn-warning');
                btn.html('Cập nhật trên zalo');
                if (data.data !== null || data.data !== undefined) {
                    btn.attr('data-pro', JSON.stringify(data.data));
                    parent.find('.remove-action').removeClass('hidden');
                }
                snackbar(1, data.message);
            }
            else snackbar(2, data.message);
        });
    } else snackbar(2, 'Sản phẩm thiếu ảnh đại diện!');
});

$('.remove-synchronized-product').on('click', function () {
    var zalo_id = $(this).attr('zalo-id');
    var pro_id = $(this).attr('pro-id');
    var parent = $(this).closest('tr');
    $.ajax({
        url: '/backend/api_client/removeSynchronizedProductForZalo',
        method: 'post',
        dataType: 'json',
        data: {zalo_id: zalo_id, pro_id: pro_id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data.status) {
            var btn = parent.find('.product-synchronized-zalo');
            btn.removeClass('btn-warning');
            btn.addClass('btn-primary');
            btn.html('Đồng bộ trên Zalo');
            parent.find('.remove-action').addClass('hidden');
            snackbar(1, data.message);
        }
        else snackbar(2, data.message);
    });
});


