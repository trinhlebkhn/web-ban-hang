{% include "layouts/header.volt" %}
<div id="content" role="main">
    <div class="page-login margin100px">
        <form id="form-login" method="post">
            {#<input type="hidden" name="{{ csrf.getTokenName() }}" value="{{ csrf.getToken() }}" />#}
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Đăng nhập</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="account_login__social col-md-6 col-xs-12 col-sm-6 account__input">
                                <div class="title"><span>Tài khoản của bạn</span></div>
                                <div>
                                    {{ this.flash.output() }}
                                </div>
                                {#<div class="form-group form-icon-group">#}
                                {#<i class="fa fa-user"></i> <input class="form-control" id="name" name="name" placeholder="Your name *" type="text" required="">#}
                                {#</div>#}
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-user"></i>
                                    <input class="form-control" id="name" name="data[email]" placeholder="Email *" type="text" required="" maxlength="40" value="{{ data['email'] }}">
                                </div>
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-key"></i>
                                    <input class="form-control" name="data[password]" placeholder="Mật khẩu từ 6 đến 32 ký tự *" type="password" required="" maxlength="32">
                                </div>
                                {% if loginAttempts > 2 %}
                                    <div id="myCaptcha" class="g-recaptcha" data-sitekey="{{ google_captcha.site_key }}"></div>
                                {% endif %}
                                <div class="form-group login__action">
                                    <button type="submit" class="btn btn-submit">Đăng nhập</button>
                                </div>
                                <div class="forgot_password">
                                    <a href="/auth/forgot_password"><span class="text1976D2" style="color: #1976D2;">Quên mật khẩu?</span></a>
                                </div>
                                <div class="login__note">
                                    Bạn chưa có tài khoản? <a href="/auth/register">Đăng ký ngay</a>
                                </div>
                            </div>
                            <div class="account_login__social col-md-6 col-xs-12 col-sm-6">
                                <div class="title"><span>Đăng nhập với </span></div>
                                <div class="list__buttons">
                                    {#<a href="{{ facebook_login }}/auth/website_facebook?domain=http://{{ domain }}/auth/facebook" class="btn btn-facebook">
                                        #}{#<a href="{{ facebook_login }}/auth/website_facebook?domain=http://localhost:1030/auth/facebook" class="btn btn-facebook">#}{#
                                        <span class="-ap icon-facebook icon"></span>
                                        Đăng nhập với Facebook
                                    </a>#}
                                    <a href="{{ facebook_login }}/auth/website_google?domain=http://{{ domain }}/auth/google" class="btn btn-google">
                                        {#<a href="{{ facebook_login }}/auth/website_google?domain=http://localhost:1030/auth/google" class="btn btn-google">#}
                                        <span class="-ap icon-google icon"></span>
                                        Đăng nhập với Google
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>
{#{% include "layouts/footer.volt" %}#}
<script>
    $("#form-login").validate({
        rules: {
            'login_username': {
                required: true
            },
            'login_password': {
                required: true
            }
        },
        messages: {
            "login_username": {
                required: "Email hoặc Số điện thoại."
            },
            "login_password": {
                required: "Bạn vui lòng nhập mật khẩu."
            }
        }
    });
</script>