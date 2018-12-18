
{% for index, item in cat_home_data %}
    <section class="section">
        <div class="container container-vertical-middle">
            <div class="row vertical-middle">
                <div class="col-md-3">
                    <h2 class="text-left element-top-20 element-bottom-20 text-normal os-animation normal default" data-os-animation="fadeIn" data-os-animation-delay="0s">
                        <a class="category_home" href="{{ uiHelper.makeLinkCategory(item) }}">{{ item.name }}</a>
                    </h2>
                </div>
                <div class="col-md-9">
                    <hr class="element-top-0 element-bottom-0 os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                </div>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="divider-wrapper">
                        <div class="visible-xs element-height-30"></div>
                        <div class="visible-sm element-height-30"></div>
                        <div class="visible-md element-height-30"></div>
                        <div class="visible-lg element-height-30"></div>
                    </div>
                    <div class="woocommerce columns-4">
                        {% set arrayListProduct = array_chunk(item.product, 4) %}
                        <div class="row">
                            <ul class="products cat-home-products">
                                {% for product in arrayListProduct[0] %}
                                    {{ partial('layouts/template-part/product-item', ['product': product]) }}
                                {% endfor %}
                            </ul>
                        </div>
                        <div class="row">
                            <ul class="products cat-home-products">
                                {% for product in arrayListProduct[1] %}
                                    {{ partial('layouts/template-part/product-item', ['product': product]) }}
                                {% endfor %}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {% if item.avatar | length > 0 and index < cat_home_data | length - 1 %}
        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="figure element-top-30 element-bottom-30 os-animation img-cat-home" data-os-animation="fadeIn"
                             data-os-animation-delay="0s">
                            <a class="figure-image"
                               href="shop-mens-category.html" target="_self"> <img
                                        alt="womans-full"
                                        src="{{ item.avatar }}"> </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    {% endif %}
{% endfor %}
