{% include "layouts/header.volt" %}
<div class="sec sec__contact">
    <div class="container">
        <div class="row">
            {{ this.flash.output() }}

            <div class="col-sm-3"></div>
            <div class="form-contact col-md-7 col-sm-6 col-xs-12 {{ changePassSuccess==1?'hidden':'' }}">
                <form id="reset_password" method="post" class="reset_pass">
                    <input type="hidden" name="{{ csrf.getTokenName() }}" value="{{ csrf.getToken() }}" />
                    <div class="form-group">
                        <div class="label">Nhập email</div>
                        <input id="email" type="text" name="email" class="form-control" placeholder="Nhập email" required>
                    </div>
                    <div class="form-group">
                        <div class="label">Mã khôi phục mật khẩu</div>
                        <input id="code" type="text" name="code" class="form-control" placeholder="Nhập mã" required>
                    </div>
                    <div class="form-group">
                        <div class="label">Mật khẩu mới</div>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Nhập mật khẩu" required>
                    </div>
                    <div class="form-group">
                        <div class="label">Xác nhận mật khẩu</div>
                        <input type="password" name="repassword" class="form-control" placeholder="Xác nhận mật khẩu" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-submit">Gửi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}
<script>
    $(document).ready(function () {
        $("#reset_password").validate({
            rules: {
                email: {
                    required: true,
                    regex: /^([a-zA-Z0-9_.\-+])+\@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/,
                },
                code: {
                    required: true,
                },
                password: {
                    required: true,
                },
                repassword: {
                    required: true,
                    equalTo: "#password"
                }
            },
            messages: {
                email: {
                    required: "Bạn vui lòng nhập email.",
                    regex: "Email chưa đúng định dạng."
                },
                code: {
                    required: "Bạn vui lòng nhập mã khôi phục mật khẩu."
                },
                password: {
                    required: "Bạn vui lòng nhập mật khẩu.",
                },
                repassword: {
                    required: "Bạn vui lòng nhập mật khẩu.",
                    equalTo: "Hai mật khẩu không giống nhau."
                }
            }
        });
    });
</script>