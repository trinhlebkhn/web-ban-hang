$(document).ready(function () {
    $("#form-register").on('submit', function (e) {
        var check = $("input#agree_idea")[0].checked;
        if (check == false) {
            $(".register.check__action").addClass('error');
            e.preventDefault();
        }
        if ($("#form-register input#repassword").hasClass('error') == true) {
            e.preventDefault();
        }
    });

    $("#form-register input#repassword").on('keyup', function () {
        var password = $("#form-register input#pageRegister_password").val();
        var repassword = $(this).val();
        if(password != repassword){
            $(this).addClass('error');
        } else {
            $(this).removeClass('error');
        }
    });

})

function check_idea_register() {
    var check = $("input#agree_idea")[0].checked;
    if (check) {
        $(".register.check__action").removeClass('error');
    } else {
        $(".register.check__action").addClass('error');
    }
}

$("#payment_online").on("click", function () {
    var show_payment = $(".choose_payment").hasClass("display-none");
    if (show_payment) {
        $(".arraw").addClass('tickArrow');
        $(".choose_payment").removeClass('display-none');
    }
    else {
        $(".arraw").removeClass('tickArrow');
        $(".choose_payment").addClass('display-none');
    }
});

$('form').submit(function () {
    $('[disabled]').removeAttr('disabled');
});