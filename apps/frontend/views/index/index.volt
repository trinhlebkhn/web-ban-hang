{% include "layouts/header.volt" %}
<!-- End menu -->

{# Banner Popup quảng cáo #}
<div id="content" role="main">
    <article>
        {% include "layouts/component/slider.volt" %}
        {% include "layouts/widget/widget-list-cat-product-home.volt" %}
        {#{% include "layouts/widget/widget-banner-advance.volt" %}#}
        {% include "layouts/component/slide-brand.volt" %}
    </article>
</div>
{% include "layouts/footer.volt" %}

