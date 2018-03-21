<nav class="sub-menu">
  {% for item in site.all_menuitems_on_level_1 %}
    {% if item.selected? and page.level <= 2 %}
      {% if editmode or item.children? %}
        <ul>
          {% for level1 in item.visible_children %}
            {% if exclude_products == true and level1.layout_title != 'Product' and level1.layout_title != "Product list" %}
              <li><a  href="{{level1.url}}"{% if level1.selected? %} class="active"{% endif %}{% unless level1.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{level1.title}}</a></li>
              {% elsif exclude_products != true %}
              <li><a href="{{level1.url}}"{% if level1.selected? %} class="active"{% endif %}{% unless level1.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{level1.title}}</a></li>
            {% endif %}
          {% endfor %}
          {% if editmode %}
            {% if item.hidden_children.size > 0 %}<li class="edy-btn">{% menubtn item.hidden_children %}</li>{% endif %}
            <li class="edy-btn">{% menuadd parent="item"%}</li>
          {% endif %}
        </ul>
      {% endif %}
    {% endif %}
  {% endfor %}

  {% for item in site.all_menuitems_on_level_2 %}
    {% if item.selected? and page.level == 3 %}
      {% if editmode or item.children? %}
        {% if item.layout_title == 'Product' or 'Product list' %}
          <ul>
            {% for level2 in item.visible_children %}
              {% if exclude_products == true and level2.layout_title != 'Product' and level2.layout_title != "Product list" %}
              <li><a href="{{level2.url}}"{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{level2.title}}</a></li>
                {% elsif exclude_products != true %}
              <li><a href="{{level2.url}}"{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{level2.title}}</a></li>
              {% endif %}
            {% endfor %}
          </ul>
        {% endif %}
      {% endif %}
    {% endif %}
  {% endfor %}
</nav>
