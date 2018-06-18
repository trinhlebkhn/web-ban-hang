{% for item in data %}
    <li class="{{ uihelper.menuActive(item, 'active-menu') }}">
        <a href="{{ item.link }}" class="catalog__link">
            {#<img class="icon" src="{{ resourcePath }}uploads/rice.png" alt="Gạo-ngũ cốc-Bột">#}
            <span>{{ item.name }}</span>
            {% if item.child is not empty %}<i class="fa fa-angle-right" aria-hidden="true"></i> {% endif %}</a>
        {% if item.child is not empty %}
            <ul class="">
                {{ uihelper.drawRecursiveMenu('layouts/recursive/left-menu', item.child) }}
            </ul>
        {% endif %}
    </li>
{% endfor %}