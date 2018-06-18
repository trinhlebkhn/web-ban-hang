{% include "layouts/header.volt" %}

<section class="sec sec-category">
    <div class="container">
        <div>
            <p>Có <strong>{{ totalsearch }}</strong> kết quả tìm kiếm theo : <b>"{{ QueryURL['q'] }}"</b></p>
        </div>
        <div class="row">
            {% for item in ListProductOfSearch %}
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

