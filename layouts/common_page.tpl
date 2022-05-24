<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>
<body class="{% if site.search.enabled %}search-enabled{% endif %}{% if editmode %} editmode{% endif %}">
  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>
    <div class="main">

        <div class="container-wrap cfx">
          <div class="content-full content-top cfx js-content-top">
            <div class="background-color"></div>
            <div class="container js-background-type {{ content_top_bg_type }}">

              <div class="inner">
                {% include "submenu" exclude_products: true %}
                {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}

                <section class="content cfx formatted">
                  {%- assign page_title_content_title = "title" | lce -%}
                  {%- assign page_title_content_title_tooltip = "content_tooltip_current_page_title" | lce -%}
                  {% contentblock name="content_header" publish_default_content="true" title=page_title_content_title title_tooltip=page_title_content_title_tooltip %}
                    <h1>{{ page.title }}</h1>
                  {% endcontentblock %}

                  {%- assign content_default_title = "content" | lce -%}
                  {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
                  {% content title=content_default_title title_tooltip=content_default_title_tooltip %}
                </section>

              </div>

            </div>
          </div>
        </div>

      {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}

</body>
</html>
