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
                            <div class="account_login__social col-md-12 col-xs-12 col-sm-12 account__input">
                                <div class="title"><span>Tài khoản của bạn</span></div>
                                <div>
                                    {{ this.flash.output() }}
                                </div>
                                {#<div class="form-group form-icon-group">#}
                                {#<i class="fa fa-user"></i> <input class="form-control" id="name" name="name" placeholder="Your name *" type="text" required="">#}
                                {#</div>#}
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-user"></i>
                                    <input class="form-control" id="name" name="data[email]" placeholder="Email *" type="text" maxlength="40" value="{{ data['email'] }}">
                                </div>
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-key"></i>
                                    <input class="form-control" name="data[password]" placeholder="Mật khẩu *" type="password"  maxlength="32">
                                </div>
                                {% if loginAttempts > 2 %}
                                    <div id="myCaptcha" class="g-recaptcha" data-sitekey="{{ google_captcha.site_key }}"></div>
                                {% endif %}
                                <div class="form-group login__action">
                                    <button type="submit" class="btn btn-submit">Đăng nhập</button>
                                </div>
                                <div class="forgot_password">
                                    <a href="/quen-mat-khau.html"><span class="text1976D2" style="color: #1976D2;">Quên mật khẩu?</span></a>
                                </div>
                                <div class="login__note">
                                    Bạn chưa có tài khoản? <a href="/dang-ki.html">Đăng ký ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#form-login').bootstrapValidator({
            message: 'Vui lòng nhập giá trị',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'data[email]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập email!'
                        },
                        emailAddress: {
                            message: 'Email không đúng định dạng!'
                        }
                    }
                },
                'data[password]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập mật khẩu!'
                        }
                    }
                }
            }
        });
    });
</script>
{% include "layouts/footer.volt" %}
