<section class="section">
    <div class="background-overlay" style="background-color: rgba(240,240,240,1);"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="flexslider flex-controls-bottom element-top-0 element-bottom-20 os-animation" data-flex-animation="slide" data-flex-captionhorizontal="left" data-flex-controls="hide" data-flex-controlsalign="center" data-flex-controlsposition="inside"
                     data-flex-controlsvertical="bottom" data-flex-directions="hide" data-flex-duration="600" data-flex-itemwidth="165" data-flex-sliderdirection="horizontal" data-flex-slideshow="true" data-flex-speed="7000" data-os-animation="fadeIn"
                     data-os-animation-delay="0s" id="flexslider-100">
                    <ul class="slides">
                        {% for item in websiteConfig['branch'] %}
                            <li>
                                <a href="/"><figure> <img alt="{{ item.link }}" class="attachment-full wp-post-image" height="200" src="{{ item.avatar }}" width="200"> </figure></a>
                            </li>
                        {% endfor %}
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>