/* UPLOAD ẢNH */
function uploadImage(input, image) {
    if (image != undefined) {
        var valid = check_image(image);
        if (!valid) {
            snackbar(2, get_check_message());
            input.value = '';
            return;
        }
        var formData = new FormData();
        formData.append('file', image);
        $.ajax({
            url: '/backend/api_client/uploadImage',
            method: 'post',
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                $('div.blog-avatar').addClass('hidden');
                $('img#blog_avatar').attr('src', data.data);
                $('input#src_avatar').val(data.data);
                $('div.img-avatar').removeClass('hidden');
            }
            else {
                snackbar(2, 'Có lỗi xảy ra!');
            }
        });
        input.value = '';
    }
    else {
        snackbar(2, 'Ảnh không tồn tại! Vui lòng chọn lại!');
    }
}

function uploadImgProduct(input, image, product_id) {
    if (image != undefined) {
        var valid = check_image(image);
        if (!valid) {
            snackbar(2, get_check_message());
            input.value = '';
            return;
        }
        var formData = new FormData();
        formData.append('file', image);
        $.ajax({
            url: '/backend/api_client/uploadSlideProduct?id='+product_id,
            method: 'post',
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi xảy ra!');
        }).done(function (data, status) {
            if (data.status){
                $('div.img-slide-product').html(data.content);
            }
            else {
                snackbar(2, 'Có lỗi xảy ra!');
            }
        });
        input.value = '';
    }
    else {
        snackbar(2, 'Ảnh không tồn tại! Vui lòng chọn lại!');
    }
}

function uploadFavicon(input, image) {
    if (image != undefined) {
        var valid = check_image(image);
        if (!valid) {
            snackbar(2, get_check_message());
            input.value = '';
            return;
        }
        var formData = new FormData();
        formData.append('file', image);
        $.ajax({
            url: '/backend/api_client/uploadImage',
            method: 'post',
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
        }).fail(function (ui, status) {
            snackbar(2, 'Có lỗi xảy ra!');
        }).done(function (data, status) {
            if (data.status) {
                $('div.blog-favicon').addClass('hidden');
                $('img#favicon_img').attr('src', data.data);
                $('input#src_favicon').val(data.data);
                $('div.img-favicon').removeClass('hidden');
            }
            else {
                snackbar(2, 'Có lỗi xảy ra!');
            }
        });
        input.value = '';
    }
    else {
        snackbar(2, 'Ảnh không tồn tại! Vui lòng chọn lại!');
    }
}

function removeImgProduct(index) {
    $.ajax({
        url: '/backend/api_client/removeImgProduct',
        method: 'post',
        dataType: 'json',
        data: {index: index}
    }).fail(function (ui, status) {
        snackbar(2, 'Có lỗi xảy ra!');
    }).done(function (data, status) {
        if (data.status){
            $('div.img-slide-product').html(data.content);
        }
        else {
            snackbar(2, 'Có lỗi xảy ra!');
        }
    });
}

var fileType = ['image/png', 'image/jpeg'];
var message;
var ImageSize = 5242880;
function check_image(image) {
    if (!image) {
        console.error("Bạn vui lòng chọn ảnh.");
        return false;
    }
    if (fileType.indexOf(image.type) == -1) {
        message = "File không đúng định dạng. Vui lòng chọn lại!";
        return false;
    }
    if (image.size > ImageSize) {
        message = ("Hình ảnh của bạn phải nhỏ hơn 5MB, Vui lòng thay đổi kích thước hình ảnh của bạn!");
        return false;
    }
    return true;
}
function get_check_message() {
    return this.message;
}
function removeImage() {
    $('input#src_avatar').value = '';
    $('div.img-avatar').addClass('hidden');
    $('div.blog-avatar').removeClass('hidden');
}

function removeFavicon() {
    $('input#src_favicon').value = '';
    $('div.img-favicon').addClass('hidden');
    $('div.blog-favicon').removeClass('hidden');
}

/* KẾT THÚC UPLOAD ẢNH */
// type = 1 là success
// type = 2 là error
function snackbar(type, message) {
    if (!$("#snackbar").length) {
        $("body").append('<div id="snackbar"></div>');
    }
    if (type == '2') {
        $("#snackbar").addClass('error');
    } else {
        $("#snackbar").removeClass('error');
    }
    $("#snackbar").html(message);
    $("#snackbar").removeClass('show');
    $("#snackbar").addClass('show');
    // After 3 seconds, remove the show class from DIV
    setTimeout(function () {
        $("#snackbar").removeClass('show');
    }, 3000);
}
