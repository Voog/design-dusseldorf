<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="item-list-page {% if site.search.enabled %}search-enabled{% endif %}{% if editmode %} editmode{% endif %}">
  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>

    <div class="main">
      <section class="content cfx formatted" {{ edy_intro_edit_text }}>
        <section class="content-item-boxes">
          {% if site.root_item.selected? %}
            {% for level_1 in site.visible_menuitems_with_data %}
              {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                {% include "product-list-item" menu_level: level_1 %}
              {% endif %}
            {% endfor %}
          {% else %}
            {% include "product-list-loop" menu_items: site.visible_menuitems %}
          {% endif %}
        </section>
      </section>
      {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "javascripts" %}
  {% include "edicy-tools" items_page: true  %}

  {% if editmode %}
    <script type="text/javascript">
      window.edy = window.edy || [];
      edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
      edy.push(['texteditorStyles', {name: '{{ "button" | lc: editor_locale }}', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
    </script>
  {% endif %}
</body>
</html>