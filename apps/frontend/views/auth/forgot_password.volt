{% include "layouts/header.volt" %}
<div class="sec sec__contact">
    <div class="container">
        <div class="row">
            <div class="form-contact col-md-12 col-sm-6 col-xs-12">
                <label>Nhập vào email của bạn</label>
                <br>
                {{ this.flash.output() }}
                {% if success == 0 %}
                    <form id="forgotpass" method="post">
                        <div class="form-group">
                            <div class="label">Email</div>
                            <input type="email" name="email" class="form-control" placeholder="VD: abc@gmail.com">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-submit">Gửi</button>
                        </div>
                    </form>
                {% endif %}
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#forgotpass').bootstrapValidator({
            message: 'Vui lòng nhập giá trị',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                email: {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập email!'
                        },
                        emailAddress: {
                            message: 'Email không đúng định dạng!'
                        }
                    }
                }
            }
        });
    });
</script>
{% include "layouts/footer.volt" %}