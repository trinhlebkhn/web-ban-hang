<div class="all-home">
    <div class="container home-all">
        <div class="hoem row col-md-12">
            <div class="col-md-3 hidden-sm hidden-xs">
                <a href="/san-pham-hot.html">
                    <img src="{{ resourcePath }}uploads/fce138_03.jpg" alt="">
                </a>
            </div>
            <div class="col-md-9 discount-product row">
                {% set hotProduct = uihelper.getProductList(10, 'hot') %}
                {% set arrHotProduct = uihelper.setBigSmallProduct(hotProduct) %}
                {% for index, listItem in arrHotProduct %}
                    {% if index < 2 %}
                        <div class="col-md-6 col-sm-12 discount-flex row">
                            <div class="col-md-6 col-sm-6 sub">
                                <div class="main-block">
                                    <div class="product-info">
                                        <h3 class="product__names"><a href="{{ uihelper.makeLink_Product(listItem['bigProduct']) }}">{{ listItem['bigProduct'].name }}</a></h3>
                                        {% if (listItem['bigProduct'].price > listItem['bigProduct'].price_sell) %}
                                            <div class="product__price">
                                                <p class="product__price__regular">{{ number_format(listItem['bigProduct'].price_sell) }}<span class="unit">đ</span>
                                                </p>
                                                <p class="product__price__old">{{ number_format(listItem['bigProduct'].price) }} <span class="unit">đ</span>
                                                </p>
                                            </div>
                                            <div class="product__status -news hidden">- {{ number_format(100*(1 - listItem['bigProduct'].price_sell/listItem['bigProduct'].price)) }}%</div>
                                        {% else %}
                                            <div class="product__price none_price__old">
                                                <p class="product__price__regular">{{ number_format(listItem['bigProduct'].price_sell) }}<span class="unit">đ</span>
                                                </p>
                                            </div>
                                        {% endif %}
                                    </div>
                                    <div class="product-imgs">
                                        <a href="{{ uihelper.makeLink_Product(listItem['bigProduct']) }}"><img src="{{ listItem['bigProduct'].avatar }}" alt="{{ listItem['bigProduct'].name }}"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 sub2">
                                {% for item in listItem['listSmallProduct'] %}
                                    {% if(item.price_sell > 0) %}
                                        <div class="sub-block col-xs-12 col-md-12 col-sm-12">
                                            <div class="product-img">
                                                <a href="{{ uihelper.makeLink_Product(item) }}"><img src="{{ item.avatar }}" alt="{{ item.name }}"></a>
                                            </div>
                                            <div class="product-info">
                                                <h3 class="product__names"><a href="{{ uihelper.makeLink_Product(item) }}">{{ item.name }} </a></h3>
                                                {% if (item.price > item.price_sell) %}
                                                    <div class="product__price">
                                                        <p class="product__price__regular">{{ number_format(item.price_sell) }} <span class="unit">đ</span>
                                                        </p>
                                                        <p class="product__price__old">{{ number_format(item.price) }} <span class="unit">đ</span>
                                                        </p>
                                                    </div>
                                                    <div class="product__status -news hidden">-{{ number_format(100*(1 - item.price_sell/item.price)) }}%</div>
                                                {% else %}
                                                    <div class="product__price none_price__old">
                                                        <p class="product__price__regular">{{ number_format(item.price_sell) }} <span class="unit">đ</span>
                                                        </p>
                                                    </div>
                                                {% endif %}
                                            </div>
                                        </div>
                                    {% endif %}
                                {% endfor %}
                            </div>
                        </div>
                    {% endif %}
                {% endfor %}
            </div>
        </div>
    </div>
</div>