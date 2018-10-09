{% include "layouts/header.volt" %}
<div id="content" role="main">
    <article>
        {{ partial('layouts/widget/widget-top-page-cat-product', ['catInfo': catInfo]) }}
        <section class="section">
            <div class="container element-top-50 element-bottom-50">
                <div class="row">
                    <div class="col-md-4">
                        {{ partial('layouts/breadcrumb', ['catInfo': catInfo]) }}
                    </div>
                    <div class="col-md-5 text-right">
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
                    <div class="col-md-3">
                        <div class="sidebar-widget">
                            <form role="search" method="get" id="searchform">
                                <div class="input-group">
                                    <input type="text" value="" name="s" class="form-control" placeholder="Tìm kiếm">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="submit" id="searchsubmit" value="">
                                            <i class="fa fa-search"></i>
                                        </button>
                                        <input type="hidden" name="post_type" value="product">
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
