<nav class="sub-menu">
{% if editmode or page.menuitem.children? %}
  <ul>
  {% for level2 in page.menuitem.visible_children %}
    {% if level2.layout_title != product_layout and level2.layout_title != product_list_layout %}
      <li>
        <a href="{{level2.url}}"{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{level2.title}}</a>
      </li>
    {% elsif exclude_products != true %}
      <li>
        <a href="{{level2.url}}"{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{level2.title}}</a>
      </li>
    {% endif %}
  {% endfor %}
  {% if editmode %}
    {% if level2.layout_title != product_layout  %}
      {% if page.menuitem.hidden_children.size > 0 %}<li class="edy-btn">{% menubtn page.menuitem.hidden_children %}</li>{% endif %}
        {% include 'add-page-button', _menuItem: page, _wrapperClassName: "edy-btn" %}
      {% endif %}
    {% endif %}
  </ul>
{% endif%}
</nav>
