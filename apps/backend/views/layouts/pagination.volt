{% if StrSearch|length > 0  and SttSearch|length == 0 %}
    {% set paramSearch = '&q='~StrSearch %}
{% elseif StrSearch|length == 0  and SttSearch|length > 0 %}
    {% set paramSearch = '&stt='~SttSearch %}
{% elseif StrSearch|length > 0  and SttSearch|length > 0 %}
    {% set paramSearch =  '&q='~StrSearch~'&stt='~SttSearch %}
{% endif %}
{% if Paginginfo['total_page'] > 1 and Paginginfo['total_page'] <=5 %}
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="{{ Current_link }}?p={{ Paginginfo['curent_page'] == 1 ? 1 : Paginginfo['curent_page'] - 1 }}{{ paramSearch }}">Prev</a>
            </li>
            {% for i in 1..Paginginfo['total_page'] %}
                <li class="page-item {{ i == Paginginfo['curent_page'] ? 'active' : '' }}"><a class="page-link" href="{{ Current_link }}?p={{ i }}{{ paramSearch }}">{{ i }}</a></li>
            {% endfor %}
            <li class="page-item">
                <a class="page-link" href="{{ Current_link }}?p={{ Paginginfo['curent_page'] == Paginginfo['total_page'] ? Paginginfo['total_page'] : Paginginfo['curent_page']+1 }}{{ paramSearch }}">Next</a>
            </li>
        </ul>
    </nav>
{% elseif Paginginfo['total_page'] > 5 %}
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="{{ Current_link }}?p={{ Paginginfo['curent_page'] == 1 ? 1 : Paginginfo['curent_page'] - 1 }}{{ paramSearch }}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            {% if Paginginfo['curent_page'] > 3 and Paginginfo['curent_page'] <= Paginginfo['total_page'] - 3 %}
                <li class="page-item">
                    <a class="page-link" href="{{ Current_link }}?p=1{{ paramSearch }}">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                {% set MinPageView = Paginginfo['curent_page'] - 1 %}
                {% set MaxPageView = Paginginfo['curent_page'] + 1 %}
                {% for i in MinPageView..MaxPageView %}
                    <li class="page-item {{ i == Paginginfo['curent_page'] ? 'active' : '' }}"><a class="page-link" href="{{ Current_link }}?p={{ i }}{{ paramSearch }}">{{ i }}</a></li>
                {% endfor %}
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                <li class="page-item {{ Paginginfo['total_page'] == Paginginfo['curent_page'] ? 'active' : '' }}"><a class="page-link" href="{{ Current_link }}?p={{ Paginginfo['total_page'] }}{{ paramSearch }}">{{ Paginginfo['total_page'] }}</a></li>

            {% elseif Paginginfo['curent_page'] > Paginginfo['total_page'] - 3 %}
                <li class="page-item">
                    <a class="page-link" href="{{ Current_link }}?p=1{{ paramSearch }}">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                {% set MinPageView = Paginginfo['total_page'] - 2 %}
                {% for i in MinPageView..Paginginfo['total_page'] %}
                    <li class="page-item {{ i == Paginginfo['curent_page'] ? 'active' : '' }}"><a class="page-link" href="{{ Current_link }}?p={{ i }}{{ paramSearch }}">{{ i }}</a></li>
                {% endfor %}

            {% else %}
                {% for i in 1..3 %}
                    <li class="page-item {{ i == Paginginfo['curent_page'] ? 'active' : '' }}"><a class="page-link" href="{{ Current_link }}?p={{ i }}{{ paramSearch }}">{{ i }}</a></li>
                {% endfor %}
                <li class="page-item">
                    <a class="page-link">......</a>
                </li>
                <li class="page-item {{ Paginginfo['total_page'] == Paginginfo['curent_page'] ? 'active' : '' }}"><a class="page-link" href="{{ Current_link }}?p={{ Paginginfo['total_page'] }}{{ paramSearch }}">{{ Paginginfo['total_page'] }}</a></li>
            {% endif %}
            <li class="page-item">
                <a class="page-link" href="{{ Current_link }}?p={{ Paginginfo['curent_page'] == Paginginfo['total_page'] ? Paginginfo['total_page'] : Paginginfo['curent_page'] + 1 }}{{ paramSearch }}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
{% endif %}
{% if Paginginfo['total_items'] == 0 %}
    <p class="text-success text-center" style="font-size: 15px;padding-top: 10px">Không tìm thấy kết quả nào</p>
{% endif %}