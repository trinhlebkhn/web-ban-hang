<div class="slider-main hidden-xs">
    <div class="slider-wrapper theme-default">
        <div class="slider apollo_slides nivoSlider">
            {% for item in websiteConfig.slide_category.images %}
                <a href="{{ item.link }}"><img src="{{ item.image }}" alt="{{ item.name }}" /></a>
            {% endfor %}
        </div>
    </div>
</div>