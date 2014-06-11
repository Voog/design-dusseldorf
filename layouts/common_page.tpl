<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
</head>
<body{% if editmode %} class="editmode"{% endif %}>
  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>
    <div class="main">
      <div class="inner">
        <div class="container-wrap cfx">
          <div class="container">
            {% include "submenu" %}
            <section class="content cfx formatted">
              {% content %}
            </section>
          </div>
        </div>
      </div>
      {% include "footer" %}
    </div>
  </div> 
  {% include "mobilemenu" %}
  {% include "javascripts" %}
</body>
</html>