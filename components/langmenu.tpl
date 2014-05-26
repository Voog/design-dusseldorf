{% if editmode or site.has_many_languages? %}
<nav class="lang-menu js-popup-menu">
  <span role="button" class="lang-menu-btn js-popup-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}">Choose language</span>
<div class="lang-menu-popover js-popup-menu-popover">
{% if editmode or site.has_many_languages? %}
<ul class="menu">
{% for language in site.languages %}
<li><a class="lang-flag lang-flag-{{ language.code }}{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a></li>
{% endfor %}
{% if editmode %}<li class="add-lang-btn">{% languageadd %}</li>{% endif %}
</ul>
{% endif %}
</div>
</nav>
{% endif %}