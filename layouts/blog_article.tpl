<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign post_page = true %}
  {% include "edicy-tools-variables" with 'post_page' %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}

  {% if editmode %}<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">{% endif %}
</head>
<body class="{% if site.search.enabled %}search-enabled{% endif %}{% if editmode %} editmode{% endif %} blog-article-page">
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

              <div class="inner">

                {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}

                <nav class="sub-menu tag-list">
                  {% if article.tags.size > 0 %}
                  <ul>
                    {% for tag in article.tags %}
                    <li><a href="{{ page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
                    {% endfor %}
                  </ul>
                  {% endif %}
                </nav>
                <header class="post-header">
                  <h1>{% editable article.title %} <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%d.%m" }}</time></h1>
                </header>
                <section class="post-content">
                  <div class="post-excerpt cfx formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
                  <div class="post-body cfx formatted">{% editable article.body %}</div>

                  {% if editmode %}
                  <div class="post-tags">
                  {% editable article.tags %}
                  </div>
                  {% endif %}
                </section>
                <section class="comments formatted">
                  <h3 class="comment-title">
                    {% case article.comments_count %}
                      {% when 0 %}{{ "write_first_comment" | lc }}
                      {% else %}{{ 'replies' | lcc : article.comments_count }}</span>
                    {% endcase %}
                  </h3>
                  {% include "comment-form" %}
                  {% for comment in article.comments reversed %}
                    <div class="comment edy-site-blog-comment">
                      <div class="comment-body">{{ comment.body_html }}</div>
                      <div class="comment-info">({{ comment.author }}, {{ comment.created_at | format_date: "long" }}) {% removebutton %}</div>
                    </div>
                  {% endfor %}
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
  {% include "edicy-tools" with "post_page" %}

  {% if editmode %}
    <script type="text/javascript">
      window.edy = window.edy || [];
      edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
      edy.push(['texteditorStyles', {name: '{{ "button" | lc: editor_locale }}', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
    </script>
  {% endif %}
</body>
</html>
