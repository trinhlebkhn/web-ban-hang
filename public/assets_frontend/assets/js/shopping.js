/**
 * button thêm hàng vào giỏ
 */

var shopping = {
    url: '/api_client/',
    get_product_price: function (obj) {
        var data_product = JSON.parse(obj.attr('data-product'));
        var qty = obj.find('.input-number').val();
        var data = {};
        data['id'] = data_product.id;
        data['avatar'] = data_product.avatar;
        data['name'] = data_product.name;
        data['price'] = data_product.price;
        data['price_sell'] = data_product.price_sell;
        data['slug'] = data_product.slug;
        data['weight'] = data_product.weight;
        data['quantity'] = qty;
        data['attribute'] = data_product.attribute;
        data['total_price'] = parseInt(data_product.price_sell) * parseInt(qty);
        return data;
    },

    add_product: function (product) {
        $.ajax({
            url: shopping.url + 'addProduct',
            method: 'post',
            dataType: 'json',
            data: {product: product}
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi  xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                $('.widget_shopping_cart_content .mini-cart-overview').html(data.content);
                snackbar(2, data.message)
            }
        });
    },

    delete_product: function (id, par) {
        $.ajax({
            url: shopping.url + 'deleteProduct',
            method: 'post',
            dataType: 'json',
            data: {id: id}
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi  xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                $('.widget_shopping_cart_content .mini-cart-overview').html(data.content);
                if(par.hasClass('wigget-cart')){
                    $('.rowId').each(function (index) {
                       if($(this).val() == id) {
                           var del = $(this).closest('.tr');
                           del.remove();
                       }
                    });
                } else {
                    par.remove();
                }
                $('.total_price').html(number_format(data.total_price));
                snackbar(2, data.message);
                if(data.total_product == 0) window.location.replace('/');
            }
        });
    },

    update_product: function (id, qty) {
        var data = {id: id, qty: qty}
        var ship_price = $('#ship_price').val();
        if(ship_price > 0) {
            data.ship_price = ship_price;
        }
        $.ajax({
            url: shopping.url + 'updateProduct',
            method: 'post',
            dataType: 'json',
            data: data
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi  xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                console.log(data);
                $('.widget_shopping_cart_content .mini-cart-overview').html(data.content);
                $('.subtotal').html(number_format(data.subtotal) + ' đ');
                $('.total_price').html(number_format(data.total_price) + ' đ');
            }
        });
    }
};

/* Thêm và xóa sản phẩm */
$(document).on('click', '.btn-plus', function (e) {
    var par = $(this).closest('.tr');
    var val = par.find('.input-number').val();
    par.find('.input-number').val(parseInt(val) + 1);
    if($(this).hasClass('update-cart')) {
        var id = par.find('.rowId').val();
        var qty = par.find('.input-number').val();
        shopping.update_product(id, qty);
        var price = par.find('.product__price__regular').attr('price');
        par.find('.total_price_item').html(number_format(parseInt(price) * parseInt(qty)) + ' đ');
    }
});
$(document).on('click', '.btn-minus', function (e) {
    var par = $(this).closest('.tr');
    var val = par.find('.input-number').val();
    if ((parseInt(val) - 1) > 0)  {
        par.find('.input-number').val(parseInt(val) - 1);
        if($(this).hasClass('update-cart')) {
            var id = par.find('.rowId').val();
            var qty = par.find('.input-number').val();
            shopping.update_product(id, qty);
            var price = par.find('.product__price__regular').attr('price');
            par.find('.total_price_item').html(number_format(parseInt(price) * parseInt(qty)) + ' đ');
        }
    }
});

$(document).on('change', '.input-number', function (e) {
    var par = $(this).closest('.tr');
    if($(this).hasClass('update-cart')) {
        var id = par.find('.rowId').val();
        var qty = $(this).val();
        shopping.update_product(id, qty);
    }
});

$(document).on('click', '.btn-delete', function (e) {
    e.preventDefault();
    var r = confirm('Bạn có muốn xóa sản phẩm khỏi giỏ hàng?');
    var par = $(this).closest('.tr');
    var id = par.find('.rowId').val();
    shopping.delete_product(id, par);
});

$(document).on('click', '.product__view__button__cart', function (e) {
    e.preventDefault();
    var obj = $(this).closest('.productJson');
    var product = shopping.get_product_price(obj);
    if (product) {
        shopping.add_product(product);
    } else {
        snackbar(2, 'Có lỗi xảy ra!');
        return;
    }
});

$(document).on('click', '.product__view__button__cart_order', function () {
    var obj = $(this).closest('.productJson');
    var product = shopping.get_product_price(obj);
    if (product) {
        shopping.add_product(product);
    }
    else {
        snackbar(2, 'Có lỗi xảy ra!');
        return false;
    }
});

function snackbar(type, message) {
    if (!$("#snackbar").length) {
        $("body").append('<div id="snackbar"></div>');
    }
    if (type == '2') {
        $("#snackbar").addClass('error');
    }
    $("#snackbar").html(message);
    $("#snackbar").removeClass('show');
    $("#snackbar").addClass('show');
    // After 3 seconds, remove the show class from DIV
    setTimeout(function () {
        $("#snackbar").removeClass('show');
    }, 3000);
}

function number_format(number, decimals, decPoint, thousandsSep) {
    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number;
    var prec = (typeof thousandsSep === 'undefined') && !isFinite(+decimals) ? 0 : Math.abs(decimals);
    var sep = (typeof thousandsSep === 'undefined') ? ',' : thousandsSep;
    var dec = (typeof decPoint === 'undefined') ? '.' : decPoint;
    var s;
    var toFixedFix = function (n, prec) {
        var k = Math.pow(10, prec);
        return '' + (Math.round(n * k) / k)
            .toFixed(prec);
    };
    // @todo: for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}
