<!-- footer -->
<footer id="footer">
    <section class="section">
        <div class="container">
            <div class="row element-top-40 element-bottom-40 footer-columns-4">
                <div class="col-sm-3">
                    <div class="sidebar-widget widget_text" id="text-15">
                        <h3 class="sidebar-header">Thông tin liên hệ</h3>
                        <div class="textwidget">
                            <address>
                                <b>Địa chỉ: </b>{{ websiteConfig['address'] }}
                            </address>
                        </div>
                    </div>
                    <div class="sidebar-widget widget_social">
                        <ul class="unstyled inline social-icons social-simple social-normal">
                            {% if websiteConfig['twitter_link'] is not empty %}
                                <li><a href="{{ websiteConfig['twitter_link'] }}"><i class="fa fa-twitter"></i></a></li>
                            {% endif %}
                            {% if websiteConfig['facebook_link'] is not empty %}
                                <li><a href="{{ websiteConfig['facebook_link'] }}"><i class="fa fa-facebook"></i></a></li>
                            {% endif %}
                            {% if websiteConfig['google_link'] is not empty %}
                                <li><a href="{{ websiteConfig['google_link'] }}"><i class="fa fa-google-plus"></i></a></li>
                            {% endif %}
                            {% if websiteConfig['youtube_link'] is not empty %}
                                <li><a href="{{ websiteConfig['youtube_link'] }}"><i class="fa fa-youtube"></i></a></li>
                            {% endif %}
                        </ul>
                    </div>
                </div>
                {#{% set footer_menu = uihelper.getMenu(websiteConfig.footer_menu.menu_id, 1) %}#}
                {% for index, blockMenu in websiteConfig['list_block_menu_footer'] %}
                    <div class="col-sm-3">
                        <div class="sidebar-widget widget_text">
                            <h3 class="sidebar-header">{{ blockMenu['name'] }}</h3>
                            <div class="list">
                                <ul>
                                    {% for item in blockMenu['list_menu'] %}
                                        <li><a href="{{ item['link'] }}">{{ item['name'] }}</a></li>
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>
                    </div>
                    {% if index == 2 or (index > 2 and (index+1)%4==0) %}
                        <div class="clear-fix"></div>
                    {% endif %}
                {% endfor %}
            </div>
        </div>
    </section>
    <section class="section subfooter">
        <div class="container">
            <div class="row element-top-10 element-bottom-10 footer-columns-2">
                <div class="col-sm-6">
                    <div class="sidebar-widget widget_text">
                        <div class="textwidget"> Design by Trinh Le</div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="sidebar-widget widget_text">
                        <div class="textwidget">
                            {#{% set menu_bottom_footer = uihelper.getMenu(websiteConfig.menu_bottom_footer.menu_id, 1) %}#}
                            {% set count = websiteConfig['menu_bottom_footer'] | length %}
                            {% for index, item in websiteConfig['menu_bottom_footer'] %}
                                <a href="{{ item['link'] }}">{{ item['name'] }} </a>
                                {{ index < count-1 ? '|' : '' }}
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</footer>
