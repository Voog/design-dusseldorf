<!DOCTYPE html>
{% include "template-variables" %}
<html lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}

  {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
</head>
<body class="{% if site.search.enabled %}search-enabled{% endif %}{% if editmode %} editmode{% endif %}">
  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>
    <div class="main">
      <div class="container-wrap cfx">
        <div class="content-full content-top cfx js-content-top">
          <div class="background-color"></div>
          <div class="container js-background-type {{ content_top_bg_type }}">

            {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}

            <div class="inner">
              <nav class="sub-menu tag-list">
                {% if site.has_language_tags? %}
                <ul>
                  {% for tag in site.language_tags %}
                    {% assign activestr = " " %}
                    {% for tmptag in tags %}
                      {% if tmptag.name == tag.name %}
                        {% assign activestr = " class='active'" %}
                      {% endif %}
                    {% endfor %}
                  <li><a href="{{ page.url }}/tagged/{{ tag.path }}"{{activestr}}>{{ tag.name }}</a></li>
                  {% endfor %}
                </ul>
                {% endif %}
              </nav>
            </div>
            <section class="content blog-content inner cfx">
              {% content %}
              {% if editmode %}<div style="padding-top: 20px">{% addbutton %}</div>{% endif %}
            </section>
            <section class="blog-list">
              {% for article in articles %}
                <div class="post-wrap">
                  <div class="inner">
                    <article class="post">
                        <div class="post-title"><a href="{{ article.url }}">{{ article.title }}</a> <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%d.%m" }}</time></div>
                    </article>
                  </div>
                </div>
              {% endfor %}
            </section>
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
      edy.push(['texteditorStyles', {name: 'Button', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
    </script>
  {% endif %}
</body>
</html>
