$(document).on('change', '#city', function (e) {
    $('#district').val();
    $('#ward').val();
    var id = $(this).val();
    $.ajax({
        url: '/api_client/getDistricts',
        method: 'post',
        dataType: 'json',
        data: {id: id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data) {
            $('#district').html(data);
        }
    });
});

$(document).on('change', '#district', function (e) {
    $('#ward').val();
    var id = $(this).val();
    $.ajax({
        url: '/api_client/getWards',
        method: 'post',
        dataType: 'json',
        data: {id: id}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data) {
            $('#ward').html(data);
        }
    });
});
