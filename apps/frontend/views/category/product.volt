{% include "layouts/header.volt" %}
<div id="content" role="main">
    {% set cat_config = CatInfo.config|json_decode %}
    <article>
        {% if cat_config.avatar is not empty %}
            <section class="section">
                <a class="figure-image" href="#" target="_self"> <img alt="{{ CatInfo.name }}" src="{{ cat_config.avatar }}"> </a>
            </section>
        {% endif %}
        <section class="section">
            <div class="container element-top-50 element-bottom-50">
                <div class="row">
                    <ul class="products list-container">
                        {% for product in ListProductOfCat %}
                            {{ partial('layouts/template-part/product-item', ['product': product]) }}
                        {% endfor %}
                    </ul>
                    <div class="clear-fix"></div>
                    {% include 'layouts/paging.volt' %}
                </div>
            </div>
        </section>
        {% if cat_config.cover_photo is not empty %}
            <section class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="figure element-top-20 element-bottom-60 os-animation animated fadeIn" data-os-animation="fadeIn" data-os-animation-delay="0s" style="animation-delay: 0s;">
                                <a class="figure-image" href="#" target="_self"> <img alt="{{ CatInfo.name }}" src="{{ cat_config.cover_photo }}"> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        {% endif %}
    </article>
</div>
{% include "layouts/footer.volt" %}
