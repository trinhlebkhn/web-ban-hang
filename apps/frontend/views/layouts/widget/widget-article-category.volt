{% set WidgetArticleCategory = uihelper.getArticleCategoryList('', 0) %}
{% if WidgetArticleCategory|length > 0 %}
    <section class="section_offset">
        <h3>Danh mục tin tức</h3>
        <ul class="theme_menu">
            {% for item in WidgetArticleCategory %}
                <li><a href="{{ uihelper.makeLink_Category(item) }}">{{ item.name }}</a></li>
            {% endfor %}
        </ul>
    </section>
{% endif %}

