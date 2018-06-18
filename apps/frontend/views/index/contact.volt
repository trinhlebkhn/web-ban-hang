{% include "layouts/header.volt" %}
<div class="sec sec__contact">
    <div class="container">
        <div class="contact-list__head">
            <h2 class="contact-list__title">
                Liên hệ
            </h2>
        </div>

        <div class="row">
            <div class="list-contact col-md-5 col-sm-6 col-xs-12">
                {% for location in websiteConfig.location %}
                    <div class="item">
                        <div class="title-comp">
                            {{ location.name }}
                        </div>
                        <div class="contact">
                            <p class="info ">
                                <span class="icon -ap icon-old-phone"></span>
                                <span class="name-header">Điện thoại: </span>
                                <span class="disb">{{ location.phone }}</span>
                            </p>
                        </div>
                        <div class="contact">
                            <p class="info ">
                                <span class="icon -ap icon-location3"></span>
                                <span class="name-header texU disb fow">Địa chỉ: </span>
                                <span class="disb">{{ location.address }}</span>
                            </p>
                        </div>
                        <div class="contact">
                            <p class="info ">
                                <span class="icon -ap  icon-envelope2"></span>
                                <span class="name-header texU disb fow">Email:</span>
                                <span class="disb">{{ location.email }}</span>
                            </p>
                        </div>
                        <div class="contact">

                            <p class="info ">
                                <span class="icon -ap icon-access_time"></span>
                                <span class="name-header texU disb fow">Thời gian mở cửa: </span>
                                <span class="disb">{{ location.openhours }}</span>
                            </p>
                        </div>
                    </div>
                {% endfor %}
                <div class="item">
                    <div class="link-map">
                        {{ websiteConfig.google_maps }}
                    </div>
                </div>
            </div>
            <form id="contact" action="" method="post">
                <div class="form-contact col-md-7 col-sm-6 col-xs-12">
                    <div class="form-group">
                        {{ flash.output() }}
                    </div>
                    {% for contact_form in websiteConfig.contact_form %}

                        <div class="form-group">
                            {% if contact_form.type !='submit' and contact_form.type !='reset'  and contact_form.is_show == true %}
                                <div class="label">{{ contact_form.label }}</div>
                                {% if contact_form.type == 'text' or contact_form.type == 'email' or contact_form.type == 'tel' %}
                                    <input name="{{ contact_form.name }}" type="{{ contact_form.type }}" class="form-control" placeholder="{{ contact_form.placeholder }}">
                                {% endif %}
                                {% if contact_form.type == 'text-area' %}
                                    <textarea name="content" id="" cols="30" rows="10" class="form-control" placeholder="Nhập nội dung"></textarea>
                                {% endif %}
                            {% endif %}
                        </div>

                    {% endfor %}

                    <div class="">
                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-success btn-contact">Gửi</button>
                            <button type="reset" class="btn btn-danger">Hủy</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}