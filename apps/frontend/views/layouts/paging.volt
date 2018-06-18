{% if Pagination['total'] > 0 and Pagination['total_pages'] > 1 and Pagination['current'] >= 1 and Pagination['current'] <= Pagination['total_pages'] %}
    <nav aria-label="Page navigation" class="navigation">
        <ul class="pagination">
            {% if Pagination['current'] > 1 %}
                <li>
                    <a href="{{ Pagination['current_link'] }}p={{ (Pagination['current']-1) }}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            {% endif %}
            {% for i in 1..Pagination['total_pages'] %}
                <li class="{{ i == Pagination['current'] ? 'active' : '' }}"><a href="{{ Pagination['current_link'] }}p={{ i }}">{{ i }}</a></li>
            {% endfor %}
            {% if Pagination['current'] < Pagination['total_pages'] %}
                <li>
                    <a href="{{ Pagination['current_link'] }}p={{ (Pagination['current']+1) }}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            {% endif %}
        </ul>
    </nav>
{% endif %}
{% if Pagination['total'] == 0 %}
    <p class="text-success text-center" style="font-size: 15px;padding-top: 10px">Không tìm thấy kết quả nào ở trang này</p>
{% endif %}