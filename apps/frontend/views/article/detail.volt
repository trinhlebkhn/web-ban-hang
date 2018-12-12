{% include "layouts/header.volt" %}
<section class="section">
    <div class="background-overlay grid-overlay-0 " style="background-color: rgba(240,240,240,1);"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-left element-top-30 element-bottom-30 text-normal normal regular" data-os-animation="none" data-os-animation-delay="0s"> Bài viết </h1>
            </div>
        </div>
    </div>
</section>
<div class="secondary_page_wrapper">
    <div class="container">
        <div class="row">
            <aside class="col-md-3 col-sm-4">
                {% include "layouts/sidebar/sidebar-detail-article.volt" %}
            </aside>
            <main class="col-md-9 col-sm-8">
                <section class="section_offset">
                    <h1>{{ detailArticle['name ']}}</h1>
                    <article class="entry single">
                        <div class="entry_meta">
                            <div class="alignleft">
                                <span><i class="fa fa-calendar"></i> {{ detailArticle['datecreate']}} |</span>
                                <span><i class="fa fa-folder"></i> <a href="#">{{ detailArticle['category_name']}}</span>
                            </div>
                        </div>
                        {% if detailArticle['avatar']|length > 0 %}
                            <div class="entry_image">
                                <img src="{{ detailArticle['avatar']}}" alt="">
                            </div>
                        {% endif %}

                        <h4 class="entry_title"><a href="#">{{ detailArticle['name']}}</a></h4>

                        <p>{{ detailArticle['content']}}</p>
                    </article>
                </section>
            </main>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}