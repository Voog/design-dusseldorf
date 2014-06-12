<div class="sidebar-inner">
  <div class="site-title">{% if editmode %}<span class="site-title-editable">{% editable site.header %}</span>{% else %}{{ site.header }}{% endif %}</div>
  {% include "mainmenu" %}
  <a href="#" class="mobile-menu-toggler"><span></span></a>
</div>