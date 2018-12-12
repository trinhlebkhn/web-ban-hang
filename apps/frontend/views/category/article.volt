{% include "layouts/header.volt" %}
{{ this.flash.output() }}
<section class="section">
    <div class="background-overlay grid-overlay-0 " style="background-color: rgba(240,240,240,1);"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-left element-top-30 element-bottom-30 text-normal normal regular"
                    data-os-animation="none" data-os-animation-delay="0s"> {{ catInfo['name'] }} </h1>
            </div>
        </div>
    </div>
</section>
<section class="sec-page section__news">
    <div class="container">
        <div class="row">
            <div class="row">
                <aside class="col-md-3 col-sm-4">
                    {% include "layouts/sidebar/sidebar-article.volt" %}
                </aside>
                <main class="col-md-9 col-sm-8">
                    <ul id="content" class="list_of_entries">
                        {% for item in listData %}
                            <li>
                                {{ partial('layouts/template-part/article-item', ['article': item]) }}
                            </li>
                        {% endfor %}
                    </ul>
                    <footer class="bottom_box on_the_sides">
                        <div class="right_side">
                            <ul class="pags">
                                {% include "layouts/pagination.volt" %}
                            </ul>
                        </div>
                    </footer>
                </main>
            </div>
        </div>
    </div>
</section>
{% include "layouts/footer.volt" %}
