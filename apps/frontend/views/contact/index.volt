
{% include "layouts/header.volt" %}
<article>
    <section class="section">
        <div class="container-fullwidth">
            <div class="row">
                <div class="col-md-12">
                    <div class="google-map" data-os-animation="none" data-os-animation-delay="0s" id="map" style="height:400px">
                        {{ websiteConfig.google_maps }}
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
                    <h2 class="text-left element-top-0 element-bottom-0 os-animation normal" data-os-animation="fadeIn" data-os-animation-delay="0s">Liên hệ với chúng tôi</h2>
                </div>
                <div class="col-md-8">
                    <hr class="element-top-0 element-bottom-0 os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s"> </div>
            </div>
        </div>
    </section>
    <section class="section text-normal section-text-no-shadow section-inner-no-shadow section-normal section-opaque">
        <div class="background-overlay grid-overlay-0" style="background-color: rgba(255,255,255,0);"></div>
        <div class="container container-vertical-default">
            <div class="row vertical-default">
                <div class="col-md-12 text-default small-screen-default">
                    <div class="row">
                        <div class="col-md-4 text-left small-screen-left os-animation" data-os-animation="fadeIn" data-os-animation-delay="0.3s">
                            <div class="divider-wrapper">
                                <div class="visible-xs element-height-20"></div>
                                <div class="visible-sm element-height-20"></div>
                                <div class="visible-md element-height-20"></div>
                                <div class="visible-lg element-height-20"></div>
                            </div>
                            <ul class="fa-ul text-normal element-top-0 element-bottom-0" data-os-animation="none" data-os-animation-delay="0s">
                                <li><i class="fa-li fa fa-home"></i> {{ websiteConfig.address }}</li>
                                <li><i class="fa-li fa fa-phone"></i> {{ websiteConfig.phone }}</li>
                                <li><i class="fa-li fa fa-envelope"></i> {{ websiteConfig.email }}</li>
                            </ul>
                            <div class="divider-wrapper">
                                <div class="visible-xs element-height-60"></div>
                                <div class="visible-sm element-height-60"></div>
                                <div class="visible-md element-height-60"></div>
                                <div class="visible-lg element-height-60"></div>
                            </div>
                        </div>
                        <div class="col-md-8 text-left small-screen-center os-animation" data-os-animation="fadeIn" data-os-animation-delay="0.3s">
                            <div class="divider-wrapper">
                                <div class="visible-xs element-height-20"></div>
                                <div class="visible-sm element-height-20"></div>
                                <div class="visible-md element-height-20"></div>
                                <div class="visible-lg element-height-20"></div>
                            </div>
                            <div id="message-error_contact"></div>
                            <form id="contact_customer" class="contact-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group form-icon-group">
                                            <i class="fa fa-user"></i> <input class="form-control" id="fullname_contact"  name="name" placeholder="Họ và tên *" type="text" required="">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-icon-group">
                                            <i class="fa fa-phone"></i> <input class="form-control" id="phone_contact" name="email" placeholder="Số điện thoại *" type="text" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-envelope"></i> <input class="form-control" id="email_contact" name="email" placeholder="Email *" type="email" maxlength="40" required="">
                                </div>
                                <div class="form-group form-icon-group">
                                    <i class="fa fa-pencil"></i>
                                    <textarea class="form-control" id="content_contact" name="message" placeholder="Nội dung" rows="10" required=""></textarea>
                                </div>
                                <p> <input value="Gửi" class="btn btn-primary" onclick="custom_registercontact.registercontact()"> </p>
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
{% include "layouts/footer.volt" %}