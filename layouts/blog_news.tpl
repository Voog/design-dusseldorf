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
            <section class="content blog-content cfx">
              {% content %}
              {% if editmode %}<div style="padding-top: 20px">{% addbutton %}</div>{% endif %}
            </section>
            <section class="blog-list">
              {% for article in articles %}
                <article class="post">
                  <div class="post-title"><a href="{{ article.url }}">{{ article.title }}</a> <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%d.%m" }}</time></div>
                </article>
              {% endfor %}
            </section>
            
          </div>
        </div>
      </main>
      {% include "footer" %}
    </div> 
  </div>
  
  {% include "mobilemenu" %}
  {% include "javascripts" %}
</body>
</html>