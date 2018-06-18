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
                                {% if orderList is empty %}
                                    <tr>
                                        <td class="text-center" colspan="4">Bạn chưa có đơn hàng!</td>
                                    </tr>
                                {% else %}
                                    {% for order in orderList %}
                                        <tr>
                                            <td>
                                                <div class="xdot code"><a href="{{ uihelper.makeLink_OrderDetail(order) }}" style="color: #00acea">{{ order.code }}</a></div>
                                            </td>
                                            <td>{{ order.datecreate }}</td>
                                            <td>
                                                <div class="product__price xdot">{{ cart.formatNumber(order.total) }} <span class="unit">đ</span></div>
                                            </td>
                                            <td>
                                                <div class="status status-new text-center" style="background: {{ background_status[order.status] }}">{{ order.status_name }}</div>
                                            </td>
                                        </tr>
                                    {% endfor %}
                                {% endif %}
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}