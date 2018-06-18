<div class="aside-item">
    <div>
        <div class="aside-title">
            <h2 class="title-head"><a href="javascript:void(0)">Bài viết mới nhất</a></h2>
        </div>
        <div class="aside-content">
            <div class="blog-list blog-image-list">
                {% set listarticlenew = uihelper.getArticleList(4, 'new') %}
                {% for item in listarticlenew %}
                    <div class="loop-blog">
                        <div class="thumb-left">
                            <a href="{{ uihelper.makeLink_Article(item) }}">
                                <img src="{{ item.avatar|length? item.avatar:resourcePath~'uploads/no-image.png' }}" class="img-responsive">
                            </a>
                        </div>
                        <div class="name-right">
                            <h3><a href="{{ uihelper.makeLink_Article(item) }}">{{ item.name }}</a></h3>
                            <div class="post-time">
                                <span class="-ap icon icon-access_time"></span>
                                {{ item.datecreate }}
                            </div>
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
</div>
