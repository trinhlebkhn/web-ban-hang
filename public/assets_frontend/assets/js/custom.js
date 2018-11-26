$(document).on('change', '#city', function (e) {
    $('#district').val();
    $('#ward').val();
    var city_data = JSON.parse($(this).val());
    var id = city_data.id;
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
    var district_data = JSON.parse($(this).val());
    var id = district_data.id;
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

$(document).on('change', '#ward', function (e) {
    getShipPrice();
});
$(document).on('change', '#service_value', function (e) {
    var ward_id = $('#ward').val();
    if(ward_id > 0) getShipPrice();
});
$(document).on('change', '#storehouse', function (e) {
    var ward_id = $('#ward').val();
    if(ward_id > 0) getShipPrice();
});

function getShipPrice() {
    var city_data = JSON.parse($('#city').val());
    var district_data = JSON.parse($('#district').val());
    var ward_data = JSON.parse($('#ward').val());
    var address_receive = {
        'city_id' : city_data.viettelpost_id,
        'district' : district_data.viettelpost_id,
        'ward_id' : ward_data.viettelpost_id
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