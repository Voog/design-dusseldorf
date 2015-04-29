{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // Front page cover image and color data preview and save logic
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    // contentHalf background image and color preview logic function.
    var contentHalfBgPreview = function(data, contentHalf) {
      // Returns the suitable version of the image depending on the viewport width.
      var getImageByWidth = function(sizes, targetWidth) {
        var prevImage;

        for (var i = 0, max = sizes.length; i < max; i++) {
          if (sizes[i].width < targetWidth) {
            return prevImage || sizes[i];
          }
          prevImage = sizes[i];
        }
        // Makes sure that smallest is returned if all images bigger than targetWidth.
        return sizes[sizes.length - 1];
      };

      // Defines the suitable image based on the viewport width.
      var suitableImage = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : 'none';

      var contentHalfBgImage = (data.image && data.image !== '') ? 'url(' + suitableImage.url + ')' : 'none',
          contentHalfBgColor = (data.color && data.color !== '') ? data.color : 'transparent',
          contentHalfBgColorOpacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
          contentHalfBgColorLightness = (data.colorData && data.colorData !== '' && data.colorData.lightness) ? data.colorData.lightness : 'none';

      // Removes the current lightness class.
      $(contentHalf).find('.js-background-type').removeClass('light-background dark-background');
      // Checks the opacity of the contentHalf background color and sets the lightness class depending on it's value.
      if (contentHalfBgColorOpacity >= 0.2) {
        $(contentHalf).find('.js-background-type').addClass(contentHalfBgColorLightness >= 0.5 ? 'light-background' : 'dark-background');
      } else {
        $(contentHalf).find('.js-background-type').addClass('light-background');
      };

      // Updates the contentHalf background image and background color.
      $(contentHalf).css({'background-image' : contentHalfBgImage});
      $(contentHalf).find('.background-color').css({'background-color' : contentHalfBgColor});
    };

    // contentHalf background image and color save logic function.
    var contentHalfBgCommit = function(data, dataName) {
      var commitData = $.extend(true, {}, data);
      commitData.image = data.image || '';
      commitData.imageSizes = data.imageSizes || '';
      commitData.color = data.color || 'transparent';
      pageData.set(dataName, commitData);
    }

    // Front page left content area background picker.
    var contentHalfLeftBg = new Edicy.BgPicker($('.content-left .js-background-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        contentHalfBgPreview(data, '.js-content-left');
      },

      commit: function(data) {
        contentHalfBgCommit(data, 'content_left_bg');
      }
    });

    // Front page right content area background picker.
    var contentHalfRightBg = new Edicy.BgPicker($('.content-right .js-background-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        contentHalfBgPreview(data, '.js-content-right');
      },

      commit: function(data) {
        contentHalfBgCommit(data, 'content_right_bg');
      }
    });

    // Front page top content area background picker.
    var contentHalfTopBg = new Edicy.BgPicker($('.content-top .js-background-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        contentHalfBgPreview(data, '.js-content-top');
      },

      commit: function(data) {
        contentHalfBgCommit(data, 'content_top_bg');
      }
    });

    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      siteData.set("flags_state", flagsState);

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang-wrap').toggleClass('flags-enabled flags-disabled');
    });

  </script>
{% endeditorjsblock %}
