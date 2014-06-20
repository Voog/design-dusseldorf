<script src="{{ javascripts_path }}/jquery-1.11.0.min.js"></script>
<script src="{{ javascripts_path }}/main.js?10"></script>

{% if site.search.enabled %}
<script src="http://static.voog.com/libs/edicy-search/1.0.0/edicy-search.js"></script>
<script src="{{ javascripts_path }}/search.js"></script>
<script>

  $(function() {
    var search = new VoogSearch($('.js-search-form'), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      noResults: '{{ "search_noresults"|lc }}',
      minChars: 2,
      searchOnType: true
    });
    
    var mobilesearch = new VoogSearch($('.js-mobile-search-form'), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      noResults: '{{ "search_noresults"|lc }}',
      $parent: $('#mobile-search-results'),
      visibleClass: 'voog-mobile-search-visible',
      closeOnSideClick: false
    });
    
    
    $('.mobile-search-toggler').click(function(event) {
        event.preventDefault();
        var $body = $('body');
        if ($body.hasClass('mobilesearch-open')) {
            $body.removeClass('mobilesearch-open');
            mobilesearch.reset();
        }
        else {
            var top = $('.sidebar').height();
            $('#mobile-search').css('top', top + 'px');
            $('body').addClass('mobilesearch-open');
            $('#mobile-search .search-input').get(0).focus();
        }
        
    });
  });
</script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}