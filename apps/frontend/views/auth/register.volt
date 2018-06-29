{% include "layouts/header.volt" %}
<div id="content" role="main">
    <div id="page-register" role="dialog">
        <form id="form-register" method="post">
            {#<input type="hidden" name="{{ csrf.getTokenName() }}" value="{{ csrf.getToken() }}" />#}
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Đăng ký tài khoản</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-7 col-xs-12 col-sm-7 account__input">
                                <div class="form-group">
                                    <div class="row">
                                        {{ this.flash.output() }}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Email:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input name="pageRegister[email]" autofocus value="{{ data['email'] }}" type="email" class="form-control" placeholder="Email..." maxlength="40" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Mật khẩu:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input type="password" id="pageRegister_password" name="pageRegister[password]" class="form-control" placeholder="Mật khẩu từ 6 đến 32 ký tự" maxlength="32" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Nhập lại mật khẩu:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input type="password" id="repassword" name="pageRegister[password_again]" class="form-control" maxlength="32" placeholder="*******" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Họ tên:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input name="pageRegister[fullname]" type="text" value="{{ data['fullname'] }}" class="form-control" placeholder="Nhập họ tên" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Giới tính:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <div class="row">
                                                <div class="col-xs-4">
                                                    <div class="check__action -radio">
                                                        <input type="radio" checked="checked" value="1" class="checkbox" name="pageRegister[gender]" required>
                                                        <span class="icon"></span>
                                                        Nam
                                                    </div>
                                                </div>
                                                <div class="col-xs-4">
                                                    <div class="check__action -radio">
                                                        <input type="radio" class="checkbox" value="2" name="pageRegister[gender]" required>
                                                        <span class="icon"></span>
                                                        Nữ
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Số điện thoại:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <input name="pageRegister[phone]" type="text" value="{{ data['phone'] }}" class="form-control" placeholder="Nhập số điện thoại" maxlength="14" minlength="8" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Ngày Sinh:</div>
                                        </div>
                                        <div class="input__wrap pageBirthday-picker">
                                            <select class="birth-day form-control" name="pageRegister_birth[day]" required>
                                                <option value="">Ngày</option>
                                                {% for i in 1..31 %}
                                                    <option value="{{ i }}">{{ i }}</option>
                                                {% endfor %}
                                            </select>
                                            <select class="birth-month form-control" name="pageRegister_birth[month]" required>
                                                <option value="">Tháng</option>
                                                {% for i in 1..12 %}
                                                    <option value="{{ i }}">{{ i }}</option>
                                                {% endfor %}
                                            </select>
                                            <select class="birth-year form-control" name="pageRegister_birth[year]" required>
                                                <option value="">Năm</option>
                                                {% set yearCurrent = date('Y') %}
                                                {% set maxYear = yearCurrent - 14 %}
                                                {% for i in maxYear..1990 %}
                                                    <option value="{{ i }}">{{ i }}</option>
                                                {% endfor %}
                                            </select>
                                            <div id="register_notification_date" style="display: none" class="displaynone help-block">Ngày sinh không hợp lệ</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="register check__action">
                                        <div class="checkbox">
                                            <label onclick="check_idea_register()">
                                                <input name="pageRegister_has" id="agree_idea" class="input-checkbox checkbox pageRegister_has" type="checkbox" required> Tôi đồng ý mọi điều khoản của Website
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div id="myCaptcha" class="g-recaptcha" data-sitekey="{{ google_captcha.site_key }}"></div>
                                <br>
                                <div class="form-group login__action">
                                    <button type="submit" id="pageRegister_btn" class="btn btn-submit">Đăng Ký</button>
                                </div>
                                <div class="login__note">
                                    Bạn đã có tài khoản? <a href="/auth/login">Đăng nhập</a>
                                </div>
                            </div>
                            <div class="account_login__social col-md-5 col-xs-12 col-sm-5">
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