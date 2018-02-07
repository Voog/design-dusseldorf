<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}

  {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}

  {% comment %}STYLESHEETS{% endcomment %}
  {% stylesheet_link "main.min.css" %}
</head>

<body class="item-list-page {% if site.search.enabled %}search-enabled{% endif %}{% if editmode %} editmode{% endif %}">
  {% include "template-svg-spritesheet" %}

  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>

    <div class="main">
      <div class="content-top js-content-top">
        <div class="background-color"></div>

        {% if page_level == 0 %}
          {% include "submenu_for_current" exclude_products: true %}
        {% endif %}

        {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}

        <section class="content cfx formatted" {{ edy_intro_edit_text }}>
          {% include "menu-breadcrumbs" %}
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

  <script>template.initItemsPage();</script>
</body>
</html>
