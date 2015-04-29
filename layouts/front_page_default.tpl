<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
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
      <div class="main-inner inner">
        <div class="js-bgpicker-cover-image"{{ cover_image_style }}>
          <div class="js-bgpicker-cover-color {{ cover_color_class }}"{{ cover_color_style }}>
            {% if editmode %}<button class="bgpicker-btn js-bgpicker-cover-settings" data-bg-image="{{ cover_image }}" data-bg-color="{{ cover_color }}"></button>{% endif %}

            <div class="container-wrap cfx">
              <div class="container">
                <section class="content formatted">
                  <div class="tbl">
                    <div class="tbl-row">
                      <div class="tbl-cell">
                        {% content %}
                      </div>
                    </div>
                  </div>
                </section>
              </div>
            </div>
          </div>
        </div>
      </div>
      {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}

  {% if editmode %}
  <script type="text/javascript">
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
  </script>
  {% endif %}
</body>
</html>
