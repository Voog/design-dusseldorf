<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}

  {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
</head>
<body class="front-page{% if editmode %} editmode{% endif %}{% if site.search.enabled %} search-enabled{% endif %}">
  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>
    <div class="main">
      <div class="container-wrap cfx">
      <div class="main-inner-row header-row">

        <div class="content-full content-top  js-content-top">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_top_bg_type }}">
              <div class="content-inner formatted cfx">{% content name="top" %}</div>
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
              <div class="content-inner formatted cfx">{% content name="left" %}</div>
            </div>
          </div>
        </div>

        <div class="content-half content-right js-content-right">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_right_bg_image }}" data-bg-image-sizes="{{ content_right_bg_image_sizes_str | escape }}" data-bg-color="{{ content_right_bg_color }}" data-bg-color-data="{{ content_right_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_right_bg_type }}">
              <div class="content-inner formatted cfx">{% content name="right" %}</div>
            </div>
          </div>
        </div>

      </div>

      <div class="main-inner-row footer-row">

        <div class="content-full content-bottom  js-content-bottom">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_bottom_bg_image }}" data-bg-image-sizes="{{ content_bottom_bg_image_sizes_str | escape }}" data-bg-color="{{ content_bottom_bg_color }}" data-bg-color-data="{{ content_bottom_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_bottom_bg_type }}">
              <div class="content-inner formatted cfx">{% xcontent name="footer" %}</div>
            </div>
          </div>
        </div>

      </div>
      {% include "footer-front" %}
    </div>
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "javascripts"  with "front_page"  %}
  {% include "edicy-tools" %}
  {% if editmode %}
  <script type="text/javascript">
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
  </script>
  {% endif %}

  {% if editmode %}
   <script type="text/javascript">
     window.edy = window.edy || [];
     edy.push(['texteditorStyles',
       {name: 'Nupp', tagname:"a", classname: 'custom-btn', toggle: true}
     ]);
   </script>
 {% endif %}


</body>
</html>
