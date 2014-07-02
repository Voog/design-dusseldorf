<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
</head>
<body class="{% if site.search.enabled %}search-enabled{% endif %}{% if editmode %} editmode{% endif %}">
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
              {% contentblock name="content_header" %}<h1>{{ page.title }}</h1>{% endcontentblock %}
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