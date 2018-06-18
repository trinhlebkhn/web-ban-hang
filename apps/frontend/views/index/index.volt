{% include "layouts/header.volt" %}
<!-- End menu -->

{# Banner Popup quảng cáo #}
<script>
    $(document).ready(function () {
        //        $("#popup").click();
    });
</script>
<div id="content" role="main">
    <article>
        {#{% include "layouts/component/banner-advertisement.volt" %}#}
        {% include "layouts/widget/widget-list-cat-product-home.volt" %}
        {#{% include "layouts/component/slide-brand.volt" %}#}
    </article>
</div>
{#{% include "layouts/footer.volt" %}#}

