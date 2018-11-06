{% include "layouts/header.volt" %}
<!-- End menu -->
{# Banner Popup quảng cáo #}
<div id="content" class="payment-success" role="main">
    <article>
        {% if payment_success %}
            <table width="100%">
                <thead>
                <th colspan="2" class="text-center header-payment-success">
                    <h3>Thanh toán thành công!</h3>
                    <p><i class="fa fa-check-circle" aria-hidden="true"></i></p>
                </th>
                </thead>
                <tbody>
                <tr>
                    <td><label> Họ tên: </label></td>
                    <td>{{ data['cus_name'] }}</td>
                </tr>
                <tr>
                    <td><label> Email: </label></td>
                    <td>{{ data['cus_email'] }}</td>
                </tr>
                <tr>
                    <td><label> Số điện thoại: </label></td>
                    <td>{{ data['cus_phone'] }}</td>
                </tr>
                <tr>
                    <td><label> Tổng tiền thanh toán: </label></td>
                    <td>{{ number_format(data['total']) }} VNĐ</td>
                </tr>
                <tr>
                    <td><label> Thời gian thanh toán: </label></td>
                    <td>{{ data['time'] }}</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="text-center message">
                            Cảm ơn bạn đã tin tưởng sản phẩm của chúng tôi. Chúng tôi sẽ nhanh chóng liên lạc lại với bạn.
                        </p>
                    </td>
                </tr>
                </tbody>
            </table>
        {% else %}
            <p class="text-center message">
                {{ this.flash.output() }}
            </p>
        {% endif %}
    </article>
</div>
{% include "layouts/footer.volt" %}

