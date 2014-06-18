{% capture dont_render %}
  <!-- Sets the "front page" cover image and color values -->
  {% if page.data.cover_image == nil %}
    {% assign bg_image = images_path | append: '/images/front.jpg' %}
  {% else %}
    {% assign bg_image = page.data.cover_image %}
  {% endif %}


  <!-- Builds style tag for background image -->
  {% assign bg_image_style = '' %}
  {% unless page.data.cover_image == nil %}
    {% assign bg_image_style = ' style="background-image: ' %}
    {% if page.data.cover_image == '' %}
      {% assign bg_image_style = bg_image_style | append: 'none' %}
    {% else %}
      {% assign bg_image_style = bg_image_style | append: "url('" | append: page.data.cover_image | append: "')" %}
    {% endif %}
    {% assign bg_image_style = bg_image_style | append: ';"' %}
  {% endunless %}

  <!-- Builds style tag for background color -->
  {% assign bg_color_style = "" %}
  {% unless page.data.cover_color_obj == nil %}
    {% assign bg_color_obj = page.data.cover_color_obj %}
    
    {% assign bg_color_style = ' style="background-color: ' %}
    {% if page.data.cover_color == '' %}
      {% assign bg_color_style = bg_color_style | append: 'none' %}
    {% else %}
      
      {% if page.data.cover_image == '' %}
        {% assign bg_color_style = bg_color_style | append: "rgb(" | append: bg_color_obj.r | append: "," | append: bg_color_obj.g | append: "," | append: bg_color_obj.b | append: ")" %}
      {% else %}
        
        
        {% assign bg_color_style = bg_color_style | append: "rgba(" | append: bg_color_obj.r | append: "," | append: bg_color_obj.g | append: "," | append: bg_color_obj.b | append: ",0.5)" %}
        
      {% endif %}
    {% endif %}
    {% assign bg_color_style = bg_color_style | append: ';"' %}
  {% endunless %}
{% endcapture %}