<!DOCTYPE html>
<html class="{% if editmode %}editmode{% endif %}" lang="{{ page.language_code }}">
<head>
  <link rel="stylesheet" href="/assets/admin/tools/0.1.1/edicy-tools.css">
  {% include "html-head" %}
</head>
<body class="front-page{% if editmode %} editmode{% endif %}">
  <div class="wrap-holder">
    <div class="wrap">
      <aside class="sidebar">
          {% include "sidebar" %}
      </aside>
      <main class="main js-bgpicker-cover-image"{% if page.data.cover_image %} style="background-image: url('{{ page.data.cover_image }}');"{% endif %}>
        <div class="js-bgpicker-cover-color"{% if page.data.cover_color %} style="background-color: {{ page.data.cover_color }};{% if page.data.cover_image %} opacity: 0.5;{% endif %}"{% endif %}></div>
        <div class="container-wrap">
          <a class="js-bgpicker-cover-settings" data-bg-image="{{ page.data.cover_image }}" data-bg-color="{{ page.data.cover_color }}"></a>
          <div class="container">
            <section class="content cfx content-formatted">
              {% content %}
            </section>
          </div>
        </div>
      </main>
      {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "javascripts" %}
  {% include "bgpicker" %}
</body>
</html>
