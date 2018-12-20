{% include "layouts/header.volt" %}
<article>
    <section class="section">
        <div class="container-fullwidth">
            <div class="row">
                <div class="col-md-12">
                    <div class="google-map" data-os-animation="none" data-os-animation-delay="0s" id="map"
                         style="height:400px">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5266.457533109792!2d105.79150118380572!3d21.034773174716452!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab479490d4e9%3A0x9de683e942611881!2zMjkyIMSQxrDhu51uZyBD4bqndSBHaeG6pXksIFF1YW4gSG9hLCBD4bqndSBHaeG6pXksIEjDoCBO4buZaSwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1545323624347"
                                width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                    <div class="divider-wrapper">
                        <div class="visible-xs element-height-50"></div>
                        <div class="visible-sm element-height-50"></div>
                        <div class="visible-md element-height-50"></div>
                        <div class="visible-lg element-height-50"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container container-vertical-middle">
            <div class="row vertical-middle">
                <div class="col-md-4">
                    <h2 class="text-left element-top-0 element-bottom-0 os-animation normal" data-os-animation="fadeIn"
                        data-os-animation-delay="0s">Liên hệ với chúng tôi</h2>
                </div>
                <div class="col-md-8">
                    <hr class="element-top-0 element-bottom-0 os-animation" data-os-animation="fadeIn"
                        data-os-animation-delay="0s">
                </div>
            </div>
        </div>
    </section>
    <section class="section text-normal section-text-no-shadow section-inner-no-shadow section-normal section-opaque">
        <div class="background-overlay grid-overlay-0" style="background-color: rgba(255,255,255,0);"></div>
        <div class="container container-vertical-default">
            <div class="row vertical-default">
                <div class="col-md-12 text-default small-screen-default">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 text-left small-screen-left os-animation" data-os-animation="fadeIn"
                             data-os-animation-delay="0.3s">
                            <div class="divider-wrapper">
                                <div class="visible-xs element-height-20"></div>
                                <div class="visible-sm element-height-20"></div>
                                <div class="visible-md element-height-20"></div>
                                <div class="visible-lg element-height-20"></div>
                            </div>
                            <div class="col-text-1 text-normal  element-top-0 element-bottom-0" data-os-animation="none"
                                 data-os-animation-delay="0s">
                                <p>
                                    Bạn có thể tìm mua hàng ngay tại website hoặc cũng có thể đến mua hang trực tiếp tại
                                    cửa hàng của chúng tôi để nhận được sự chăm sóc và các chính sách ưu đãi tốt nhất
                                    dành cho bạn.
                                </p>
                            </div>
                            <ul class="fa-ul text-normal element-top-0 element-bottom-0 info-contact"
                                data-os-animation="none"
                                data-os-animation-delay="0s">
                                <li><i class="fa fa-home"></i>
                                    100 Thái Hà, Trung Liệt, Đống Đa, Hà Nội
                                </li>
                                <li><i class="fa fa-phone"></i> 035.9113.351</li>
                                <li><i class="fa fa-envelope"></i> donghoonline@gmai.com</li>
                            </ul>
                            <div class="divider-wrapper">
                                <div class="visible-xs element-height-60"></div>
                                <div class="visible-sm element-height-60"></div>
                                <div class="visible-md element-height-60"></div>
                                <div class="visible-lg element-height-60"></div>
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-8 text-left small-screen-center os-animation" data-os-animation="fadeIn"
                             data-os-animation-delay="0.3s">
                            {{ this.flash.output() }}
                            <div class="divider-wrapper">
                                <div class="visible-xs element-height-20"></div>
                                <div class="visible-sm element-height-20"></div>
                                <div class="visible-md element-height-20"></div>
                                <div class="visible-lg element-height-20"></div>
                            </div>
                            <div id="message-error_contact"></div>
                            <form id="contact_customer" class="contact-form" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-icon-group">
                                            <i class="fa fa-user"></i>
                                            <input class="form-control" id="fullname_contact"
                                                   name="data[name]" placeholder="Họ và tên *"
                                                   type="text">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-icon-group">
                                            <i class="fa fa-phone"></i>
                                            <input class="form-control" id="phone_contact"
                                                   name="data[phone]" placeholder="Số điện thoại *" type="text"
                                                   maxlength="10"
                                            >
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-envelope"></i>
                                    <input class="form-control" id="email_contact"
                                           name="data[email]" placeholder="Email *"
                                           type="email" maxlength="40">
                                </div>
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-pencil"></i>
                                    <textarea class="form-control" id="content_contact" name="data[message]"
                                              placeholder="Nội dung" rows="10"></textarea>
                                </div>
                                <p style="text-align: left">
                                    <button class="btn btn-primary" type="submit">Gửi</button>
                                </p>
                                <div class="messages text-center"></div>
                            </form>
                            <div class="divider-wrapper">
                                <div class="visible-xs element-height-60"></div>
                                <div class="visible-sm element-height-60"></div>
                                <div class="visible-md element-height-60"></div>
                                <div class="visible-lg element-height-60"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {% include "layouts/component/slide-brand.volt" %}
</article>
<script type="text/javascript">
    $(document).ready(function () {
        $('#contact_customer').bootstrapValidator({
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
                'data[name]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập họ tên!'
                        }
                    }
                },
                'data[message]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập nội dung!'
                        }
                    }
                },
                'data[phone]': {
                    validators: {
                        notEmpty: {
                            message: 'Vui nhập số điện thoại!'
                        },
                        regexp: {
                            regexp: /^([0-9])/,
                            message: 'Số điện thoại phải là số!'
                        }
                    }
                }
            }
        });
    });
</script>
{% include "layouts/footer.volt" %}
