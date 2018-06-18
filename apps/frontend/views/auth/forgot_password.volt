{% include "layouts/header.volt" %}
<div class="sec sec__contact">
    <div class="container">
        <div class="row">
            {{ this.flash.output() }}
            <div class="form-contact col-md-12 col-sm-6 col-xs-12">

                <label>Nhập vào email của bạn</label>
                <br>
                <form id="forgotpass" method="post">
                    <input type="hidden" name="{{ csrf.getTokenName() }}" value="{{ csrf.getToken() }}" />
                    <div class="form-group">
                        <div class="label">Email</div>
                        <input type="email" name="email" class="form-control" placeholder="VD: abc@gmail.com" >
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-submit" >Gửi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}