<section class="section_offset">
    <h3>Danh sách bài viết</h3>
    <ul class="list_of_entries">
        {% for item in listData %}
            <li>
                <article class="entry">
                    <a href="{{ uiHelper.makeLinkArticle(item) }}" class="entry_thumb">
                        <img src="{{ item['avatar'] }}" alt="">
                    </a>
                    <div class="wrapper">
                        <h6 class="entry_title"><a href="{{ uiHelper.makeLinkArticle(item) }}">{{ item['name'] }}</a></h6>
                        <div class="entry_meta">
                            <span><i class="fa fa-calendar"></i> {{ item['datecreate'] }}</span>
                        </div>
                    </div>
                </article>
            </li>
        {% endfor %}
    </ul>
</section>