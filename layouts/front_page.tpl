<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" front_page: true %}
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

        <div class="content-full content-top js-content-top">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_top_bg_type }}">
              <div class="content-inner formatted cfx" {{ edy_intro_edit_text }}>{% content %}</div>
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
              <div class="content-inner formatted cfx"><div class="inner-bottom">{% content name="left" %}</div></div>
            </div>
          </div>
        </div>

        <div class="content-half content-right js-content-right">
          <div class="background-color"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_right_bg_image }}" data-bg-image-sizes="{{ content_right_bg_image_sizes_str | escape }}" data-bg-color="{{ content_right_bg_color }}" data-bg-color-data="{{ content_right_bg_color_data_str | escape }}"></button>{% endif %}
          <div class="inner-padding">
            <div class="align-middle js-background-type {{ content_right_bg_type }}">
              <div class="content-inner formatted cfx"><div class="inner-bottom">{% content name="right" %}</div></div>
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

                <div class="footer-left">
                  {% content name="footer" %}
                </div>
                <div class="footer-right">
                  {% content name="footer_title" %}
                </div>

              </div>
              {% if site.branding.enabled %}
                <div class="voog-reference">
                  {% loginblock %}
                    <svg xmlns="http://www.w3.org/2000/svg" height="10px" width="36px" viewbox="0 0 36 8">
                      <path d="M35.002,3.999 C35.002,3.999 35.002,3.999 35.002,3.999 C35.002,4.036 34.997,4.073 34.996,4.109 C34.988,4.362 34.956,4.608 34.904,4.847 C34.904,4.847 34.894,4.847 34.894,4.847 C34.485,6.648 32.802,7.999 30.785,7.999 C29.624,7.999 28.572,7.551 27.811,6.827 C27.811,6.827 27.818,6.821 27.818,6.821 C27.812,6.816 27.806,6.81 27.8,6.805 C27.052,6.083 26.59,5.093 26.59,3.999 C26.59,1.79 28.473,0 30.796,0 C31.957,0 33.009,0.447 33.77,1.171 C33.77,1.171 33.022,1.883 33.022,1.883 C32.452,1.341 31.665,1.006 30.796,1.006 C29.057,1.006 27.648,2.346 27.648,3.999 C27.648,4.701 27.904,5.346 28.33,5.856 C28.405,5.947 28.488,6.031 28.574,6.112 C28.574,6.112 28.565,6.121 28.565,6.121 C29.134,6.66 29.918,6.993 30.785,6.993 C32.343,6.993 33.633,5.915 33.885,4.503 C33.885,4.503 30.769,4.503 30.769,4.503 C30.769,4.503 30.769,3.496 30.769,3.496 C30.769,3.496 33.896,3.496 33.896,3.496 C33.896,3.496 34.593,3.496 34.593,3.496 C34.593,3.496 34.965,3.496 34.965,3.496 C34.987,3.661 35.002,3.828 35.002,3.999 ZM12.922,0 C12.922,0 12.922,1.006 12.922,1.006 C14.66,1.006 16.069,2.346 16.069,3.999 C16.069,5.653 14.66,6.993 12.922,6.993 C11.183,6.993 9.773,5.653 9.773,3.999 C9.773,3.999 8.715,3.999 8.715,3.999 C8.715,6.208 10.599,7.999 12.922,7.999 C15.244,7.999 17.127,6.208 17.127,3.999 C17.127,1.791 15.244,0 12.922,0 ZM7.613,2.355 C7.613,2.355 5.596,6.403 5.596,6.403 C5.433,6.737 5.139,6.98 4.884,6.988 C4.884,6.988 4.844,6.988 4.844,6.988 C4.596,6.983 4.299,6.738 4.136,6.403 C4.136,6.403 1.167,0.286 1.167,0.286 C1.167,0.286 0,0.286 0,0.286 C0,0.286 3.175,6.825 3.175,6.825 C3.531,7.557 4.158,7.994 4.852,7.994 C4.852,7.994 4.879,7.994 4.879,7.994 C5.574,7.994 6.2,7.557 6.556,6.825 C6.556,6.825 8.562,2.801 8.562,2.801 C8.562,2.801 8.562,2.801 8.562,2.801 C9.048,1.744 10.157,1.006 11.448,1.006 C11.448,1.006 11.448,0 11.448,0 C9.741,0 8.272,0.966 7.613,2.355 ZM1.961,0.327 C1.961,0.327 2.051,0.327 2.051,0.327 C2.051,0.327 2.051,0.557 2.051,0.557 C2.051,0.557 2.101,0.557 2.101,0.557 C2.101,0.557 2.101,0.327 2.101,0.327 C2.101,0.327 2.191,0.327 2.191,0.327 C2.191,0.327 2.191,0.286 2.191,0.286 C2.191,0.286 1.961,0.286 1.961,0.286 C1.961,0.286 1.961,0.327 1.961,0.327 ZM2.224,0.557 C2.224,0.557 2.271,0.557 2.271,0.557 C2.271,0.557 2.271,0.348 2.271,0.348 C2.271,0.348 2.272,0.348 2.272,0.348 C2.272,0.348 2.351,0.557 2.351,0.557 C2.351,0.557 2.392,0.557 2.392,0.557 C2.392,0.557 2.471,0.348 2.471,0.348 C2.471,0.348 2.471,0.348 2.471,0.348 C2.471,0.348 2.471,0.557 2.471,0.557 C2.471,0.557 2.519,0.557 2.519,0.557 C2.519,0.557 2.519,0.286 2.519,0.286 C2.519,0.286 2.449,0.286 2.449,0.286 C2.449,0.286 2.373,0.498 2.373,0.498 C2.373,0.498 2.372,0.498 2.372,0.498 C2.372,0.498 2.294,0.286 2.294,0.286 C2.294,0.286 2.224,0.286 2.224,0.286 C2.224,0.286 2.224,0.557 2.224,0.557 ZM21.844,0 C19.521,0 17.638,1.79 17.638,3.999 C17.638,6.208 19.521,7.999 21.844,7.999 C24.166,7.999 26.049,6.208 26.049,3.999 C26.049,1.79 24.166,0 21.844,0 ZM21.844,6.983 C20.111,6.983 18.706,5.647 18.706,3.999 C18.706,2.352 20.111,1.016 21.844,1.016 C23.576,1.016 24.981,2.352 24.981,3.999 C24.981,5.647 23.576,6.983 21.844,6.983 Z "/>
                    </svg>
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
  {% include "javascripts"  with "front_page"  %}
  {% include "edicy-tools" %}

  {% if editmode %}
    <script type="text/javascript">
      window.edy = window.edy || [];
      edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
      edy.push(['texteditorStyles', {name: '{{ "button" | lc: editor_locale | escape }}', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
    </script>
  {% endif %}

</body>
</html>
