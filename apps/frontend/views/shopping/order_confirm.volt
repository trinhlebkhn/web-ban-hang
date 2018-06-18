{% include "layouts/header.volt" %}
<div class="sec sec__shopcart">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="alert alert-success" style="text-align: center;">
                    <span class="-ap icon-info-with-circle"></span>
                    Bạn đã mua hàng thành công
                    <a href="/" class="alert-link">Quay lại trang chủ để tiếp tục mua hàng</a>
                </div>
            </div>
            <div class="sec__shopcart__info col-md-7 col-sm-7 col-xs-12">
                <div class="box-user__info panel">
                    <div class="title">Thông tin cá nhân</div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-6 col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="label">Họ tên</div>
                                    <div class="name">{{ order['customer']['fullname'] }}</div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="label">Số điện thoại</div>
                                    <div class="name">{{ order['customer']['phone'] }}</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="label">Email</div>
                            <div class="name">{{ order['customer']['email'] }}</div>
                        </div>
                        <div class="form-group">
                            <div class="label">Địa chỉ</div>
                            <div class="name">{{ order['customer']['address'] }}</div>
                            <div class="name">
                                {% if order['customer']['province_id'] %}
                                    {{ provinces[order['customer']['province_id']].name }}
                                {% endif %}
                                {% if order['customer']['district_id'] %}
                                    - {{ districts[order['customer']['district_id']].name }}
                                {% endif %}
                                {% if order['customer']['ward_id'] %}
                                    - {{ wards[order['customer']['ward_id']].name}}
                                {% endif %}</div>
                        </div>
                        <div class="form-group">
                            <div class="label">Ghi chú</div>
                            <div class="name">{{ order['customer']['caption'] }}</div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-12">
                <div class="title">Giỏ hàng</div>
                <div class="content">
                    <div class="product__shopcart">
                        <div class="product__list">
                            {% for item in order_cart.getContent() %}
                                <div class="product__list__item">
                                    <div class="product__img">
                                        <img src="{{ tag.image_url(item['avatar']) }}" alt="Name your Product ">
                                    </div>
                                    <div class="product__name">
                                        {{ item['name'] }}
                                        {% for value in item['attribute'] %}
                                            - {{ value['attribute_name'] }}
                                        {% endfor %}

                                    </div>
                                    <div class="">
                                        Số lượng : {{ item['quantity'] }}
                                    </div>
                                    <div class="product__price">
                                        <div class="product__price__regular">{{ number_format(item['price']) }} <span class="unit">đ</span></div>
                                        {#<div class="product__price__old">17.790.000 <span class="unit">đ</span></div>#}
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
                <div class="price-provi">
                    <div class="pull-left">Phí vận chuyển :</div>
                    <div class="pull-right "><span class="total-fee-transport">{{ number_format(order['order']['ship_price']) }}</span> đ</div>
                </div>
                <div class="col-price-total">
                    <div class="">
                        <div class="price-total">
                            <div class="pull-left">Thành tiền :</div>
                            <div class="pull-right">{{ number_format(total_price) }} ₫</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
{% include "layouts/footer.volt" %}