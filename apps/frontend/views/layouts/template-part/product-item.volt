{% set link = uiHelper.makeLinkProduct(product) %}
{% set images = product['image']|json_decode %}
<li class="product col-md-3 col-sm-3 product__price__view productJson" data-product="{{ product|json_encode|escape_attr }}">
    <div class="w">
        <a class="link-product" href="{{ link }}">
            {% if (product['price'] > product['price_sell']) %}
                <span class="onsale">Sale!</span>
            {% endif %}
            <div class="product-image">
                <div class="product-image-front">
                    <img alt="{{ product['name']}}" height="893" src="{{ product['avatar']}}" width="700">
                </div>
                {% if images[0] is not empty %}
                    <div class="product-image-back"><img alt="{{ product['name']}}" src="{{ images[0] }}"></div>
                {% endif %}
                <div class="product-image-overlay">
                    <a href="{{ link }}"><h4>Xem chi tiết</h4></a>
                </div>
            </div>
        </a>
        <div class="product-info">
            <h3 class="product-title"><a href="{{ link }}">{{ product['name']}}</a></h3> <span class="product-categories"></span>
            <h3 class="price">
                {% set price_sell = product['price_sell']%}
                {% set price = product['price']%}
                <del class="{{ price == 0 or price <= price_sell   ? 'hidden' : '' }}">
                    <span class="amount">{{ number_format(price) }} <u>đ</u></span>
                </del>
                &nbsp;&nbsp;<ins><b class="amount">{{ number_format(price_sell) }} <u>đ</u></b></ins>
            </h3>
            <input type="text" class="input-number" style="display: none" value="1">
            <a class="add-to-cart-button product__view__button__cart" href="#" rel="nofollow" title="Thêm vào giỏ hàng"> <i class="icon-bag"></i> </a>
        </div>
    </div>
</li>