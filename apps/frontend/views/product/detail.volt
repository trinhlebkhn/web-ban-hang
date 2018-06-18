{% include "layouts/header.volt" %}
<div id="content" role="main">
    <article>
        <section class="section section-commerce">
            <div class="container element-top-50 element-bottom-50">
                <div class="row">
                    {{ partial('layouts/breadcrumb', ['DataItem': product]) }}
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
                                            {{ product.content }}
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
<script>
    $(document).ready(function () {
        shopping.renderAttribute($(".ct-detail-pr").find('.productJson'));
    })
</script>
{% include "layouts/footer.volt" %}
<script>
    function share_fb(url) {
        window.open('https://www.facebook.com/sharer/sharer.php?u=' + url, 'facebook-share-dialog', "width=626, height=436")
    }

    function gPlus(url) {
        window.open(
            'https://plus.google.com/share?url=' + url,
            'popupwindow',
            'scrollbars=yes,width=800,height=400'
        ).focus();
        return false;
    }
</script>