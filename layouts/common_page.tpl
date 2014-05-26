<!DOCTYPE html>
<html class="{% if editmode %}editmode{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
</head>
<body{% if editmode %} class="editmode"{% endif %}>
  <div class="wrap-holder">
    <div class="wrap">
      <aside class="sidebar">
          {% include "sidebar" %}
      </aside>
      <main class="main">
        <div class="container-wrap">
          <div class="container">
            {% include "submenu" %}
            <section class="content cfx content-formatted">
              {% content %}
            </section>
          </div>
        </div>
      </main>
      {% include "footer" %}
    </div> 
  </div> <!-- //wrap-holder -->
  
  {% include "mobilemenu" %}
  {% include "javascripts" %}
</body>
</html>