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
