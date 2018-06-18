{% include "layouts/header.volt" %}
<section class="section">
    <div class="background-overlay" style="background-color: rgba(240,240,240,1);"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-left element-top-30 element-bottom-30 normal regular"> Thanh toán </h1>
            </div>
        </div>
    </div>
</section>
<div class="sec sec__shopcart sec__shopcart__info">
    <div class="container">
        <div class="row">
            <form id="payment" class="payment" action="" method="post">
                {% if !auth %}
                    <div class="col-sm-12">
                        <p class="error" style="padding-left: 25px;">
                            <i class="fa fa-caret-right"></i>Bạn đã có tài khoản?
                            <a class="event_login" href="#"> Đăng Nhập </a>để Đặt Hàng.
                        </p>
                        <br>
                    </div>
                {% endif %}
                {% if (validate|length) %}
                    <div class="col-sm-12" style="color: red;">
                        <div class="" style="padding-left: 25px;">
                            {% for item in validate %}
                                <p>{{ item }}</p>
                            {% endfor %}
                        </div>
                    </div>
                {% endif %}
                <div class="sec__shopcart__info col-md-7 col-sm-7 col-xs-12">
                    <div class="box-user__info panel">
                        <div class="title customer_info_title">Thông tin thanh toán và nhận hàng</div>
                        <div class="content">
                            <div class="row">
                                <div class="col-md-6 col-xs-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="label">Số điện thoại: <span style="color: red; font-size: 16px">*</span></div>
                                        <input type="text" value="{{ auth ? auth.phone : '' }}" name="info_payment[phone]" id="phone" class="form-control required" placeholder="Nhập số điện thoại.">
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12 col-sm-6">
                                    <div class="form-group">
                                        <div class="label">Họ tên: <span style="color: red; font-size: 16px">*</span></div>
                                        <input type="text" value="{{ auth ? auth.name : '' }}" name="info_payment[fullname]" id="name" class="form-control" placeholder="Tên" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="label">Email <span style="color: red; font-size: 16px">*</span></div>
                                <input type="email" {{ auth.email ? 'disabled': '' }} value="{{ auth ? auth.email : '' }}" name="info_payment[email]" class="form-control" placeholder="Email" required>
                            </div>
                            {% if auth is empty %}
                                <div class="form-group">
                                    <div class="label">Mật khẩu <span style="color: red; font-size: 16px">*</span></div>
                                    <input type="password" name="info_payment[password]" id="password" class="form-control" placeholder="********" required>
                                </div>
                                <div class="form-group">
                                    <div class="label">Nhập lại mật khẩu <span style="color: red; font-size: 16px">*</span></div>
                                    <input type="password" name="info_payment[password_again]" class="form-control" placeholder="********" required>
                                </div>
                            {% endif %}
                            <div class="form-group">
                                <div class="label">Địa chỉ: <span style="color: red; font-size: 16px">*</span></div>
                                <input type="text" name="info_payment[address]" class="form-control" id="address" placeholder="Địa chỉ" required>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <div class="label">Tỉnh thành: <span style="color: red; font-size: 16px">*</span></div>
                                        <select name="info_payment[province_id]" id="province_id" class="selectpicker form-control" data-live-search="true" required>
                                            <option value="">--Chọn tỉnh thành--</option>
                                            {% for item in provinces %}
                                                <option value="{{ item.id }}">{{ item.name }}</option>
                                            {% endfor %}
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <div class="label">Quận huyện: <span style="color: red; font-size: 16px">*</span></div>
                                        <select name="info_payment[district_id]" id="district_id" class="selectpicker form-control" data-live-search="true" required>
                                            <option value="">--Chọn quận huyện--</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <div class="label">Phường xã: <span style="color: red; font-size: 16px">*</span></div>
                                        <select name="info_payment[ward_id]" id="ward_id" class="selectpicker form-control" data-live-search="true" required>
                                            <option value="">--Chọn Phường/Xã--</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            {% if list_store_config|length > 0 %}
                                <div class="row">
                                    <div class="col-md-6 col-xs-12 col-sm-6">
                                        <div class="form-group">
                                            <div class="label">Chọn hình thức vận chuyển: <span style="color: red; font-size: 16px">*</span></div>
                                            <select name="info_payment[service_value]" id="service_value" class="selectpicker form-control" data-live-search="true" required>
                                                {% for item in service_transport %}
                                                    <option value="{{ item['value'] }}" {{ item['value'] == 'VTK' ? 'selected' : '' }}>{{ item['title'] }}</option>
                                                {% endfor %}
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 col-sm-6">
                                        <div class="form-group">
                                            <div class="label">Chọn kho: <span style="color: red; font-size: 16px">*</span></div>
                                            <select name="info_payment[service_value]" id="storehouse" class="selectpicker form-control" data-live-search="true" required>
                                                {% for item in list_store_config %}
                                                    <option value="{{ item|json_encode|escape_attr }}">{{ item.store_name }}</option>
                                                {% endfor %}
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            {% endif %}
                            <div class="form-group">
                                <div class="label">Ghi chú: <span style="color: red; font-size: 16px">*</span></div>
                                <textarea name="info_payment[caption]" id="" cols="30" rows="10" class="form-control" id="desc" placeholder="Nội dung"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5 col-sm-5 col-xs-12">
                    <div class="title">Giỏ hàng</div>
                    <div class="content list_product_content">
                        <div class="product__shopcart">
                            <div class="product__list">
                                {% for item in cart.getContent() %}
                                    <div class="tr item product__list__item">
                                        <input type="hidden" class="rowId" value="{{ item['rowId'] }}">
                                        <div class="product__img">
                                            <img src="{{ item['avatar'] }}" alt="{{ item['name'] }}">
                                        </div>
                                        <div class="product__name">
                                            <a href="#">{{ item['name'] }}</a>
                                            {% for value in item['attribute'] %}
                                                - {{ value['attribute_name'] }}
                                            {% endfor %}
                                            <a href="#" class="product__delete btn-delete">
                                                <span class="icon -ap icon-trash2"></span>
                                            </a>
                                        </div>

                                        <div class="product__price">
                                            <div class="product__price__regular" price="{{ item['price'] }}">{{ cart.formatNumber(item['price']) }} <span class="unit">đ</span></div>
                                            <div class="quantity">
                                                <input type="button" value="-" class="minus btn-minus btn">
                                                <input class="input-text qty input-number text" min="1" name="qty" step="1" title="Qty" type="number" value="{{ item['quantity'] }}">
                                                <input type="button" value="+" class="plus btn-plus btn">
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                {% endfor %}
                            </div>
                        </div>
                    </div>

                    <div class="col-price-total">
                        <div class="">
                            <div class="price-provi">
                                <div class="pull-left">Tạm tính :</div>
                                <div class="pull-right total">{{ cart.getTotal() }}₫</div>
                            </div>
                            {% if list_store_config|length > 0 %}
                                <div class="price-provi">
                                    <div class="pull-left">Phí vận chuyển :</div>
                                    <div class="pull-right "><span class="total-fee-transport">0 đ</span></div>
                                    <input type="text" value="" name="info_payment[ship_price]" class="form-control hidden" id="ship_price" placeholder="">
                                </div>
                            {% endif %}
                            <div class="price-total">
                                <div class="pull-left">Thành tiền :</div>
                                <div class="pull-right total_price" price="{{ cart.getTotal() }}">{{ cart.getTotal() }}₫</div>
                                <input type="text" value="{{ total_price }}" name="info_payment[total_price]" class="form-control hidden" id="total_price" placeholder="">
                            </div>
                        </div>
                    </div>
                    <div class="list-button">
                        <div class="row">
                            <div class="col-sm-12 col-xs-12">
                                <button type="submit" class="btn btn__next">Tiếp tục thanh toán</button>
                            </div>
                            <div class="return">
                                <a href="/shopping/cart"><i class="fa fa-reply" aria-hidden="true"></i> Quay lại</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}