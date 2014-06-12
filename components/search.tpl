{% if site.search.enabled %}
<form class="search js-search-form">
  <div class="search-box">
    <input type="text" class="search-input" placeholder="{{ "search"|lc }}" />
    <a href="#close" class="search-close js-search-close"></a>
  </div>
</form>
{% endif %}