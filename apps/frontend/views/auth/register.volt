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
                            <div class="col-md-12 col-xs-12 col-sm-12 account__input">
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
                                        <div class="input__wrap form-group">
                                            <input name="pageRegister[email]" autofocus value="{{ data['email'] }}" type="email" class="form-control" placeholder="Email...">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Mật khẩu:</div>
                                        </div>
                                        <div class="input__wrap form-group">
                                            <input type="password" id="pageRegister_password" name="pageRegister[password]" class="form-control" placeholder="Mật khẩu từ 6 đến 32 ký tự">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Nhập lại mật khẩu:</div>
                                        </div>
                                        <div class="input__wrap form-group">
                                            <input type="password" id="repassword" name="pageRegister[password_again]" class="form-control" maxlength="32" placeholder="*******">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Họ tên:</div>
                                        </div>
                                        <div class="input__wrap form-group">
                                            <input name="pageRegister[fullname]" type="text" value="{{ data['fullname'] }}" class="form-control" placeholder="Nhập họ tên">
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
                                                        <input type="radio" checked="checked" value="1" class="checkbox" name="pageRegister[gender]">
                                                        <span class="icon"></span>
                                                        Nam
                                                    </div>
                                                </div>
                                                <div class="col-xs-4">
                                                    <div class="check__action -radio">
                                                        <input type="radio" class="checkbox" value="2" name="pageRegister[gender]">
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
                                        <div class="input__wrap form-group">
                                            <input name="pageRegister[phone]" type="text" value="{{ data['phone'] }}" class="form-control" placeholder="Nhập số điện thoại" maxlength="11">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group register_birthday">
                                    <div class="row">
                                        <div class="input__label">
                                            <div class="label">Ngày Sinh:</div>
                                        </div>
                                        <div class="input__wrap">
                                            <select class="birth-day form-control pointer" name="pageRegister_birth[day]">
                                                <option value="">Ngày</option>
                                                {% for i in 1..31 %}
                                                    <option value="{{ i }}">{{ i }}</option>
                                                {% endfor %}
                                            </select>
                                            <select class="birth-month form-control pointer" name="pageRegister_birth[month]">
                                                <option value="">Tháng</option>
                                                {% for i in 1..12 %}
                                                    <option value="{{ i }}">{{ i }}</option>
                                                {% endfor %}
                                            </select>
                                            <select class="birth-year form-control pointer" name="pageRegister_birth[year]">
                                                <option value="">Năm</option>
                                                {% set yearCurrent = date('Y') %}
                                                {% set maxYear = yearCurrent - 14 %}
                                                {% for i in maxYear..1900 %}
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
                                                <input name="pageRegister_has" id="agree_idea" class="input-checkbox checkbox pageRegister_has" type="checkbox"> Tôi đồng ý mọi điều khoản của Website
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group login__action">
                                    <button type="submit" id="pageRegister_btn" class="btn btn-submit" style="width: 220px; margin: auto;">
                                        Đăng Ký
                                    </button>
                                </div>
                                <div class="login__note text-center">
                                    Bạn đã có tài khoản? <a href="/dang-nhap.html">Đăng nhập</a>
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
        $('#form-register').bootstrapValidator({
            message: 'Vui lòng nhập giá trị',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'pageRegister[email]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập email!'
                        },
                        emailAddress: {
                            message: 'Email không đúng định dạng!'
                        }
                    }
                },
                'pageRegister[password]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập mật khẩu!'
                        },
                        identical: {
                            field: 'pageRegister[password_again]',
                            message: 'Mật khẩu và mật khẩu xác nhận không trùng khớp!'
                        }
                    }
                },
                'pageRegister[password_again]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập lại mật khẩu!'
                        },
                        identical: {
                            field: 'pageRegister[password]',
                            message: 'Mật khẩu và mật khẩu xác nhận không trùng khớp!'
                        }
                    }
                },
                'pageRegister[fullname]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập họ tên!'
                        }
                    }
                },
                'pageRegister[phone]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập số điện thoại!'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'Số điện thoại phải là số!'
                        }
                    }
                },
                pageRegister_has: {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng xác nhận điêu khoản!'
                        }
                    }
                }
            }
        });
    });
</script>
{% include "layouts/footer.volt" %}