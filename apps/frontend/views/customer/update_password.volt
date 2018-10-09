{% include "layouts/header.volt" %}
<div class="user-profile__wrap sec">
    <section class="section">
        <div class="background-overlay" style="background-color: rgba(240,240,240,1);"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-left element-top-30 element-bottom-30 normal regular"> Thay đổi mật khẩu </h1>
                </div>
            </div>
        </div>
    </section>
    <div class="container">
        <div class="row user_info">
            <div class="col-md-3 col-sm-3 col-xs-12">
                {% include "customer/sidebar-customer.volt" %}
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="wrap__profile__info">
                    <h2 class="title-profile">Thay đổi mật khẩu</h2>
                    <form method="post" id="change_pass" class="profile-content">
                        {#<input type="hidden" name="{{ csrf.getTokenName() }}" value="{{ csrf.getToken() }}" />#}
                        <div id="change_password_account">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-12">{{ this.flash.output() }}</div>
                                    <div class="input__label">
                                        <div class="label">Mật khẩu cũ</div>
                                    </div>
                                    <div class="input__wrap">
                                        <input name="password[current_password]" type="password" class="form-control" placeholder="Mật khẩu cũ" value="{{ current_password? current_password : "" }}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="input__label">
                                        <div class="label">Mật khẩu mới</div>
                                    </div>
                                    <div class="input__wrap">
                                        <input name="password[password]" type="password" id="new_password" class="form-control" placeholder="Mật khẩu mới" value="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="input__label">
                                        <div class="label">Nhập lại mật khẩu</div>
                                    </div>
                                    <div class="input__wrap">
                                        <input name="password[password_again]" type="password" class="form-control" placeholder="Mật khẩu mới" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group login__action">
                            <button id="update" type="submit" class="btn btn-submit">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

{% include "layouts/footer.volt" %}

<script>
//    function checkCheckbook(obj) {
//        $("#change_password_account").toggle();
//    }

    $(document).ready(function () {
        $("#change_pass").validate({
            rules : {
                'password[current_password]' : {
                    required : true
                },
                'password[password]' : {
                    required : true
                },
                'password[password_again]' : {
                    equalTo: '#new_password',
                    required : true
                }
            },

            messages: {
                'password[current_password]' : {
                    required : "Bạn chưa nhập mật khẩu hiện tại."
                },
                'password[password]' : {
                    required : "Vui lòng nhập mật khẩu mới."
                },
                'password[current_password]' : {
                    equalTo : "Mật khẩu nhập lại chưa khớp.",
                    required : "Vui lòng nhập lại mật khẩu mới."
                }
            }
        });
    });
</script>