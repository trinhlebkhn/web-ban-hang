<div class="category__sidebar">
    <div class="category__sidebar__box">
        <h2 class="sidebar__cat__title"><a href="/product/index">DANH MỤC SẢN PHẨM</a></h2>
        <div class="sidebar__list">
            {% set CategoryProduct_List = uihelper.getCategoryList(1) %}
            {{ uihelper.menuCategoryarticle(CategoryProduct_List) }}
        </div>
    </div>
</div>