{% include "layouts/header.volt" %}
<!-- End menu -->
{#<div class="sec list-product">#}
    {#<div class="container">#}
        {#<div class="row">#}
            {#<div class="col-md-3 col-sm-3 col-xs-12 col-left">#}
                {#{% include "layouts/sidebar/sidebar-product.volt" %}#}
            {#</div>#}
            {#<!--/-->#}
            {#<div class="col-md-9 col-sm-9 col-xs-12 col-right">#}
                {#{% if ProductCategoryList|length > 0 %}#}
                    {#{% for ProductCat in ProductCategoryList %}#}
                        {#{% set categoryLink = uihelper.makeLink_Category(ProductCat) %}#}
                        {#<div class="box-ct">#}
                            {#<div class="title-name">#}
                                {#<a href="{{ categoryLink }}">{{ ProductCat.name }}</span></a>#}
                            {#</div>#}
                            {#{% if ProductCat.list_content|length > 0 %}#}
                                {#<div class="list-ct">#}
                                    {#<div class="row">#}
                                        {#{% for product in ProductCat.list_content %}#}
                                            {#{% if(product.price_sell > 0) %}#}
                                                {#<div class="col-md-3 col-sm-3 col-xs-6" itemscope itemtype="http://schema.org/Product">#}
                                                    {#{{ partial('layouts/template-part/product-item', ['product': product]) }}#}
                                                {#</div>#}
                                            {#{% endif %}#}
                                        {#{% endfor %}#}
                                    {#</div>#}
                                {#</div>#}
                            {#{% endif %}#}
                        {#</div>#}
                    {#{% endfor %}#}
                {#{% endif %}#}
                {#<div class="text-center">#}
                    {#{{ partial("layouts/paging", ['Pagination' : CategoryPagination]) }}#}
                {#</div>#}
            {#</div>#}
        {#</div>#}
    {#</div>#}
{#</div>#}
<section class="sec sec-category">
    <div class="container">
        <div class="row">
            {% for item in ListProduct %}
                {#{% set c = index+1 %}#}
                <div class="col-md-3 col-sm-6 col-xs-12 productJson" data-product="{{ item|json_encode|escape_attr }}">
                    {{ partial('layouts/template-part/product-item', ['item': item]) }}
                </div>
                {#<div class="clearfix {{ c%4==0?'':'hidden' }}"></div>#}
            {% endfor %}
            <div class="col-md-12  pagination-top pw-default ">
                <div id="pagination" class="">
                    <div class="col-lg-2 col-md-2 col-sm-3 hidden-xs">
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 text-center">
                        <div class="clearfix"></div>
                        <nav aria-label="Page navigation" class="navigation">
                            {% include "layouts/paging.volt" %}
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{% include "layouts/footer.volt" %}