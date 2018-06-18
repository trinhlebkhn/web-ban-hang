<div class="category__sidebar">
    <div class="category__sidebar__box">
        <h2 class="sidebar__cat__title"><a href="javascript:void(0)">DANH MỤC TIN TỨC</a></h2>
        <div class="sidebar__list">
            {% set CategoryArticle_List = uihelper.getCategoryList(2) %}
            {{ uihelper.menuCategoryArticle(CategoryArticle_List) }}
        </div>
    </div>
</div>