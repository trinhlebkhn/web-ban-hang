{% for item in cart.getContent() %}
    <li>
        <div class="product-mini tr">
            <input type="hidden" class="rowId" value="{{ item['rowId'] }}">
            <div class="product-image">
                <a href="shop-simple-product.html"> <img alt="{{ item['name'] }}" height="114" src="{{ item['avatar'] }}" width="90"> </a>
            </div>
            <div class="product-details">
                <h4 class="product-details-heading">
                    <a href="{{ uihelper.makeLink_Product(item) }}">
                        {{ item['name'] }}
                        {% for  value in item['attribute'] %}
                            - {{ value['attribute_name'] }}
                        {% endfor %}
                    </a>
                </h4>
                <p></p>
                <p><span class="quantity">{{ item['quantity'] }} × <span class="amount product__price__regular">{{ cart.formatNumber(item['price_sell']) }}</span></span>
                </p><a class="remove product__delete" title="Remove this item">×</a></div>
        </div>
    </li>
{% endfor %}
<li>
    <p class="total"><strong>Tổng tiền:</strong> <span class="amount">{{ cart.getTotal() }} đ</span></p>
    <div class="buttons">
        <a href="/shopping/cart">Xem giỏ hàng</a>
        {% if auth %}
            <a href="/shopping/order_info">Thanh toán</a>
        {% else %}
            <a href="/auth/pay">Thanh toán</a>
        {% endif %}
    </div>
</li>