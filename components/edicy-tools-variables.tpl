{% capture dont_render %}
  <!-- Sets cover color lightness class -->
  {% if page.data.cover_lightness == nil or page.data.cover_lightness <= 0.5 %}
    {% assign cover_color_class = 'dark-background' %}
  {% else %}
    {% assign cover_color_class = 'light-background' %}
  {% endif %}

  <!-- Sets the "front page" cover image and color values -->
  {% if page.data.cover_image == nil %}
    {% assign cover_image = images_path | append: '/front.jpg' %}
  {% else %}
    {% assign cover_image = page.data.cover_image %}
  {% endif %}

  {% if page.data.cover_color == nil %}
    {% assign cover_color = 'rgba(0,0,0,0.2)' %}
  {% else %}
    {% assign cover_color = page.data.cover_color %}
  {% endif %}

  {% comment %}Builds style tag for the header background image.{% endcomment %}
  {% assign cover_image_style = ' style="background-image: ' %}
  {% if cover_image == '' %}
    {% assign cover_image_style = cover_image_style | append: 'none' %}
  {% else %}
    {% assign cover_image_style = cover_image_style | append: "url('" | append: cover_image | append: "')" %}
  {% endif %}
  {% assign cover_image_style = cover_image_style | append: ';"' %}

  {% comment %}Builds style tag for the header background color.{% endcomment %}
  {% assign cover_color_style = ' style="background-color: ' %}
  {% if cover_color == '' %}
    {% assign cover_color_style = cover_color_style | append: 'transparent' %}
  {% else %}
    {% assign cover_color_style = cover_color_style | append: cover_color %}
  {% endif %}
  {% assign cover_color_style = cover_color_style | append: ';"' %}
{% endcapture %}
