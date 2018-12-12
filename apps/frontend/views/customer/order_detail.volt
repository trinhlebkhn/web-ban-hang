{% include "layouts/header.volt" %}
<div class="user-profile__wrap sec">
    <section class="section">
        <div class="background-overlay" style="background-color: rgba(240,240,240,1);"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-left element-top-30 element-bottom-30 normal regular"> Chi tiết đơn hàng </h1>
                </div>
            </div>
        </div>
    </section>
    <div class="container">
        <div class="row user_info">
            <div class="col-md-3 col-sm-3 col-xs-12">
                {% include "customer/sidebar-customer.volt" %}
            </div>
            <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="wrap__profile__info">
                    <h2 class="title-profile">Đơn hàng: {{ detailOrder.code }}</h2>
                    <div class="profile-order">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th class="xdot">Tên sản phẩm</th>
                                    <th class="xdot">Giá bán</th>
                                    <th>Số lượng</th>
                                    <th class="xdot">Thành tiền</th>
                                </tr>
                                {% for item in data['list_product'] %}
                                    <tr>
                                        <td>
                                            <div class="xdot code">{{ item['product_name'] }}</div>
                                        </td>
                                        <td>{{ item['price'] }}</td>
                                        <td>{{ item['quantity']}}</td>
                                        <td>
                                            <div class="product__price xdot">{{ number_format(item['subtotal']) }} <span class="unit">đ</span></div>
                                        </td>
                                    </tr>
                                {% endfor %}
                                <tr>
                                    <td><b>Tổng</b></td>
                                    <td></td>
                                    <td>{{ count }}</td>
                                    <td ><b>{{ number_format(data['price']) }} VNĐ</b></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}