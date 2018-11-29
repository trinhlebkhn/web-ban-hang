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
    getShipPrice();
});
$(document).on('change', '#service', function (e) {
    var district_id = $('#district').val();
    if(district_id > 0) getShipPrice();
});
$(document).on('change', '#storehouse', function (e) {
    var district_id = $('#district').val();
    if(district_id > 0) getShipPrice();
});

function getShipPrice() {
    var city_id = $('#city').val();
    var district_id = $('#district').val();
    var address_receive = {
        'city_id' : city_id,
        'district' : district_id,
    };
    var service = $('#service_value').val();
    var storehouse = $('#storehouse').val();
    $.ajax({
        url: '/api_client/getFeeTransport',
        method: 'post',
        dataType: 'json',
        data: {address_receive: address_receive, service: service, storehouse: storehouse}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi  xảy ra!');
    }).done(function (data, status) {
        if (data.status) {
            snackbar(1, data.message);
            $('#ship_price').val(data.ship_price);
            $('.total-fee-transport').html(number_format(data.ship_price) + ' đ');
            $('.total_price').html(number_format(data.total_price) + ' đ');
            $('.total_price').attr('price', data.total_price);
            $('#total_price').vale(data.total_price);
        } else {
            snackbar(2, data.message);
        }
    });
}