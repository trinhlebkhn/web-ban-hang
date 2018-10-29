{% include "layouts/header.volt" %}
<div class="secondary_page_wrapper">
    <div class="container">
        <ol class="breadcrumb">
            <li><a class="home" href="/">Trang chủ</a></li>
            <li>Tin tức</li>
        </ol>
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
{% include "layouts/footer.volt" %}
