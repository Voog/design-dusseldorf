<div class="sidebar-inner">
  <div class="site-title">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% if editmode %}<span class="site-title-editable">{% editable site.header %}</span>{% else %}{{ page.site_header }}{% endif %}{% unless editmode %}</a>{% endunless %}</div>
  {% include "mainmenu" %}
  <a href="#" class="mobile-menu-toggler"><span></span></a>
  {% if site.search.enabled %}
  <a href="#" class="mobile-search-toggler"></a>
  {% endif %}
</div>
