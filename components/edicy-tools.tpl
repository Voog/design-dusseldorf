{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>

  {% if _isSettingsEditor == true %}
    {% include "settings-editor" %}
  {% endif %}
  
  <script>

    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    {% if items_page %}
      site.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc: editor_locale | escape }}');
      site.bindContentItemImageCropToggle();

      {%if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %};

      site.bindRootItemSettings(rootItemValuesObj);
    {% endif %}

    {% if edicy-tools == "post_page" %}
      // Article pages custom data variable.
      var articleData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });
    {% else %}
      // Article pages custom data variable.
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    {% comment %}/*Initiates language flag toggling functionality.*/{% endcomment %}
    site.toggleFlags();

    $('.js-bg-picker-area .js-background-settings').each(function(index, bgPickerButton) {
          dataBgKey = $(bgPickerButton).data('data-bg-key'),
          defaultImageColor = $(bgPickerButton).data('data-bg-default-image-color');

      var bgPicker = new Edicy.BgPicker(bgPickerButton, {
            picture: true,
            target_width: 600,
            color: true,
            showAlpha: true,

        preview: function(data) {
          site.bgPickerPreview($(bgPickerArea), data, bgPicker, defaultImageColor);
        },

        commit: function(data) {
          site.bgPickerCommit(dataBgKey, data, bgPicker, pageType);
        }
      });
    });
    
    {% unless product_page %}
      {% comment %}/*Front page top content area background picker.*/{% endcomment %}
        var contentHalfTopBg = new Edicy.BgPicker($('.content-top .js-background-settings'), {
            picture: true,
            target_width: 600,
            color: true,
            showAlpha: true,

          preview: function(data) {
            site.contentHalfBgPreview(data, '.js-content-top', contentHalfTopBg);
          },

          commit: function(data) {
            site.contentHalfBgCommit(data, 'content_top_bg');
          }
        });

        {% comment %}/*Front page left content area background picker.*/{% endcomment %}
        var contentHalfLeftBg = new Edicy.BgPicker($('.content-left .js-background-settings'), {
            picture: true,
            target_width: 600,
            color: true,
            showAlpha: true,

          preview: function(data) {
            site.contentHalfBgPreview(data, '.js-content-left', contentHalfLeftBg);
          },

          commit: function(data) {
            site.contentHalfBgCommit(data, 'content_left_bg');
          }
        });

        {% comment %}/*Front page right content area background picker.*/{% endcomment %}
        var contentHalfRightBg = new Edicy.BgPicker($('.content-right .js-background-settings'), {
            picture: true,
            target_width: 600,
            color: true,
            showAlpha: true,

          preview: function(data) {
            site.contentHalfBgPreview(data, '.js-content-right', contentHalfRightBg);
          },

          commit: function(data) {
            site.contentHalfBgCommit(data, 'content_right_bg');
          }
        });

        {% comment %}/*Front page bottom content area background picker.*/{% endcomment %}
        var contentHalfBottomBg = new Edicy.BgPicker($('.content-bottom .js-background-settings'), {
            picture: false,
            target_width: 600,
            color: true,
            showAlpha: false,

          preview: function(data) {
            site.contentHalfBgPreview(data, '.js-content-bottom', contentHalfBottomBg);
          },

          commit: function(data) {
            site.contentHalfBgCommit(data, 'content_bottom_bg');
          }
        });
      {% endunless %}
  </script>
{% endeditorjsblock %}
