{% for item in data %}
    <li class="{{ item['child'] is not empty? 'has-sub__menu' : '' }}">
        <a href="{{ uiHelper.makeLinkCategory(item) }}" class="">{{ item['name'] }}</a>
        {% if item['child'] is not empty %}
            <ul class="">
                {{ uiHelper.drawRecursiveMenu('layouts/recursive/category',  item['child']) }}
            </ul>
        {% endif %}
    </li>
{% endfor %}

