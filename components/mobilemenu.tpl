<div id="mobile-menu">
  <a href="#" class="mobile-menu-close"></a>
  {% if editmode or site.has_many_languages? %}
    <!-- a href="#" class="">keel</a -->
    <a href="#" role="button" class="language-menu-btn"><span class="lang-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}lang-flag-{{ language.code }}{% endif %}{% endfor %}"></span></a>
  {% endif %}
  
  
  {% if editmode or site.has_many_languages? %}
  <div class="language-menu">
    <ul>
    {% for language in site.languages %}
    <li><a class="{% if language.selected? %} active{% endif %}" href="{{ language.url }}">{{ language.title }}</a></li>
    {% endfor %}
    </ul>
  </div>
  {% endif %}
  
  
  <div class="navigation-menu">
    <ul>
      {% unless site.root_item.hidden? %}
        <li><a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>
      {% endunless %}
      {% for item in site.visible_menuitems %}
        <li><a href="{{ item.url }}" {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd untranslated"{% endunless %}>{{ item.title }}</a></li>
      {% endfor %}
    </ul>
  </div>
</div>