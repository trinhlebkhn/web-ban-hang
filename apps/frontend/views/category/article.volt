{% include "layouts/header.volt" %}
<section class="sec-page section__news">
    <div class="container">
        <div class="row">
            {{ partial('layouts/breadcrumb', ['DataItem': CatInfo]) }}
            <div class="row">
                <aside class="col-md-3 col-sm-4">
                    {% include "layouts/sidebar/sidebar-article.volt" %}
                </aside>
                <main class="col-md-9 col-sm-8">
                    <h1>Tin tức</h1>
                    <ul id="content" class="list_of_entries">
                        {% for item in ListArticle %}
                            <li>
                                {{ partial('layouts/template-part/article-item', ['article': item]) }}
                            </li>
                        {% endfor %}
                    </ul>
                    <footer class="bottom_box on_the_sides">
                        <div class="right_side">
                            <ul class="pags">
                                {% include "layouts/paging.volt" %}
                            </ul>
                        </div>
                    </footer>
                </main>
            </div>
        </div>
    </div>
</section>
{% include "layouts/footer.volt" %}
