<ul class="">
    {% for item in data %}
        <li>
            <a href="{{ uihelper.makeLink_Category(item) }}" target={{ item.target == '_blank' ? item.target : '' }}>{{ item.name }}</a>
            {% if item.child is not empty %}
                {{ uihelper.menuCategory(item.child) }}
            {% endif %}
        </li>
    {% endfor %}
</ul>