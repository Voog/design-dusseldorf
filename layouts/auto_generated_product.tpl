<!DOCTYPE html>
{% include "template-variables" %}

{%- if product.image == blank -%}
  {%- assign product_image_state = "without-image" -%}
{%- else -%}
  {%- assign product_image_state = "with-image" -%}
{%- endif -%}

<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "edicy-tools-variables" %}
  {% include "html-head" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="item-page {% if site.search.enabled %}search-enabled{% endif %}{% if editmode %} editmode{% endif %}">

  {%- capture bottom_content_html -%}
    {%- unless editmode -%}
      {%- content bind=product name="content" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign bottom_content_size = bottom_content_html | strip | size -%}

  {%- capture gallery_content_html -%}
    {%- unless editmode -%}
      {%- content bind=product name="gallery" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign gallery_content_size = gallery_content_html | strip | size -%}

  {% include "template-svg-spritesheet" %}

  <div class="wrap cfx">
    {% include "langmenu" %}
    {% include "topbar" %}
    <aside class="sidebar">
      {% include "sidebar" %}
    </aside>

    <div class="main">
      <div class="content-full content-top cfx js-content-top">
        <div class="background-color"></div>
        <div class="container js-background-type {{ content_top_bg_type }}">
          <div class="product-page-top"></div>
          {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" data-bg-image="{{ content_top_bg_image }}" data-bg-image-sizes="{{ content_top_bg_image_sizes_str | escape }}" data-bg-color="{{ content_top_bg_color }}" data-bg-color-data="{{ content_top_bg_color_data_str | escape }}"></button>{% endif %}

          <section class="content cfx">
            <main class="page-content product-content" role="main">
              <div class="items-body">
                <div class="content-illustrations">
                  <div class="content-item-box {{ product_image_state }}">
                    <div class="item-top">
                      {%- if product.image != blank -%}
                        <div class="top-inner aspect-ratio-inner">
                          {%- assign image_class = "item-image not-cropped" -%}
                          {% image product.image target_width: "1280" class: image_class loading: "lazy" %}
                        </div>
                      {% endif %}
                    </div>
                  </div>

                  {% if gallery_content_size > 0 or editmode %}
                    <div class="formatted" data-search-indexing-allowed="true">
                      {% content bind=product name="gallery" %}
                    </div>
                  {% endif %}
                </div>

                <div class="content-body">
                  <header class="content-header">
                    <div class="formatted content-item-title" data-search-indexing-allowed="true">
                      <h1>{%- editable product.name -%}</h1>
                    </div>
                  </header>

                  <div class="product-price">
                    {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                      {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                      <span class="product-price-divider">–</span>
                    {%- endif -%}
                    {{ product.price_max_with_tax | money_with_currency: product.currency -}}
                  </div>

                  <div class="formatted area-normal" data-search-indexing-allowed="true">
                    {%- if editmode or product.description != blank -%}
                      <div class="content-product-description">
                        {%- editable product.description -%}
                      </div>
                    {%- endif -%}

                    {% content bind=product %}
                    {% include "buy-button" %}
                  </div>
                </div>
              </div>
              {%- if bottom_content_size > 0 or editmode -%}
                <section
                  class="content-product-wide content-area"
                  data-search-indexing-allowed="true">
                  {% content bind=product name="content" %}
                </section>
              {%- endif -%}
            </main>
          </section>
        </div>
      </div>

      {% include "footer" %}
    </div>
  </div>
  {% include "mobilemenu" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}

</body>
</html>
