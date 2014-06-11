<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  <link rel="stylesheet" href="/assets/admin/tools/0.1.1/edicy-tools.css">
  {% include "html-head" %}
  {% include "bg-picker-variables" %}
</head>
<body class="front-page{% if editmode %} editmode{% endif %}">
  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>
    <div class="main">
      <div class="main-inner inner js-bgpicker-cover-image"{{ bg_image_style }}>
        <div class="js-bgpicker-cover-color"{{ bg_color_style }}>
          {% if editmode %}<button class="bgpicker-btn js-bgpicker-cover-settings" data-bg-image="{{ bg_image }}" data-bg-color="{{ bg_color }}"></button>{% endif %}
          
          <div class="container-wrap cfx">
            <div class="container">
              <section class="content formatted">
                {% content %}
              </section>
            </div>
          </div>
        </div>
      </div>
      {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "javascripts" %}
  {% include "bgpicker" %}
</body>
</html>