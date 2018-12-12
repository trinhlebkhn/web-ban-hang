{% include "layouts/header.volt" %}
<div id="content" role="main">
    <article>
        <section class="section section-commerce">
            <div class="container element-top-50 element-bottom-50">
                <div class="row">
                    {{ partial('layouts/breadcrumb', ['catInfo': product]) }}
                    <div class="product">
                        {{ partial('product/product_detail', ['product': product]) }}
                        <div class="row single-product-extras">
                            <div class="col-md-12">
                                <div class="tabbable top">
                                    <ul class="nav nav-tabs" data-tabs="tabs">
                                        <li class="active"><a data-toggle="tab" href="#tab-description">Thông tin sản phẩm</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab-description">
                                            {{ product['content'] }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {% include "layouts/widget/widget-product-related.volt" %}
                    </div>
                </div>
            </div>
        </section>
    </article>
</div>
{% include "layouts/footer.volt" %}
