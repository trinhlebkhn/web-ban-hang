<div class="nav-anchor"></div>
{#Main Banner#}
<div class="banner-main hidden-xs">
    <div class="container">
        <!--<div class="col-left"></div>-->
        <div class="row ">
            <div class="col-md-12 wrap-home">
                <div class="col-md-3"></div>
                <div class="col-md-9 slider-wrap">
                    <div class="row col-md-12 slider-home">
                        <div class="col-md-9 slider-abs">
                            <div class="col-right home-slider col-md-12">
                                <div class="slider-wrapper theme-default">
                                    <div class="slider apollo_slides nivoSlider" data-config="{{ websiteConfig.slideshow.config|json_encode|escape_attr }}">
                                        {% for item in websiteConfig.slideshow.images %}
                                            <a href="{{ item.link }}"><img src="{{ item.image }}" alt="{{ item.name ? item.name : header.title }}" /></a>
                                        {% endfor %}
                                    </div>
                                </div>
                                <!---->
                            </div>
                            <div class="col-md-12">

                                <div class="slider-btmain">
                                    <div class="slider-product-hot">
                                        {% for index, item in websiteConfig.item_support %}
                                            {% if (index < 4) %}
                                                <div class="item col-md-4 d-flex">
                                                    <div class="img-btmain">
                                                        <i class="fa {{ item.icon }}" aria-hidden="true"></i>
                                                    </div>
                                                    <div class="des-btmain">
                                                        <div class="product-name1">{{ item.name }}</div>
                                                        <div class="product-name2">{{ item.caption }}</div>
                                                    </div>
                                                </div>
                                            {% endif %}
                                        {% endfor %}
                                    </div>
                                </div>

                                <!---->
                            </div>
                        </div>
                        <div class="col-md-3 slide-baner">
                            {% for item in websiteConfig.slide_inside_right_slide.images %}
                                <div class="cat-baner">
                                    <a href="{{ item.link }}">
                                        <img src="{{ item.image }}" alt="banner">
                                    </a>
                                </div>
                            {% endfor %}
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>