{% include "layouts/header.volt" %}
<div class="nav-anchor"></div>
<div class="breadcrumb">
    <div class="container">
        <a href="index/index" class="li">Trang chủ </a>
        <span class="li active">Giới thiệu</span>
    </div>
</div>
<!--/-->
<div class="sec sec__contact">
    <div class="container">
        <div class="contact-list__head">
            <h2 class="title__main"><span>Giới thiệu</span></h2>
        </div>
        <div class="about-list-wrap">
            {% for item in websiteConfig.location %}
                <div class="about-wrap__title">{{ item.name }}</div>
                <div class="infor-about">
                    <div class="contact">

                        <p class="info ">
                            <span class="icon -ap icon-old-phone"></span>
                            <span class="txt">
                                <span class="name-header texU disb fow"> Phone: </span>
                                <span class="disb">{{ item.phone }}</span>
                            </span>
                        </p>
                    </div>
                    <div class="contact">
                        <p class="info ">
                            <span class="icon -ap icon-location3"></span>
                            <span class="txt">
                                <span class="name-header texU disb fow">Địa chỉ: </span>
                                <span class="disb">{{ item.address }}</span>
                            </span>
                        </p>
                    </div>
                    <div class="contact">
                        <p class="info ">
                            <span class="icon -ap  icon-envelope2"></span>
                            <span class="txt">
                                <span class="name-header texU disb fow">Email:</span>
                                <span class="disb">{{ item.email }}</span>
                            </span>
                        </p>
                    </div>
                    <div class="contact">

                        <p class="info ">
                            <span class="icon -ap icon-access_time"></span>
                            <span class="txt">
                                <span class="name-header texU disb fow"> Thời gian hoạt động: </span>
                                <span class="disb">{{ item.openhours }}</span>
                            </span>
                        </p>
                    </div>
                </div>
            {% endfor %}
            <div class="content-wrap">
                <div class="slider-main hidden-xs">
                    <div class="slider-wrapper theme-default">
                        <div>
                            <img src="{{ websiteConfig.slideshow.images[0].image }}">
                        </div>
                    </div>
                </div>
                <p class="">{{ websiteConfig.content_wrap }}</p>
            </div>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}