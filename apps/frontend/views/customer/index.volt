{% include "layouts/header.volt" %}
<section class="section">
    <div class="background-overlay" style="background-color: rgba(240,240,240,1);"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-left element-top-30 element-bottom-30 normal regular"> Tài khoản </h1>
            </div>
        </div>
    </div>
</section>
<div class="user-profile__wrap sec">
    <div class="container">
        <div class="row user_info">
            <div class="col-md-3 col-sm-3 col-xs-12">
                {% include "customer/sidebar-customer.volt" %}
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="wrap__profile__info">

                    <h2 class="title-profile">Thông tin tài khoản</h2>
                    <form method="post" id="customer_info" class="profile-content">
                        {#<input type="hidden" name="{{ csrf.getTokenName() }}" value="{{ csrf.getToken() }}" />#}
                        <input type="hidden" class="form-control" name="data[id]" placeholder="Họ Tên"
                               value="{{ data['id']? data['id'] : auth['id'] }}">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-12">{{ this.flash.output() }}</div>
                                <div class="col-sm-12 error">
                                    {% for item in validate %}
                                        <p>{{ item }}</p>
                                    {% endfor %}
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">

                                <div class="input__label">
                                    <div class="label">Họ Tên</div>
                                </div>
                                <div class="input__wrap">

                                    <input type="text" class="form-control" name="data[fullname]" placeholder="Họ Tên"
                                           value="{{ data['fullname']? data['fullname'] : auth['fullname'] }}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="input__label">
                                    <div class="label">Email</div>
                                </div>
                                <div class="input__wrap">
                                    <input type="text" class="form-control" name="data[email]" placeholder="Email..."
                                           value="{{ data['email']? data['email'] : auth['email'] }}">
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
                                                <input type="radio" {{ auth['gender'] == 1 ? 'checked="checked"':'' }}
                                                       class="checkbox" name="data[gender]" value="1">
                                                <span class="icon"></span>
                                                Nam
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="check__action -radio">
                                                <input type="radio" {{ auth['gender'] == 2 ? 'checked="checked"':'' }}
                                                       class="checkbox" name="data[gender]" value="2">
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
                                    <div class="label">Ngày Sinh:</div>
                                </div>

                                <div class="input__wrap birthday-picker">
                                    <select class="birth-day form-control" name="dob[day]">
                                        {% for i in 1..31 %}
                                            <option {{ date == i ? 'selected':'' }}
                                                    value="{{ i }}">{{ i }}</option>
                                        {% endfor %}
                                    </select>
                                    <select class="birth-month form-control" name="dob[month]">
                                        {% for i in 1..12 %}
                                            <option {{ month == i ? 'selected':'' }}
                                                    value="{{ i }}">{{ i }}</option>
                                        {% endfor %}
                                    </select>
                                    <select class="birth-year form-control" name="dob[year]">
                                        {% set yearCurrent = date('Y') %}
                                        {% set maxYear = yearCurrent - 14 %}
                                        {% for i in maxYear..1990 %}
                                            <option {{ year == i ? 'selected':'' }}
                                                    value="{{ i }}">{{ i }}</option>
                                        {% endfor %}
                                    </select>
                                    <div style="display: none" id="update_notification_date" class="help-block">Ngày sinh không hợp lệ</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="input__label">
                                    <div class="label">Số điện thoại</div>
                                </div>
                                <div class="input__wrap">
                                    <input type="text" name="data[phone]" class="form-control" placeholder="Số điện thoại..."
                                           value="{{ data['phone']? data['phone'] : auth['phone'] }}" >
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

{#{% include "layouts/footer.volt" %}#}

<script>
    function checkCheckbook(obj) {
        $("#change_password_account").toggle();
    }

    $(document).ready(function () {
        $("#customer_info").validate({
            rules : {
                'fullname' : {
                    required : true
                },
                'phone' : {
                    required : true,
                    digits: !0,
                    maxlength: 13,
                    minlength: 8,
                },
                'email':{
                    required:true,
                    regex: /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$/
                }
            },
            messages : {
                'fullname' : {
                    required : "Bạn vui lòng nhập họ tên."
                },
                'phone' : {
                    required : "Bạn vui lòng nhập số điện thoại.",
                    digits: "Số điện thoại phải là số.",
                    minlength: "Số điện thoại tối thiểu phải có 8 số.",
                    maxlength: "Số điện thoại chỉ được 8 đến 14 số."
                },
                'email':{
                    required:"Bạn vui lòng nhập email.",
                    email: "Email chưa đúng định dạng."
                }
            }
        })
    });
</script>