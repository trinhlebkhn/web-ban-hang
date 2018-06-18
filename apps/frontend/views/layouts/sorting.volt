{#<div class="product__filter pull-right">#}
    {#<div class="filter">#}
        {#<span class="name">Sắp xếp theo:</span>#}
        {#<form id="SortForm" method="get" action="{{ QueryURL._url }}" style="display: inline-block;">#}
            {#{% for key, value in QueryURL %}#}
                {#{% if key == '_url' or key == 'p' or key == 'sort' %}#}
                    {#{% continue %}#}
                {#{% endif %}#}
                {#<input type="hidden" name="{{ key }}" value="{{ value }}">#}
            {#{% endfor %}#}
            {#<select name="sort" id="" class="form-control selectpicker show-tick" onchange="this.form.submit()">#}
                {#<option {{ sort == '' ? 'selected' : '' }} value="">Mặc định</option>#}
                {#<option {{ sort == 'price_sell' ? 'selected' : '' }} value="price_sell">Giá tăng dần</option>#}
                {#<option {{ sort == '-price_sell' ? 'selected' : '' }} value="-price_sell">Giá giảm dần</option>#}
                {#<option {{ sort == 'name' ? 'selected' : '' }} value="name">Từ A-Z</option>#}
                {#<option {{ sort == '-name' ? 'selected' : '' }} value="-name">Từ Z-A</option>#}
                {#<option {{ sort == 'id' ? 'selected' : '' }} value="id">Cũ đến mới</option>#}
                {#<option {{ sort == '-id' ? 'selected' : '' }} value="-id">Mới đến cũ</option>#}
                {#<option {{ sort == '-visited' ? 'selected' : '' }} value="-visited">Xem nhiều nhất</option>#}
            {#</select>#}
        {#</form>#}
    {#</div>#}
{#</div>#}
<p class="woocommerce-result-count"> Sắp xếp theo: </p>
<form class="woocommerce-ordering" id="SortForm" method="get" action="{{ QueryURL._url }}">
    {% for key, value in QueryURL %}
        {% if key == '_url' or key == 'p' or key == 'sort' %}
            {% continue %}
        {% endif %}
        <input type="hidden" name="{{ key }}" value="{{ value }}">
    {% endfor %}
    <select name="sort" id="" class="orderby" onchange="this.form.submit()">
        <option {{ sort == '' ? 'selected' : '' }} value="">Mặc định</option>
        <option {{ sort == 'price_sell' ? 'selected' : '' }} value="price_sell">Giá tăng dần</option>
        <option {{ sort == '-price_sell' ? 'selected' : '' }} value="-price_sell">Giá giảm dần</option>
        <option {{ sort == 'name' ? 'selected' : '' }} value="name">Từ A-Z</option>
        <option {{ sort == '-name' ? 'selected' : '' }} value="-name">Từ Z-A</option>
        <option {{ sort == 'id' ? 'selected' : '' }} value="id">Cũ đến mới</option>
        <option {{ sort == '-id' ? 'selected' : '' }} value="-id">Mới đến cũ</option>
    </select>
</form>