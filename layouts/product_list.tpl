<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
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
      <div class="content-full content-top cfx js-content-top">
        <div class="background-color"></div>
        <div class="container js-background-type {{ content_top_bg_type }}">

          {% if page.level != 0 %}
            {% include "submenu_for_current" exclude_products: true %}
          {% endif %}

          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}

          <section class="content cfx formatted">
            {%- assign content_default_title = "content" | lce -%}
            {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
            <div class="intro-content formatted" data-search-indexing-allowed="true">
              {% content title=content_default_title title_tooltip=content_default_title_tooltip %}
            </div>
            {% include "menu-breadcrumbs" %}
            <section class="content-item-boxes">
              {% if site.root_item.selected? %}
                {% for level_1 in site.visible_menuitems_with_data %}
                  {% if level_1.layout_title == product_list_layout or level_1.layout_title == product_layout %}
                    {% include "product-list-item" menu_level: level_1 %}
                  {% endif %}
                {% endfor %}
              {% else %}
                {% include "product-list-loop" %}
              {% endif %}
            </section>
          </section>
        </div>
      </div>

      {% include "footer" %}
    </div>
  </div>

  {% include "mobilemenu" %}
  {% include "javascripts" %}
  {% include "edicy-tools" items_page: true  %}

  <script>site.initItemsPage();</script>
</body>
</html>
