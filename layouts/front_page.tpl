<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" front_page: true %}
  {% include "edicy-tools-styles" %}
</head>
<body class="front-page{% if editmode %} editmode{% endif %}{% if site.search.enabled %} search-enabled{% endif %}">
  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}

    {%- assign content_default_title = "content" | lce -%}
    {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>
    <div class="main">
      <div class="container-wrap cfx">
      <div class="main-inner-row header-row">

        <div class="content-full content-top js-content-top">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_top_bg_type }}">
              <div class="content-inner formatted cfx">{% content title=content_default_title title_tooltip=content_default_title_tooltip %}</div>
            </div>
          </div>
        </div>

      </div>

      <div class="main-inner-row center-row">

        <div class="content-half content-left js-content-left">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_left_bg_image }}" data-bg-image-sizes="{{ content_left_bg_image_sizes_str | escape }}" data-bg-color="{{ content_left_bg_color }}" data-bg-color-data="{{ content_left_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_left_bg_type }}">
              <div class="content-inner formatted cfx"><div class="inner-bottom">{% content name="left" title=content_default_title title_tooltip=content_default_title_tooltip %}</div></div>
            </div>
          </div>
        </div>

        <div class="content-half content-right js-content-right">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_right_bg_image }}" data-bg-image-sizes="{{ content_right_bg_image_sizes_str | escape }}" data-bg-color="{{ content_right_bg_color }}" data-bg-color-data="{{ content_right_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_right_bg_type }}">
              <div class="content-inner formatted cfx"><div class="inner-bottom">{% content name="right" title=content_default_title title_tooltip=content_default_title_tooltip %}</div></div>
            </div>
          </div>
        </div>

      </div>

      <div class="main-inner-row footer-row">

        <div class="content-full content-bottom cfx js-content-bottom">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_bottom_bg_image }}" data-bg-image-sizes="{{ content_bottom_bg_image_sizes_str | escape }}" data-bg-color="{{ content_bottom_bg_color }}" data-bg-color-data="{{ content_bottom_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_bottom_bg_type }}">
              <div class="content-inner formatted cfx">

                {%- assign bottom_content_title = "additional_content" | lce -%}
                {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
                <div class="footer-left">
                  {% content name="footer" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
                </div>
                <div class="footer-right">
                  {% content name="footer_title" title_tooltip=bottom_content_title_tooltip %}
                </div>

              </div>
              {% if site.branding.enabled and page.path == blank %}
                <div class="voog-reference">
                  {% loginblock %}
                    {{ "footer_login_link" | lc }}
                  {% endloginblock %}
                </div>
              {% endif %}
            </div>
          </div>
        </div>

      </div>

    </div>
    {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "site-signout" %}
  {% include "javascripts"  with "front_page"  %}
  {% include "edicy-tools", front_page: true %}

</body>
</html>
