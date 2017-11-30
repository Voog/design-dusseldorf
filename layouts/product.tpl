<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
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

              <div class="inner">

                {% include "submenu" %}
                {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}

                <section class="content cfx formatted" {{ edy_intro_edit_text }}>
                  <div class="items-body">
                    <div class="content-illustrations">
                      {% if editmode %}
                        <div class="content-item-box {{ page_image_state }} js-content-item-box" data-item-type="page" data-item-id="{{ page.page_id }}">
                          <div class="item-top">
                            <button class="btn bg-crop-btn {% if page_image_orientation == "image-square" or page.image == nil %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
                              <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
                                <use xlink:href="#ico-toggle"></use>
                              </svg>
                            </button>

                            <div class="loader js-loader"></div>
                            <div class="top-inner aspect-ratio-inner image-drop-area {{ page_image_orientation }} {{ page_image_crop_state }} js-content-item-img-drop-area" data-image="{{ page.image.for-width-680.schemeless_url }}"></div>
                          </div>
                        </div>
                      {% else %}
                        {% if page.image %}
                          <div class="content-item-box {{ page_image_state }} js-content-item-box" href="{{ page.url }}">
                            <div class="item-top">
                              <div class="top-inner aspect-ratio-inner">
                                {% if page.image %}
                                  <div class="loader js-loader"></div>
                                  <img class="item-image {{ page_image_orientation }} {{ page_image_crop_state }} js-lazyload" data-original="{{ page.image.for-width-680.schemeless_url }}">
                                {% else %}
                                  <div class="item-placeholder">{{ page.title | truncate: 50 }}</div>
                                {% endif %}
                              </div>
                            </div>
                          </div>
                        {% endif %}
                      {% endif %}

                      <div class="content-gallery content-area">{% content name="gallery" %}</div>
                    </div>

                    <div class="content-body">
                      <header class="content-header">
                        <div class="content-item-title content-area">{% contentblock name="content_header_test" publish_default_content="true" %}<h1>{{ page.title }}</h1>{% endcontentblock %}</div>
                      </header>

                      <div class="content-area area-normal" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>{% contentblock %}{{ "write_product_description_here" | lc }}{% endcontentblock %}</div>
                    </div>
                  </div>
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
  {% include "edicy-tools" %}

  {% if editmode %}
    <script type="text/javascript">
      window.edy = window.edy || [];
      edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
      edy.push(['texteditorStyles', {name: '{{ "button" | lc: editor_locale }}', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
    </script>
  {% endif %}
</body>
</html>