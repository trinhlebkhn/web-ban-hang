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
                    <div class="col-md-5 col-sm-6 text-right">
                        <p class="woocommerce-result-count"> Có tất cả {{ Paginginfo['total_items'] }} kêt quả </p>
                        <form class="woocommerce-ordering" method="get"><select name="orderby" class="orderby">
                                <option value="menu_order" selected='selected'>Mặc định</option>
                                {#<option value="popularity">Sort by popularity</option>#}
                                {#<option value="rating">Sort by average rating</option>#}
                                {#<option value="date">Sort by newness</option>#}
                                <option value="price">Giá tăng dần</option>
                                <option value="price-desc">Giá giảm dần</option>
                            </select>
                        </form>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="sidebar-widget">
                            <form role="search" method="post" id="searchform">
                                <div class="input-group">
                                    <input type="text" name="query" class="form-control" placeholder="Tìm kiếm" value="{{ query }}">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit" id="searchsubmit" >
                                            <i class="fa fa-search"></i>
                                        </button>
                                        {#<input type="hidden" name="query" value="">#}
                                    </span>
                                </div>
                            </form>
                        </div>
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
