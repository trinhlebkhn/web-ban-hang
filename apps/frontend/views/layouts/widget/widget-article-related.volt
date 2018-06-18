{% if listArticle|length>0 %}
    <section class="section_offset">
        <h3>Bài viết liên quan</h3>
        <ul class="list_of_entries">
            {% for item in listArticle %}
                <li>
                    <article class="entry">
                        <a href="{{ uihelper.makeLink_Article(item) }}" class="entry_thumb">
                            <img src="{{ item.avatar }}" alt="">
                        </a>
                        <div class="wrapper">
                            <h6 class="entry_title"><a href="{{ uihelper.makeLink_Article(item) }}">{{ item.name }}</a></h6>
                            <div class="entry_meta">
                                <span><i class="fa fa-calendar"></i> {{ item.datecreate }}</span>
                            </div>
                        </div>
                    </article>
                </li>
            {% endfor %}
        </ul>
    </section>
{% endif %}