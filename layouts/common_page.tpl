<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
</head>
<body{% if editmode %} class="editmode"{% endif %}>
  <div class="wrap">
    <div class="wrap-inner">
      <aside class="sidebar">
        {% include "sidebar" %}
      </aside>
      <main class="main">
        <div class="inner">
          <div class="container">
            {% include "submenu" %}
            <section class="content cfx formatted">
              {% content %}
            </section>
          </div>
        </div>
      </main>
    </div>
    {% include "footer" %}
  </div> 
  {% include "mobilemenu" %}
  {% include "javascripts" %}
</body>
</html>