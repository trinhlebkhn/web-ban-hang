<div class="related products">
    <h2>Sản phẩm liên quan</h2>
    <div class="row">
        <ul class="products list-container">
            {% set arrayListRelatedProducts = array_chunk(relatedProducts, 4) %}
            {% for product in arrayListRelatedProducts[0] %}
                {{ partial('layouts/template-part/product-item', ['product': product]) }}
            {% endfor %}
        </ul>
    </div>
</div>
