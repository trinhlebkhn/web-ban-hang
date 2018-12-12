<div class="ct-detail-pr">
    <div class="row product-summary">
        {% set images = product['image']|json_decode %}
        {% set price_sell = product['price_sell'] %}
        {% set price = product['price'] %}
        <div class="product__view__image col-md-6 col-sm-6 col-xs-12">
            <div class="product-images">
                {% if price > price_sell %}
                    <span class="onsale">Sale!</span>
                {% endif %}
                <div class="flexslider" data-flex-animation="slide" data-flex-controls="thumbnails"
                     data-flex-controlsalign="left" data-flex-controlsposition="outside" data-flex-directions="hide"
                     data-flex-directions-type="simple"
                     data-flex-duration="600" data-flex-slideshow="true" data-flex-speed="7000" id="product-images">
                    <ul class="slides product-gallery product__view__image--list">
                        <li data-thumb="{{ product['avatar'] }}">
                            <figure><img alt="Top Fancy" src="{{ product['avatar'] }}">
                                <figcaption>
                                    <h4><a href="{{ product['avatar'] }}">Zoom</a></h4>
                                </figcaption>
                            </figure>
                        </li>
                        {% for item in images %}
                            <li data-thumb="{{ item }}">
                                <figure><img alt="Top Fancy" src="{{ item }}">
                                    <figcaption>
                                        <h4><a href="{{ item }}">Zoom</a></h4>
                                    </figcaption>
                                </figure>
                            </li>
                        {% endfor %}
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6  col-xs-12 product__view__content detail_product_view productJson"
             data-product="{{ product|json_encode|escape_attr }}">
            <div class="summary entry-summary">
                <h1 class="product-title bordered">{{ product['name'] }}</h1>
                <div>
                    <p class="price price-big">
                        <del>
                            <span class="amount product__price__old {{ price == 0 or price <= price_sell   ? 'hidden' : '' }}">{{ number_format(price) }} </span>đ
                        </del>
                        <ins><span class="amount price_sell">{{ number_format(price_sell) }} </span>đ</ins>
                    </p>
                </div>
                <div class="description">
                    <p>{{ product['descript'] }}</p>
                </div>
                <form class="tr product__quantity product__view__quantity">
                    <div class="quantity">
                        <input type="button" value="-" class="minus btn-minus btn">
                        <input class="input-text qty input-number text" min="1" name="quantity" step="1" title="Qty"
                               type="number" value="1">
                        <input type="button" value="+" class="plus btn-plus btn">
                    </div>
                    <input name="add-to-cart" type="hidden" value="60">
                    <div class="manipulation-product">
                        <button type="button" class="single_add_to_cart_button button alt product__view__button__cart">Thêm vào giỏ hàng
                        </button>
                        {% if auth %}
                            <a href="/dat-hang.html" class="product__view__button__cart_order order_add"
                               style="min-width: 200px;">
                                <button type="button" class="single_add_to_cart_button button alt">Mua ngay</button>
                            </a>
                        {% else %}
                            <a href="/thanh-toan.html" class="product__view__button__cart_order  order_add"
                               style="min-width: 200px;">
                                <button type="button" class="single_add_to_cart_button button alt">Mua ngay</button>
                            </a>
                        {% endif %}
                    </div>
                </form>

                <div class="product_meta">
                    {% for attr in product['attribute'] %}
                        <span class="posted_in">
                            {{ attr.name }}: <a href="shop-mens-category.html" rel="tag">{{ attr.value }}</a>,
                        </span>
                    {% endfor %}
                </div>
                <div>
                    <ul class="social-icons social-sm social-background social-rect">
                        <li>
                            <a href="#"> <i class="fa fa-twitter"></i> </a>
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-google-plus"></i> </a>
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-facebook"></i> </a>
                        </li>
                        <li>
                            <a href="#"> <i class="fa fa-pinterest"></i> </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>