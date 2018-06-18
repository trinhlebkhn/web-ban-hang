{% for item in data %}
    {#{{ item | json_encode }}#}
    <li class="menu-item {{ item['child'] is not empty? 'dropdown' : '' }} "><a href="{{ item['link']}}">{{ item['name'] }}</a>
        {% if item['child'] is not empty %}
            <ul class="dropdown-menu dropdown-menu-left ">
                {{ uiHelper.drawRecursiveMenu('layouts/recursive/main-menu', item['child']) }}
            </ul>
        {% endif %}
    </li>
{% endfor %}