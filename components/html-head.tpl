{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}BASIC META INFO{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

{% comment %}FAV ICON{% endcomment %}
{% if site.has_favicon? %}
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% endif %}
{% comment %}TODO: Add functionality after the CMS is going to support it{% endcomment %}
{% if site.data.touch_icon %}<link rel="apple-touch-icon" href="{{ site.data.touch_icon }}">{% endif %}

{% comment %}STYLESHEETS{% endcomment %}
{% if editmode %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
{% endif %}
<link href="{{ stylesheets_path }}/main.min.css?v={{ template_settings.version }}" media="screen" rel="stylesheet" type="text/css"/>

{% customstyle %}
  {% include "template-cs-main-styles" %}
  {% include "template-cs-sidebar" %}
  {% include "template-cs-content" %}
  {% if front_page %}
    {% include "template-cs-footer" %}
  {% elsif product_page %}
    {% include "template-cs-product" %}
  {% endif %}
  {% include "template-cs-headings" %}
  {% include "template-cs-table" %}
  {% include "template-cs-button" %}
  {% include "template-cs-style-rules" %}
  {% comment %}
  {% endcomment %}
{% endcustomstyle %}

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}
<script src="{{ javascripts_path }}/modernizr-custom.min.js"></script>

{% comment %}SITE TITLE{% endcomment %}
<title>{% title %}</title>

{% include "template-meta" %}

{% comment %}BREADCRUMBS{% endcomment %}
{%- capture breadcrumbsScript -%}
  {%- sd_breadcrumbs -%}
{%- endcapture -%}

{{ breadcrumbsScript }}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
