{% include "layouts/header.volt" %}
<div class="sec sec__contact">
    <div class="container">
        <div class="row">

            <div class="col-sm-3"></div>
            <div class="form-contact col-md-7 col-sm-6 col-xs-12">
                <form id="reset_password" method="post" class="reset_pass">
                    {{ this.flash.output() }}
                    {% if success == 1 %}
                        {#<input type="hidden" name="{{ csrf.getTokenName() }}" value="{{ csrf.getToken() }}" />#}
                        <div class="form-group">
                            <div class="label">Mật khẩu mới</div>
                            <input type="password" name="data[password]" id="password" class="form-control"
                                   placeholder="Nhập mật khẩu" required>
                        </div>
                        <div class="form-group">
                            <div class="label">Xác nhận mật khẩu</div>
                            <input type="password" name="data[re_password]" class="form-control"
                                   placeholder="Xác nhận mật khẩu" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-submit">Gửi</button>
                        </div>
                    {% endif %}
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#reset_password').bootstrapValidator({
            message: 'Vui lòng nhập giá trị',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'data[password]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập mật khẩu!'
                        },
                        identical: {
                            field: 'data[re_password]',
                            message: 'Mật khẩu và mật khẩu xác nhận không trùng khớp!'
                        }
                    }
                },
                'data[re_password]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui lòng nhập lại mật khẩu!'
                        },
                        identical: {
                            field: 'data[password]',
                            message: 'Mật khẩu và mật khẩu xác nhận không trùng khớp!'
                        }
                    }
                }
            }
        });
    });
</script>
{% include "layouts/footer.volt" %}