<!DOCTYPE html>
{% include "template-variables" %}
{% include "blog-article-variables" %}
{% include "article-settings-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign post_page = true %}
  {% include "edicy-tools-variables" with 'post_page' %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
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
                    <li><a href="/{{ article.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
                    {% endfor %}
                  </ul>
                  {% endif %}
                </nav>
                <header class="post-header">
                  <h1>{% editable article.title %}</h1>
                  {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

                  {% if article_year == current_year %}
                    {% assign article_date_format = "long_without_year" %}
                  {% else %}
                    {% assign article_date_format = "long" %}
                  {% endif %}

                  {% if editmode or show_article_date != false %}
                    <time class="post-date{% if show_article_date == false %} hide-article-date{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
                  {% endif %}
                </header>
                <section class="post-content">
                  <div class="post-excerpt cfx formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
                  <div class="post-body cfx formatted">{% editable article.body %}</div>
                  <div class="post-body cfx formatted">{% content name="additional_body" bind="Article" %}</div>

                  {% if editmode %}
                  <div class="post-tags">
                  {% editable article.tags %}
                  </div>
                  {% endif %}
                </section>

                {% if article.older or article.newer %}
                  <div class="post-nav">
                    <div class="post-nav-inner">
                      {% if article.older %}
                        <a class="post-nav-link post-nav-link-older" href="{{ article.older.url }}">
                          <div class="post-nav-link-inner">
                            <div class="post-nav-direction">{{ "previous" | lc }}</div>
                            <div class="post-nav-title">{{ article.older.title }}</div>
                          </div>
                        </a>
                      {% endif %}

                      {% if article.newer %}
                        <a class="post-nav-link post-nav-link-newer" href="{{ article.newer.url }}">
                          <div class="post-nav-link-inner">
                            <div class="post-nav-direction">{{ "next" | lc }}</div>
                            <div class="post-nav-title">{{ article.newer.title }}</div>
                          </div>
                        </a>
                      {% endif %}
                    </div>
                  </div>
                {% endif %}

                {% if editmode or show_article_comments != false %}
                  <section class="comments formatted{% if show_article_comments == false %} hide-article-comments{% endif %}">
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
                {% endif %}

              </div>

            </div>
          </div>
        </div>
      {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "settings-popover", _articlePage: true %}

</body>
</html>
