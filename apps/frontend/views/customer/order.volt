{% include "layouts/header.volt" %}
<div class="user-profile__wrap sec">
    <section class="section">
        <div class="background-overlay" style="background-color: rgba(240,240,240,1);"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-left element-top-30 element-bottom-30 normal regular"> Đơn hàng </h1>
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
                    <h2 class="title-profile">Quản lý đơn hàng</h2>
                    <div class="profile-order">
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <th class="xdot">Mã đơn hàng</th>
                                    <th>Ngày tạo đơn</th>
                                    <th class="xdot"> Tổng tiền</th>
                                    <th>Trạng thái</th>
                                </tr>

                                {% for order in listBills %}
                                    <tr>
                                        <td>
                                            <div class="xdot code"><a href="/chi-tiet-don-hang/a185{{ order['id'] }}.html"
                                                                      style="color: #00acea">{{ order['order_number_vtp'] }}</a>
                                            </div>
                                        </td>
                                        <td>{{ order['date_create'] }}</td>
                                        <td>
                                            <div class="product__price xdot">{{ number_format(order['total_price']) }}
                                                <span class="unit">đ</span></div>
                                        </td>
                                        <td>
                                            <div class="status status-new text-center"
                                                 style="background: {{ background_status[order['status'] + 1]['background'] }}">
                                                <span class="status-order">{{ background_status[order['status'] + 1]['name'] }}</span>
                                            </div>
                                        </td>
                                    </tr>
                                {% endfor %}
                            </table>
                        </div>
                    </div>
                </div>
                <footer class="bottom_box on_the_sides">
                    <div class="right_side">
                        <ul class="pags">
                            {% include "layouts/pagination.volt" %}
                        </ul>
                    </div>
                </footer>
            </div>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}