<div class="col-md-3">
    <div class="sidebar-widget">
        <form role="search" method="get" id="searchform">
            <div class="input-group"><input type="text" value name="s" class="form-control" placeholder="Search">
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit" id="searchsubmit" value="">
                        <i class="fa fa-search"></i>
                    </button>
                    <input type="hidden" name="post_type" value="product">
                </span>
            </div>
        </form>
    </div>
    <div class="sidebar-widget">
        <h3 class="sidebar-header">Deal</h3>
        <ul class="product_list_widget">
            {% for item in listAllProductDeal %}
                {% set link = uihelper.makeLink_Product(item) %}
                <li>
                    <a href="{{ link }}" title="White Skirt"> <img width="90" height="114" src="{{ item.avatar }}" alt="{{ item.name }}"/>{{ item.name }} </a>
                    <del><span class="amount">&#36;{{ number_format(item.price) }}</span></del>
                    <ins><span class="amount">&#36;{{ number_format(item.price_sell) }}</span></ins>
                </li>
            {% endfor %}
        </ul>
    </div>
</div>