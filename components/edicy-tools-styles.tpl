<style>
  {% comment %}/* Body background image */{% endcomment %}
  {% if content_left_bg.imageSizes != nil %}
    {% if content_left_bg.imageSizes == "" %}
      .content-left {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_left_bg.imageSizes %}
        {% if forloop.first %}
          .content-left {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-left {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}
    {% assign bg_image_prefix = images_path | append: "/front-page-left-bg" %}

    .content-left {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 600px) and (max-height: 572px) {
      .content-left {
        background-image: url("{{ bg_image_prefix }}_block.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_left_bg.color %}
    .content-left .background-color {
      background-color: {{ page.data.content_left_bg.color }};
    }
  {% else %}
    .content-left .background-color {
      background-color: {{ content_left_bg_color }};
    }
  {% endif %}

  {% comment %}/* Body background image */{% endcomment %}
  {% if content_right_bg.imageSizes != nil %}
    {% if content_right_bg.imageSizes == "" %}
      .content-right {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_right_bg.imageSizes %}
        {% if forloop.first %}
          .content-right {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-right {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}
    {% assign bg_image_prefix = images_path | append: "/front-page-right-bg" %}

    .content-right {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 600px) and (max-height: 572px) {
      .content-right {
        background-image: url("{{ bg_image_prefix }}_block.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_right_bg.color %}
    .content-right .background-color {
      background-color: {{ page.data.content_right_bg.color }};
    }
  {% else %}
    .content-right .background-color {
      background-color: {{ content_right_bg_color }};
    }
  {% endif %}

  {% comment %}/* Body background image */{% endcomment %}
  {% if content_top_bg.imageSizes != nil %}
    {% if content_top_bg.imageSizes == "" %}
      .content-top {
        background-image: none;
      }
    {% else %}
      {% if post_page %}
        {% for imageSize in article.data.content_top_bg.imageSizes %}
          {% if forloop.first %}
            .content-top {
              background-image: url("{{ imageSize.url }}");
            }
          {% else %}
            @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
              .content-top {
                background-image: url("{{ imageSize.url }}");
              }
            }
          {% endif %}
        {% endfor %}
      {% else %}
        {% if product_page == true %}
          {% assign imageSizes = site.data[product_bg_key].imageSizes %}
        {% else %}
          {% assign imageSizes = page.data.content_top_bg.imageSizes %}
        {% endif %}

        {% for imageSize in imageSizes %}
          {% if forloop.first %}
            .content-top {
              background-image: url("{{ imageSize.url }}");
            }
          {% else %}
            @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
              .content-top {
                background-image: url("{{ imageSize.url }}");
              }
            }
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_top_bg.color %}
    {% if post_page %}
      .content-top .background-color {
        background-color: {{ article.data.content_top_bg.color }};
      }
    {% elsif product_page %}
      .content-top .background-color {
        background-color: {{ site.data[product_bg_key].color }};
      }
    {% else %}
      .content-top .background-color {
        background-color: {{ page.data.content_top_bg.color }};
      }
    {% endif %}
  {% else %}
    .content-top .background-color {
      background-color: {{ content_top_bg_color }};
    }
  {% endif %}

  {% comment %}/* Body background image */{% endcomment %}
  {% if content_bottom_bg.imageSizes != nil %}
    {% if content_bottom_bg.imageSizes == "" %}
      .content-bottom {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.content_bottom_bg.imageSizes %}
        {% if forloop.first %}
          .content-bottom {
            background-image: url("{{ imageSize.url }}");
          }
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) and (max-height: {{ imageSize.height }}px) {
            .content-bottom {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if content_bottom_bg.color %}
    .content-bottom .background-color {
      background-color: {{ page.data.content_bottom_bg.color }};
    }
  {% else %}
    .content-bottom .background-color {
      background-color: {{ content_bottom_bg_color }};
    }
  {% endif %}
</style>
