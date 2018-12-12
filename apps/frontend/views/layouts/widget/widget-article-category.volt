{% set listCatsArticle = uiHelper.getArticleCategoryList() %}
{% if listCatsArticle|length > 0 %}
        <section class="section_offset">
        <h3>Danh mục tin tức</h3>
        <ul class="theme_menu">
            {% for item in listCatsArticle %}
                <li><a href="{{ uiHelper.makeLinkCategory(item) }}">{{ item.name }}</a></li>
            {% endfor %}
        </ul>
    </section>
{% endif %}

