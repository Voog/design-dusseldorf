{% capture dont_render %}
  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_left_bg = page.data.content_left_bg %}
  {% assign content_left_bg_image = page.data.content_left_bg.image %}
  {% assign content_left_bg_image_sizes = page.data.content_left_bg.imageSizes %}
  {% assign content_left_bg_color = page.data.content_left_bg.color %}
  {% assign content_left_bg_color_data = page.data.content_left_bg.colorData %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if content_left_bg %}
    {% if content_left_bg_color_data.a >= 0.2 %}
      {% if content_left_bg_color_data.lightness >= 0.5 %}
        {% assign content_left_bg_type = 'light-background' %}
      {% else %}
        {% assign content_left_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign content_left_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign content_left_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_left_bg_image == nil %}
    {% assign content_left_bg_image_original = images_path | append: '/front-page-left-bg.jpg' %}
    {% assign content_left_bg_image = images_path | append: '/front-page-left-bg_block.jpg' %}
  {% endif %}

  {% if content_left_bg_image_sizes == nil %}
    {% assign content_left_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-left-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-page-left-bg_block.jpg", "width":600, "height":572}]' %}
  {% else %}
    {% assign content_left_bg_image_sizes_str = content_left_bg_image_sizes | json %}
  {% endif %}

  {% if content_left_bg_color == nil %}
    {% assign content_left_bg_color = 'rgba(249,205,0,0.1)' %}
  {% endif %}

  {% if content_left_bg_color_data == nil %}
    {% assign content_left_bg_color_data_str = '{"r": 249, "g": 205, "b": 0, "a": 0.1, "lightness": 0.78}' %}
  {% else %}
    {% assign content_left_bg_color_data_str = content_left_bg_color_data | json %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_right_bg = page.data.content_right_bg %}
  {% assign content_right_bg_image = page.data.content_right_bg.image %}
  {% assign content_right_bg_image_sizes = page.data.content_right_bg.imageSizes %}
  {% assign content_right_bg_color = page.data.content_right_bg.color %}
  {% assign content_right_bg_color_data = page.data.content_right_bg.colorData %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if content_right_bg %}
    {% if content_right_bg_color_data.a >= 0.2 %}
      {% if content_right_bg_color_data.lightness >= 0.5 %}
        {% assign content_right_bg_type = 'light-background' %}
      {% else %}
        {% assign content_right_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign content_right_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign content_right_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_right_bg_image == nil %}
    {% assign content_right_bg_image_original = images_path | append: '/front-page-right-bg.jpg' %}
    {% assign content_right_bg_image = images_path | append: '/front-page-right-bg_block.jpg' %}
  {% endif %}

  {% if content_right_bg_image_sizes == nil %}
    {% assign content_right_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-right-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-page-right-bg_block.jpg", "width":600, "height":572}]' %}
  {% else %}
    {% assign content_right_bg_image_sizes_str = content_right_bg_image_sizes | json %}
  {% endif %}

  {% if content_right_bg_color == nil %}
    {% assign content_right_bg_color = 'rgba(249,205,0,0.1)' %}
  {% endif %}

  {% if content_right_bg_color_data == nil %}
    {% assign content_right_bg_color_data_str = '{"r": 249, "g": 205, "b": 0, "a": 0.1, "lightness": 0.78}' %}
  {% else %}
    {% assign content_right_bg_color_data_str = content_right_bg_color_data | json %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_top_bg = page.data.content_top_bg %}
  {% assign content_top_bg_image = page.data.content_top_bg.image %}
  {% assign content_top_bg_image_sizes = page.data.content_top_bg.imageSizes %}
  {% assign content_top_bg_color = page.data.content_top_bg.color %}
  {% assign content_top_bg_color_data = page.data.content_top_bg.colorData %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if content_top_bg %}
    {% if content_top_bg_color_data.a >= 0.2 %}
      {% if content_top_bg_color_data.lightness >= 0.5 %}
        {% assign content_top_bg_type = 'light-background' %}
      {% else %}
        {% assign content_top_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign content_top_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign content_top_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_top_bg_image == nil %}
    {% assign content_top_bg_image_original = images_path | append: '/front-page-top-bg.jpg' %}
    {% assign content_top_bg_image = images_path | append: '/front-page-top-bg_block.jpg' %}
  {% endif %}

  {% if content_top_bg_image_sizes == nil %}
    {% assign content_top_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-top-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-page-top-bg_block.jpg", "width":600, "height":572}]' %}
  {% else %}
    {% assign content_top_bg_image_sizes_str = content_top_bg_image_sizes | json %}
  {% endif %}

  {% if content_top_bg_color == nil %}
    {% assign content_top_bg_color = '#a8f4ff' %}
  {% endif %}

  {% if content_top_bg_color_data == nil %}
    {% assign content_top_bg_color_data_str = '{"r": 249, "g": 205, "b": 0, "a": 0.1, "lightness": 0.78}' %}
  {% else %}
    {% assign content_top_bg_color_data_str = content_top_bg_color_data | json %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign content_bottom_bg = page.data.content_bottom_bg %}
  {% assign content_bottom_bg_image = page.data.content_bottom_bg.image %}
  {% assign content_bottom_bg_image_sizes = page.data.content_bottom_bg.imageSizes %}
  {% assign content_bottom_bg_color = page.data.content_bottom_bg.color %}
  {% assign content_bottom_bg_color_data = page.data.content_bottom_bg.colorData %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if content_bottom_bg %}
    {% if content_bottom_bg_color_data.a >= 0.2 %}
      {% if content_bottom_bg_color_data.lightness >= 0.5 %}
        {% assign content_bottom_bg_type = 'light-background' %}
      {% else %}
        {% assign content_bottom_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% assign content_bottom_bg_type = 'light-background' %}
    {% endif %}
  {% else %}
    {% assign content_bottom_bg_type = 'dark-background' %}
  {% endif %}

  {% if content_bottom_bg_image == nil %}
    {% assign content_bottom_bg_image_original = images_path | append: '/front-page-bottom-bg.jpg' %}
    {% assign content_bottom_bg_image = images_path | append: '/front-page-bottom-bg_block.jpg' %}
  {% endif %}

  {% if content_bottom_bg_image_sizes == nil %}
    {% assign content_bottom_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-bottom-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-page-bottom-bg_block.jpg", "width":600, "height":572}]' %}
  {% else %}
    {% assign content_bottom_bg_image_sizes_str = content_bottom_bg_image_sizes | json %}
  {% endif %}

  {% if content_bottom_bg_color == nil %}
    {% assign content_bottom_bg_color = '#a8f4ff' %}
  {% endif %}

  {% if content_bottom_bg_color_data == nil %}
    {% assign content_bottom_bg_color_data_str = '{"r": 249, "g": 205, "b": 0, "a": 0.1, "lightness": 0.78}' %}
  {% else %}
    {% assign content_bottom_bg_color_data_str = content_bottom_bg_color_data | json %}
  {% endif %}
{% endcapture %}
