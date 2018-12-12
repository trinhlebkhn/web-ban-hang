{% set article_link = uiHelper.makeLinkArticle(article) %}
<article class="blog-item">
    <div class="news__cat__item">
        <div class="news__image">
            <a href="{{ article_link }}">
                <img src="{{  article['avatar']|length > 0? article['avatar']:resourcePath~'uploads/no-image.png'  }}" alt="{{ article['name'] }}">
            </a>
        </div>
        <h4 class="news__title">
            <a href="{{ article_link }}">{{ article['name'] }}</a>
        </h4>
        <div class="news__date">
            <span class="-ap icon icon-access_time"></span>
            {{ article['datecreate'] }}
        </div>
        <div class="news__shortdesc">
            {{ article['caption'] }}
        </div>
        <div class="news-action">
            <a href="{{ article_link }}" class="btn btn-default">Đọc thêm</a>
        </div>
    </div>
    <div class="clearfix"></div>
</article>