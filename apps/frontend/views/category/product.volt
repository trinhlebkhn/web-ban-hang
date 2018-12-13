{% include "layouts/header.volt" %}
{{ this.flash.output() }}
<section class="section">
    <div class="background-overlay grid-overlay-0 " style="background-color: rgba(240,240,240,1);"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-left element-top-30 element-bottom-30 text-normal normal regular"
                    data-os-animation="none" data-os-animation-delay="0s"> {{ catInfo['name'] }} </h1>
            </div>
        </div>
    </div>
</section>
<div id="content" role="main">
    <article>
        <section class="section">
            <div class="container element-top-50 element-bottom-50">
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-8 col-sm-6 text-right">
                        <p class="woocommerce-result-count"> Có tất cả {{ Paginginfo['total_items'] }} kêt quả </p>
                        <form class="woocommerce-ordering" method="post">
                            <select name="order_by" class="orderby" onchange="this.form.submit()">
                                <option value="" selected='selected'>Mặc định</option>
                                <option value="ASC" {{ orderBy == 'ASC' ? 'selected' : ''}} >Giá tăng dần</option>
                                <option value="DESC" {{ orderBy == 'DESC' ? 'selected' : ''}}>Giá giảm dần</option>
                            </select>
                            <input type="text" name="strSearch" class="form-control hidden" placeholder="Tìm kiếm" value="{{ strSearch is not empty ? strSearch : '' }}">
                        </form>
                    </div>
                    <ul class="products list-container">
                        {% for product in listData %}
                            {{ partial('layouts/template-part/product-item', ['product': product]) }}
                        {% endfor %}
                    </ul>
                    <div class="clear-fix"></div>
                    {% include 'layouts/pagination.volt' %}
                </div>
            </div>
        </section>
    </article>
</div>
{% include "layouts/footer.volt" %}
