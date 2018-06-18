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
                                <b>Địa chỉ: </b>{{ websiteConfig.address }}
                            </address>
                        </div>
                    </div>
                    <div class="sidebar-widget widget_social">
                        <ul class="unstyled inline social-icons social-simple social-normal">
                            {% if websiteConfig.twitter_fanpage is not empty %}
                                <li><a href="{{ websiteConfig.twitter_fanpage }}"><i class="fa fa-twitter"></i></a></li>
                            {% endif %}
                            {% if websiteConfig.facebook_fanpage is not empty %}
                                <li><a href="{{ websiteConfig.facebook_fanpage }}"><i class="fa fa-facebook"></i></a></li>
                            {% endif %}
                            {% if websiteConfig.google_page is not empty %}
                                <li><a href="{{ websiteConfig.google_page }}"><i class="fa fa-google-plus"></i></a></li>
                            {% endif %}
                            {% if websiteConfig.youtube_fanpage is not empty %}
                                <li><a href="{{ websiteConfig.youtube_fanpage }}"><i class="fa fa-youtube"></i></a></li>
                            {% endif %}
                        </ul>
                    </div>
                </div>
                {% set footer_menu = uihelper.getMenu(websiteConfig.footer_menu.menu_id, 1) %}
                {% for index, menu in footer_menu.menu.data %}
                    <div class="col-sm-3">
                        <div class="sidebar-widget widget_text">
                            <h3 class="sidebar-header">{{ menu.name }}</h3>
                            <div class="list">
                                <ul>
                                    {% for item in menu.menu %}
                                        <li><a href="{{ item.link }}">{{ item.name }}</a></li>
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
                        <div class="textwidget"> Copyright � 2018 - <a href="bizsale.vn">Bizsale.vn</a></div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="sidebar-widget widget_text">
                        <div class="textwidget">
                            {% set menu_bottom_footer = uihelper.getMenu(websiteConfig.menu_bottom_footer.menu_id, 1) %}
                            {% set count = menu_bottom_footer.menu.data | length %}
                            {% for index, item in menu_bottom_footer.menu.data %}
                                <a href="{{ item.link }}">{{ item.name }} </a>
                                {% if(index < count-1) %}|{% endif %}
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</footer>
