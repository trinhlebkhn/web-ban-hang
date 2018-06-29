<div class="sidebar-widget widget_shopping_cart">
    <h3 class="sidebar-header">Giỏ hàng</h3>
    <div class="widget_shopping_cart_content">
        <div class="mini-cart-overview dropdown navbar-right">
            <a data-toggle="dropdown" href="/shopping/cart">
                <i class="icon icon-bag animated pulse-two"></i>
                <span class="mini-cart-count total-item-cart">{{ cart.getTotalProduct() }}</span>
                <span class="amount total_price total">{{ number_format(cart.getTotalPrice()) }} ₫</span>
            </a>
            <div class="product__shopcart">
                <ul class="dropdown-menu product_list_widget product__list">
                    {% for item in cart.getContent() %}
                        <li>
                            <div class="product-mini tr">
                                <input type="hidden" class="rowId" value="{{ item['id'] }}">
                                <div class="product-image">
                                    <a href="shop-simple-product.html"> <img alt="{{ item['name'] }}" height="114" src="{{ item['avatar'] }}" width="90"> </a>
                                </div>
                                <div class="product-details">
                                    <h4 class="product-details-heading">
                                        <a href="{{ uiHelper.makeLinkProduct(item) }}">
                                            {{ item['name'] }}
                                            {% for  value in item['attribute'] %}
                                                - {{ value['attribute_name'] }}
                                            {% endfor %}
                                        </a>
                                    </h4>
                                    <p></p>
                                    <p><span class="quantity">{{ item['quantity'] }} × <span class="amount product__price__regular">{{ number_format(item['price_sell']) }}</span></span></p>
                                    <div class="btn-delete">
                                        <a class="remove product__delete pointer" title="Xóa sản phẩm" onclick="deleteProduct({{ item['id'] }})">×</a></div>
                                    </div>
                            </div>
                        </li>
                    {% endfor %}
                    <li>
                        <p class="total"><strong>Tổng tiền:</strong> <span class="amount">{{ number_format(cart.getTotalPrice()) }} đ</span></p>
                        <div class="buttons">
                            <a href="/shopping/cart">Xem giỏ hàng</a>
                            {% if auth %}
                                <a href="/shopping/order_info">Thanh toán</a>
                            {% else %}
                                <a href="/auth/pay">Thanh toán</a>
                            {% endif %}
                        </div>
                    </li>
                </ul>
            </div>

            <!-- end product list -->
        </div>
    </div>
</div>