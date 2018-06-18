{% include "layouts/header.volt" %}
<div class="secondary_page_wrapper">
    <div class="container">
        {{ partial('layouts/breadcrumb', ['DataItem': detailArticle]) }}
        <div class="row">

            <aside class="col-md-3 col-sm-4">
                {% include "layouts/sidebar/sidebar-detail-article.volt" %}
            </aside>
            <main class="col-md-9 col-sm-8">
                <section class="section_offset">
                    <h1>{{ detailArticle.name }}</h1>
                    <article class="entry single">
                        <div class="entry_meta">
                            <div class="alignleft">
                                <span><i class="fa fa-calendar"></i> {{ detailArticle.datecreate }} |</span>
                                <span><i class="fa fa-user"></i> Viết bởi: <a href="#">{{ detailArticle.User.fullname }} |</a></span>
                                <span><i class="fa fa-folder"></i> <a href="#">{{ detailArticle.Category.name }}</span>
                            </div>
                        </div>
                        {% if detailArticle.avatar|length > 0 %}
                            <div class="entry_image">
                                <img src="{{ detailArticle.avatar }}" alt="">
                            </div>
                        {% endif %}

                        <h4 class="entry_title"><a href="#">{{ detailArticle.name }}</a></h4>

                        <p>{{ detailArticle.content }}</p>

                        <div class="v_centered share">

                            <span class="title">Chia sẻ bài viết này:</span>

                            <div class="addthis_widget_container">
                                <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                                    <a class="addthis_button_preferred_1"></a>
                                    <a class="addthis_button_preferred_2"></a>
                                    <a class="addthis_button_preferred_3"></a>
                                    <a class="addthis_button_preferred_4"></a>
                                    <a class="addthis_button_compact"></a>
                                    <a class="addthis_counter addthis_bubble_style"></a>
                                </div>
                            </div>

                        </div>

                    </article>
                </section>
            </main>
        </div>
    </div>
</div>
{% include "layouts/footer.volt" %}
<script>
    function share_fb(url) {
        window.open('https://www.facebook.com/sharer/sharer.php?u=' + url, 'facebook-share-dialog', "width=626, height=436")
    }
    function gPlus(url) {
        window.open(
            'https://plus.google.com/share?url=' + url,
            'popupwindow',
            'scrollbars=yes,width=800,height=400'
        ).focus();
        return false;
    }
</script>
