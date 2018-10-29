{% include "layouts/header.volt" %}
 {% if (cart.getContent()) %}
    <!-- End menu -->
<div class="sec sec__shopcart">
    <section class="section">
        <div class="background-overlay" style="background-color: rgba(240,240,240,1);"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-left element-top-30 element-bottom-30 normal regular"> Giỏ hàng </h1>
                </div>
            </div>
        </div>
    </section>
    <div class="container">
        <div class="nav-steps">
            <article>
                <section class="section section-commerce">
                    <div class="container">
                        <div class="row element-top-50 element-bottom-50">
                            <div class="col-md-12">
                                <form action="#" method="post">
                                    <div class="table-responsive">
                                        <table cellspacing="0" class="shop_table cart table element-bottom-20">
                                            <thead>
                                            <tr>
                                                <th class="product-remove">&nbsp;</th>
                                                <th class="product-thumbnail">&nbsp;</th>
                                                <th class="product-name">Sản phẩm</th>
                                                <th class="product-price">Giá</th>
                                                <th class="product-quantity">Số lượng</th>
                                                <th class="product-subtotal">Thành tiền</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            {% for item in cart.getContent() %}
                                                <tr class="cart_item tr">
                                                    <input type="hidden" class="rowId" value="{{ item['id'] }}">
                                                    <td class="product-remove">
                                                        <a href="#" class="remove product__delete btn-delete" title="Remove this item">×</a>
                                                    </td>
                                                    <td class="product-thumbnail">
                                                        <a href="shop-simple-product.html"> <img
                                                                    alt="{{ item['name'] }}" height="114"
                                                                    src="{{ item['avatar'] }}"
                                                                    width="90"> </a>
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="shop-simple-product.html">
                                                            {{ item['name'] }}
                                                            {% for  value in item['attribute'] %}
                                                                - {{ value['attribute_name'] }}
                                                            {% endfor %}
                                                        </a>
                                                    </td>
                                                    <td class="product-price"><span
                                                                class="amount product__price__regular"
                                                                price="{{ item['price_sell'] }}">{{ number_format(item['price_sell']) }}
                                                            đ</span></td>
                                                    <td class="product-quantity">
                                                        <div class="quantity">
                                                            <input type="button" value="-" class="minus btn-minus btn update-cart">
                                                            <input class="input-text qty input-number text update-cart" min="1"
                                                                   name="qty" step="1" title="Qty" type="number"
                                                                   value="{{ item['quantity'] }}">
                                                            <input type="button" value="+" class="plus btn-plus btn update-cart">
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal"><span
                                                                class="amount total_price_item">{{ number_format(item['price_sell'] * item['quantity']) }}
                                                            đ</span></td>
                                                </tr>
                                            {% endfor %}
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3 element-bottom-20" style="float: right;">
                                            <div class="row form-group">
                                                <span class="col-md-6">Tổng tiền</span>
                                                <span class="col-md-6 total_price">{{ number_format(cart.getTotalPrice()) }} đ</span>
                                            </div>
                                            <a class="btn btn-success btn-block" href="/dat-hang.html">
                                                Tiến hành thanh toán
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </article>
        </div>
    </div>
    {% else %}
        <div class="header__second">
            <div class="container">
                <div class="logo pull-left">
                    <a class="image">
                        <img src="{{ websiteConfig.logo_file|length ? websiteConfig.logo_file : '/app/img/web_logo.png' }}"
                             alt="logo">
                    </a>
                    <h1 class="name hidden">đặc sản vùng miền</h1>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="sec sec__shopcart">
            <div class="container">
                <div class="nav-steps">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="alert alert-info">
                                <span class="-ap icon-info-with-circle"></span>
                                Chưa có sản phẩm nào trong giỏ hàng.
                                <a href="/" class="alert-link">Quay lại trang chủ để tiếp tục mua hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {% endif %}

{% include "layouts/footer.volt" %}