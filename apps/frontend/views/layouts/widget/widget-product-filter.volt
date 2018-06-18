{% if boxfilter|length %}
    {% for item in boxfilter %}
        <form id="FilterForm" method="get" action="{{ QueryURL._url }}">
            {% for key, value in QueryURL %}
                {% if key == '_url' or key == 'p' or key == 'filter_price_type' %}
                    {% continue %}
                {% endif %}
                <input type="hidden" name="{{ key }}" value="{{ value }}">
            {% endfor %}
            {% for itemChild in item.config|json_decode %}
                <div class="category__sidebar__box">
                    <h2 class="sidebar__cat__title"> {{ itemChild.name }}</h2>
                    {% if itemChild.key == 'brand' %}
                        <div class="sidebar__list">
                            {% if(itemChild.filter_type == 'select') %}
                                <select class="partner-frm form-control BrandSelector" title="">
                                    <option value="">Tất cả</option>
                                    {% for i in itemChild.data %}
                                        <option {{ filter_brand[0] == i.id ? 'selected':'' }} value="{{ i.id }}">{{ i.name }}</option>
                                    {% endfor %}
                                </select>
                                <script>
                                    $(document).ready(function () {
                                        $('.BrandSelector').on('change', function () {
                                            var filter_brand = [];
                                            filter_brand.push($(this).val());
                                            console.log("filter_brand", filter_brand);
                                            if ($('#FilterForm').find('input[name="filter_brand"]').length > 0) {
                                                $('#FilterForm').find('input[name="filter_brand"]').val(filter_brand.join(','));
                                            } else {
                                                $('<input />').attr('type', 'hidden').attr('name', "filter_brand").attr('value', filter_brand.join(',')).appendTo('#FilterForm');
                                            }

                                            $('#FilterForm').submit();
                                        });
                                    });
                                </script>
                            {% else %}
                                {% for k, i in itemChild.data %}
                                <div class="check__action">
                                    <input type="checkbox" class="checkbox BrandCheckbox" value="{{ i.id }}" {{ in_array(i.id, filter_brand) ? 'checked':'' }} title=""><span class="icon"></span>{{ i.name }}
                                </div>
                                {% endfor %}
                                <script>
                                    $(document).ready(function () {
                                        $('input.BrandCheckbox').on('change', function () {
                                            var filter_brand = [];
                                            $('input.BrandCheckbox:checked').each(function () {
                                                filter_brand.push($(this).val());
                                            });
                                            console.log("filter_brand", filter_brand);
                                            if ($('#FilterForm').find('input[name="filter_brand"]').length > 0) {
                                                $('#FilterForm').find('input[name="filter_brand"]').val(filter_brand.join(','));
                                            } else {
                                                $('<input />').attr('type', 'hidden').attr('name', "filter_brand").attr('value', filter_brand.join(',')).appendTo('#FilterForm');
                                            }

                                            $('#FilterForm').submit();
                                        });
                                    });
                                </script>
                            {% endif %}
                        </div>
                        {% elseif itemChild.key == 'country' %}
                            <div class="sidebar__list">
                                {% if(itemChild.filter_type == 'select') %}
                                    <select class="partner-frm form-control CountrySelector" title="">
                                        <option value="">Tất cả</option>
                                        {% for i in itemChild.data %}
                                            <option {{ filter_country[0] == i.id ? 'selected':'' }} value="{{ i.id }}">{{ i.name }}</option>
                                        {% endfor %}
                                    </select>
                                    <script>
                                        $(document).ready(function () {
                                            $('.CountrySelector').on('change', function () {
                                                var filter_country = [];
                                                filter_country.push($(this).val());
                                                console.log("filter_country", filter_country);
                                                if ($('#FilterForm').find('input[name="filter_country"]').length > 0) {
                                                    $('#FilterForm').find('input[name="filter_country"]').val(filter_country.join(','));
                                                } else {
                                                    $('<input />').attr('type', 'hidden').attr('name', "filter_country").attr('value', filter_country.join(',')).appendTo('#FilterForm');
                                                }

                                                $('#FilterForm').submit();
                                            });
                                        });
                                    </script>
                                {% else %}
                                    {% for k, i in itemChild.data %}
                                    <div class="check__action">
                                        <input type="checkbox" class="checkbox CountryCheckbox" value="{{ i.id }}" {{ in_array(i.id, filter_country) ? 'checked':'' }} title=""><span class="icon"></span>{{ i.name }}
                                    </div>
                                    {% endfor %}
                                    <script>
                                        $(document).ready(function () {
                                            $('input.CountryCheckbox').on('change', function () {
                                                var filter_country = [];
                                                $('input.CountryCheckbox:checked').each(function () {
                                                    filter_country.push($(this).val());
                                                });
                                                console.log("filter_country", filter_country);
                                                if ($('#FilterForm').find('input[name="filter_country"]').length > 0) {
                                                    $('#FilterForm').find('input[name="filter_country"]').val(filter_country.join(','));
                                                } else {
                                                    $('<input />').attr('type', 'hidden').attr('name', "filter_country").attr('value', filter_country.join(',')).appendTo('#FilterForm');
                                                }

                                                $('#FilterForm').submit();
                                            });
                                        });
                                    </script>
                                {% endif %}
                            </div>
                    {% elseif(itemChild.key == 'attribute') %}
                        <div class="sidebar__list">
                            {% if(itemChild.filter_type == 'select') %}
                                <select class="partner-frm form-control AttributeSelector" title="">
                                    <option value="">Tất cả</option>
                                    {% for i in itemChild.data %}
                                        <option {{ filter_attribute[0] == i.id ? 'selected':'' }} value="{{ i.id }}">{{ i.name }}</option>
                                    {% endfor %}
                                </select>
                                <script>
                                    $(document).ready(function () {
                                        $('.AttributeSelector').on('change', function () {
                                            var filter_attribute = [];
                                            filter_attribute.push($(this).val());
                                            console.log("filter_attribute", filter_attribute);
                                            if ($('#FilterForm').find('input[name="filter_attribute"]').length > 0) {
                                                $('#FilterForm').find('input[name="filter_attribute"]').val(filter_attribute.join(','));
                                            } else {
                                                $('<input />').attr('type', 'hidden').attr('name', "filter_attribute").attr('value', filter_attribute.join(',')).appendTo('#FilterForm');
                                            }

                                            $('#FilterForm').submit();
                                        });
                                    });
                                </script>
                            {% else %}
                                {% for k, i in itemChild.data %}
                                <div class="check__action">
                                    <input type="checkbox" class="checkbox AttributeCheckbox" value="{{ i.id }}" {{ in_array(i.id, filter_attribute) ? 'checked':'' }} title=""><span class="icon"></span>{{ i.name }}
                                </div>
                                {% endfor %}
                                <script>
                                    $(document).ready(function () {
                                        $('input.AttributeCheckbox').on('change', function () {
                                            var filter_attribute = [];
                                            $('input.AttributeCheckbox:checked').each(function () {
                                                filter_attribute.push($(this).val());
                                            });
                                            console.log("filter_attribute", filter_attribute);
                                            if ($('#FilterForm').find('input[name="filter_attribute"]').length > 0) {
                                                $('#FilterForm').find('input[name="filter_attribute"]').val(filter_attribute.join(','));
                                            } else {
                                                $('<input />').attr('type', 'hidden').attr('name', "filter_attribute").attr('value', filter_attribute.join(',')).appendTo('#FilterForm');
                                            }

                                            $('#FilterForm').submit();
                                        });
                                    });
                                </script>
                            {% endif %}
                        </div>
                    {% elseif itemChild.key == 'price' %}
                        <div class="sidebar__list">
                            <input type="hidden" name="filter_price_type" value="{{ itemChild.filter_type }}">
                            {% if(itemChild.filter_type == 'select') %}
                                <select class="partner-frm form-control PriceSelector" title="">
                                    <option value="">Tất cả</option>
                                    {% for i in itemChild.data %}
                                        {% if(i.type == 'between') %}
                                            <option value="{{ i.type }}-{{ i.from_value }}-{{ i.to_value }}">{{ i.name }}</option>
                                        {% else %}
                                            <option value="{{ i.type }}-{{ i.from_value }}">{{ i.name }}</option>
                                        {% endif %}
                                    {% endfor %}
                                </select>
                                <script>
                                    $(document).ready(function () {
                                        $('.PriceSelector').val('{{ QueryURL['filter_price'] }}');
                                        $('.PriceSelector').on('change', function () {
                                            var filter_price = [];
                                            filter_price.push($(this).val());
                                            console.log("filter_price", filter_price);
                                            if ($('#FilterForm').find('input[name="filter_price"]').length > 0) {
                                                $('#FilterForm').find('input[name="filter_price"]').val(filter_price.join(','));
                                            } else {
                                                $('<input />').attr('type', 'hidden').attr('name', "filter_price").attr('value', filter_price.join(',')).appendTo('#FilterForm');
                                            }

                                            $('#FilterForm').submit();
                                        });
                                    });
                                </script>
                                {% elseif itemChild.filter_type == 'slider' %}
                                <div id="slider__price"></div>
                                <div class="slider__price__value">
                                    <span class="name">Từ</span>
                                    <div id="lower-price" class="number"></div>
                                </div>
                                <div class="slider__price__value">
                                    <span class="name">Đến</span>
                                    <div id="upper-price" class="number"></div>
                                </div>
                                <script>
                                    $(document).ready(function () {
                                        if ($("#slider__price,#lower-price,#upper-price").length) {
                                            var slider__price = document.getElementById('slider__price');

                                            slider__price.noUiSlider.destroy();
                                            noUiSlider.create(slider__price, {
                                                connect: true,
                                                behaviour: 'tap',
                                                start: [ {{ filter_price ? filter_price[0] : itemChild.data[0].from_value }}, {{ filter_price ? filter_price[1] : itemChild.data[0].to_value }} ],
                                                step: {{ itemChild.data[0].to_value/10 }},
                                                range: {
                                                    'min': [ {{ itemChild.data[0].from_value }} ],
                                                    'max': [ {{ itemChild.data[0].to_value }} ]
                                                },
                                                format: wNumb({
                                                    decimals: 0,
                                                    thousand: '.',
                                                    postfix: ' đ',
                                                })
                                            });
                                            var nodes = [
                                                document.getElementById('lower-price'), // 0
                                                document.getElementById('upper-price')  // 1
                                            ];
                                            slider__price.noUiSlider.on('update', function (values, handle, unencoded, isTap, positions) {
                                                nodes[handle].innerHTML = values[handle];
                                            });

                                            //Filter giá
                                            slider__price.noUiSlider.on('change.one', function (values, handle, unencoded, tap, positions) {
                                                console.log("unencoded", unencoded);
                                                if ($('#FilterForm').find('input[name="filter_price"]').length > 0) {
                                                    $('#FilterForm').find('input[name="filter_price"]').val(unencoded.join('-'));
                                                } else {
                                                    $('<input />').attr('type', 'hidden').attr('name', "filter_price").attr('value', unencoded.join('-')).appendTo('#FilterForm');
                                                }
                                                $('#FilterForm').submit();
                                            });
                                        }
                                    })
                                </script>
                            {% else %}
                                {% for k, i in itemChild.data %}
                                <div class="check__action">
                                    {% if(i.type == 'between') %}
                                        <input type="checkbox" class="checkbox PriceCheckbox" value="{{ i.type }}-{{ i.from_value }}-{{ i.to_value }}" title=""><span class="icon"></span>{{ i.name }}
                                    {% else %}
                                        <input type="checkbox" class="checkbox PriceCheckbox" value="{{ i.type }}-{{ i.from_value }}" title=""><span class="icon"></span>{{ i.name }}
                                    {% endif %}
                                </div>
                                {% endfor %}
                                <script>
                                    $(document).ready(function () {
                                        $('input.PriceCheckbox').each(function () {
                                            var filter_price_arr = {{ filter_price|length > 0 ? filter_price|json_encode : '[]' }};
                                            if(filter_price_arr.length > 0) {
                                                if( filter_price_arr.indexOf($(this).val()) > -1 ) {
                                                    $(this).attr('checked', true);
                                                }
                                            }
                                        });
                                        $('input.PriceCheckbox').on('change', function () {
                                            var filter_price = [];
                                            $('input.PriceCheckbox:checked').each(function () {
                                                filter_price.push($(this).val());
                                            });
                                            console.log("filter_price", filter_price);
                                            if ($('#FilterForm').find('input[name="filter_price"]').length > 0) {
                                                $('#FilterForm').find('input[name="filter_price"]').val(filter_price.join(','));
                                            } else {
                                                $('<input />').attr('type', 'hidden').attr('name', "filter_price").attr('value', filter_price.join(',')).appendTo('#FilterForm');
                                            }

                                            $('#FilterForm').submit();
                                        });
                                    });
                                </script>
                            {% endif %}
                        </div>
                    {% endif %}
                </div>
            {% endfor %}
        </form>
    {% endfor %}
{% endif %}