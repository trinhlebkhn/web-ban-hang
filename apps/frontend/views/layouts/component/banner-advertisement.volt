<section class="section">
    <div class="container">
        <div class="row">
            {% set arrayListBanner = array_chunk(websiteConfig.banner_advertisement.images, 3) %}
            <div class="col-md-9">
                <div class="figure element-top-30 element-bottom-20 image-effect-scroll-right os-animation" data-os-animation="fadeIn" data-os-animation-delay="0s">
                    <a class="figure-image" href="shop-mens-category.html" target="_self"> <img alt="{{ arrayListBanner[0][0].name }}" src="{{ arrayListBanner[0][0].image }}"> </a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="figure element-top-30 element-bottom-0 image-effect-scroll-left os-animation" data-os-animation="fadeIn" data-os-animation-delay="0.2s">
                    <a class="figure-image" href="shop-mens-category.html" target="_self"> <img alt="{{ arrayListBanner[0][1].name }}" src="{{ arrayListBanner[0][1].image }}"> </a>
                </div>
                <div class="figure element-top-30 element-bottom-20 image-effect-scroll-left os-animation" data-os-animation="fadeIn" data-os-animation-delay="0.4s">
                    <a class="figure-image" href="shop-mens-category.html" target="_self"> <img alt="{{ arrayListBanner[0][2].name }}" src="{{ arrayListBanner[0][2].image }}"> </a>
                </div>
            </div>
        </div>
    </div>
</section>