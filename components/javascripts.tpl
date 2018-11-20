<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery_lazyload/1.9.7/jquery.lazyload.min.js" integrity="sha256-gDUQmMJHiRi7gACNeDZJkwW/b01LKr90K4gjJVu7DY4=" crossorigin="anonymous"></script>
<script src="{{ javascripts_path }}/application.min.js?v=1"></script>
{% sitejs_include %}

{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script src="{{ javascripts_path }}/search.min.js"></script>
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
            $body.removeClass('edy-checkout-button-visible');

            mobilesearch.reset();

            if ($('.edy-ecommerce-shopping-cart-button').length > 0) {
              $body.addClass('edy-checkout-button-visible');
              $('.edy-ecommerce-shopping-cart-button').show();
            }
          } else {
            var top = $('.sidebar').height();

            $('#mobile-search').css('top', top + 'px');
            $('body').addClass('mobilesearch-open');
            $('#mobile-search .search-input').get(0).focus();

            $('.edy-ecommerce-shopping-cart-button').hide();
          }
      });
    });
  </script>
{% endif %}

{% if editmode %}
  <script type="text/javascript">
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: 'Small', classname: 'font-size-small'}]);
    edy.push(['texteditorStyles', {name: '{{ "button" | lc: editor_locale | escape }}', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  </script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}
