;
(function ($) {

  $(function () {
    // Function to limit the rate at which a function can fire.
    var debounce = function (func, wait, immediate) {
      var timeout;
      return function () {
        var context = this,
          args = arguments;
        var later = function () {
          timeout = null;
          if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
      };
    };

    $('.js-popup-menu').jsPopupMenu();

    if ($('html').hasClass('no-placeholder')) {
      $('input[type="text"],textarea').each(function () {
        if ($(this).attr('placeholder') && !$(this).val()) {
          $(this).val($(this).attr('placeholder'));
        }
        $(this).focus(function () {
          if ($(this).val() == $(this).attr('placeholder')) {
            $(this).val('');
          }
        }).blur(function () {
          if (!$(this).val() && $(this).attr('placeholder')) {
            $(this).val($(this).attr('placeholder'));
          }
        });
      });
    }

    $('.form_fields:not(.edy-fe-fields) select, .custom-select').jqSelect();

    $('body table').each(function () {
      $(this).wrap('<div class="table-holder" />');
    });

    $('.mobile-menu-toggler').click(function (event) {
      event.preventDefault();
      $('body').toggleClass('mobilemenu-open');
      $('body').removeClass('mobilesearch-open');

      $('.edy-ecommerce-shopping-cart-button').hide();
    });

    $('.mobile-menu-close').on('click', function (event) {
      event.preventDefault();

      if ($('body').hasClass('language-menu-open')) {
        $('body').removeClass('language-menu-open');
      } else {
        $('body').removeClass('mobilemenu-open');
      }

      if ($('.edy-ecommerce-shopping-cart-button').length > 0) {
        $('body').addClass('edy-checkout-button-visible');
        $('.edy-ecommerce-shopping-cart-button').show();
      }
    });

    $('.language-menu-btn').on('click', function (event) {
      event.preventDefault();
      $('body').addClass('language-menu-open');
    });

    $('.comment-form-focus-input').focus(function () {
      var $el = $(this).hide();
      $(this).closest('.comment-form').find('.form_area').show().find('textarea').focus();
      setCommonContent();
    });

    if ($('body').hasClass('front-page')) {
      setFrontContent();
      $(window).resize(debounce(setFrontContent, 100));
    }

    if (!$('body').hasClass('front-page')) {
      setCommonContent();
      $(window).resize(debounce(setCommonContent, 100));
    }

    if ($('.comment-form').hasClass('form_with_errors')) {
      $('html, body').scrollTop($('.comment-form').offset().top);
    } else if ($('form').find('.form_error, .form_notice').length > 0) {
      $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
    }
  });

  var setFrontContent = function () {
    $('.main-menu').removeAttr("style");
    $('.header-row .content-full').removeAttr("style");
    $('.center-row .content-inner').removeAttr("style");
    $('.center-row .content-inner .inner-bottom').removeAttr("style");

    // Set header row height, to bypass vh rounding issue
    var whHeaderFullCalc = Math.round($(window).height() * (0.31)),
      whHeaderFullTarget = $('.header-row .content-full').css('min-height', whHeaderFullCalc);

    var whViewport = $(window).height(),
      whDocument = $(document).height(),
      whTopbar = $('.topbar').height(),
      whHeader = $('.header-row').height(),
      whCenter = $('.center-row').height(),
      whFooter = $('.footer-row').height();

    var whCentInnerPad = parseInt($('.center-row .inner-padding').css('padding-top')) * 2,
      whBodyFootRem = whDocument - whFooter - whHeader - whCentInnerPad;

    var whColUnder = whDocument - whHeader - whCenter - whFooter,
      whColUnderTarget = whDocument - whHeader - whCenter - whFooter - whTopbar;

    // Adjust center row inner-padding with min-height to make sure viewport is always filled with content
    if ($(document).width() >= 1024) {

      // Calc for center row padding, to fill viewport with content areas
      if ($('html').hasClass('editmode')) {
        var whEdy = $('#edy-bar').height(),
          whBodyFootRemEdy = whBodyFootRem - whEdy,
          whCenterInnerTarget = $('.center-row .content-inner').css('min-height', whBodyFootRem);
      } else {
        var whCenterInnerTarget = $('.center-row .content-inner').css('min-height', whBodyFootRem);
      };

      var contLeft = $('.content-left .content-inner').height(),
        contRight = $('.content-right .content-inner').height(),
        contLeftBottom = $('.content-left .content-inner .inner-bottom').height(),
        contRightBottom = $('.content-right .content-inner .inner-bottom').height();

      // Remove inner-bottom absolute value, if user content needs to expand the parent container
      if (contLeft < contLeftBottom) {
        $('.center-row .content-left .inner-bottom').css("position", "relative");
      };
      if (contRight < contRightBottom) {
        $('.center-row .content-right .inner-bottom').css("position", "relative");
      };

      // Equalize center-row left and right half content columns
      var whLeft = $('.content-left .content-inner').height(),
        whRight = $('.content-right .content-inner').height();

      if (whLeft > whRight) {
        var targetCalc = whLeft;
        $('.center-row .content-inner').css('min-height', targetCalc);

      };
      if (whLeft < whRight) {
        var targetCalc = whRight;
        $('.center-row .content-inner').css('min-height', targetCalc);
      };

    };

    // Make content areas play nice with long sidebars on smaller than 1024px screens
    if (whColUnder > 0 && $(document).width() < 1024) {
      var whColUnderCalc = whColUnderTarget + $('.content-left .content-inner').height(),
        whColUnderCenterInnerTarget = $('.content-left .content-inner').css('min-height', whColUnderCalc);
    };

    if ($(document).width() < 1024) {
      var contLeft = $('.content-left .content-inner').height(),
        contRight = $('.content-right .content-inner').height(),
        contLeftBottom = $('.content-left .content-inner .inner-bottom').height(),
        contRightBottom = $('.content-right .content-inner .inner-bottom').height();

      // Remove inner-bottom absolute value, if user content needs to expand the parent container
      if (contLeft < contLeftBottom) {
        $('.center-row .content-left .inner-bottom').css("position", "relative");
      };
      if (contRight < contRightBottom) {
        $('.center-row .content-right .inner-bottom').css("position", "relative");
      };
    };

  };

  var setCommonContent = function () {
    if ($(window).width() > 600) {
      var padSidebar = parseInt($('.sidebar-inner').css('padding-bottom')),
        whSideFooter = $('.main > footer').height();

      if (padSidebar < whSideFooter) {
        var padSidebarTarget = $('.sidebar-inner').css('padding-bottom', whSideFooter);
      }

      $('.js-content-top').removeAttr("style");
      var commonDoc = $(document).height(),
        commonConTop = $('.js-content-top').height();

      if (commonConTop < commonDoc) {
        var commonConTopTarget = $('.js-content-top').css('min-height', commonDoc);
      }
    } else {
      $('.js-content-top').css('min-height', 0);
    }
  };

})(jQuery);

(function ($) {
  $.fn.extend({
    jsPopupMenu: function (options) {
      this.each(function () {
        var $menu = $(this),
          $btn = $menu.find('.js-popup-menu-btn'),
          $pop = $menu.find('.js-popup-menu-popover');

        $pop.hide();
        $btn.on('click', function (event) {
          event.preventDefault();
          if ($pop.is(':hidden')) {
            $pop.show();
            $btn.addClass('open');

            setTimeout(function () {
              $(document).on('click.js-popup-menu-click', function () {
                $pop.hide();
                $btn.removeClass('open');
                $(this).off('.js-popup-menu-click');
              });
            }, 0);

          }
        });
      });
      return this;
    }
  });

})(jQuery);

(function ($) {
  $.jquerySelect = function () {

    return {
      init: function ($elem, settings) {
        $elem.wrap('<div class="jq-select" />');

        var $holder = $elem.parent(),
          $arrow = $('<div class="jq-select-arrow"></div>'),
          $content = $('<div class="jq-select-content" />'),
          $inner = $('<div class="jq-select-inner" />').text($elem.children(':selected').text());

        $content.append($inner);
        $holder.append($content);
        $holder.append($arrow);

        if ($elem.hasClass('form_field_size_large')) {
          $elem.removeClass('form_field_size_large');
          $holder.addClass('form_field_size_large');
        } else if ($elem.hasClass('form_field_size_medium')) {
          $elem.removeClass('form_field_size_medium');
          $holder.addClass('form_field_size_medium');
        } else if ($elem.hasClass('form_field_size_small')) {
          $elem.removeClass('form_field_size_small');
          $holder.addClass('form_field_size_small');
        } else {
          $holder.addClass('form_field_size_small');
        }

        $elem.change($.proxy(function () {
          $inner.text($elem.children(':selected').text());
        }, this));

        $elem.keyup($.proxy(function () {
          $inner.text($elem.children(':selected').text());
        }, this));

        $elem.bind('update', $.proxy(function () {
          $inner.text($elem.children(':selected').text());
        }, this));
      }
    };
  }();

  $.fn.extend({
    jqSelect: function (options) {
      this.each(function () {
        var settings = $.extend({}, options);
        $.jquerySelect.init($(this), settings);
      });
      return this;
    }
  });

})(jQuery);

(function ($) {

  var articlePage = $('body').hasClass('blog-article-page');
  var productPage = $('body').hasClass('product-page');

  // contentHalf background image and color preview logic function.
  var contentHalfBgPreview = function (data, contentHalf, contentHalfObj) {

    // Returns the suitable version of the image depending on the viewport width.
    var getImageByWidth = function (sizes, targetWidth) {
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

    var contentHalfBgImageSizesContains = function (sizes, url) {
      for (var i = sizes.length; i--;) {
        if (url.indexOf(sizes[i].url.trim()) > -1) {
          return true;
        }
      }
      return false;
    };

    // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
    var handleContentHalfImageLightnessClass = function () {
      if (contentHalfBgCombinedLightness >= 0.5) {
        $(contentHalf).find('.js-background-type').addClass('light-background').removeClass('dark-background');
      } else {
        $(contentHalf).find('.js-background-type').addClass('dark-background').removeClass('light-background');
      }
    };

    // Defines the suitable image based on the viewport width.
    var suitableImage = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : 'none';

    // Defines the variables used in preview logic.
    var contentHalfBgImagePrevious = $(contentHalf).css('background-image'),
      contentHalfBgImage = (data.image && data.image !== '') ? 'url(' + suitableImage.url + ')' : 'none',
      contentHalfBgImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
      contentHalfBgColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
      contentHalfBgColorOpacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
      contentHalfBgColorLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
      colorExtractImage = $('<img>'),
      colorExtractCanvas = $('<canvas>'),
      colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (contentHalfBgImageSizesContains(contentHalfBgImageSizes, contentHalfBgImagePrevious)) {
        contentHalfBgCombinedLightness = getCombinedLightness(contentHalfObj.contentHalfBgImageColor, contentHalfBgColor);
        handleContentHalfImageLightnessClass();
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g, '/photos'));
        colorExtractImage.on('load', function () {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function (data) {
            contentHalfObj.contentHalfBgImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            contentHalfBgCombinedLightness = getCombinedLightness(contentHalfObj.contentHalfBgImageColor, contentHalfBgColor);
            handleContentHalfImageLightnessClass();
          });
        });
      };
    } else {
      contentHalfBgCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', contentHalfBgColor);
      handleContentHalfImageLightnessClass();
    };

    // Fix Safari from constantly loading a new image on Bg picker slider change
    var newContentHalfBgImage = contentHalfBgImage.split('/').pop();
    var oldContentHalfBgImage = contentHalfBgImagePrevious.split('/').pop();

    // Updates the contentHalf background image and background color.
    if (newContentHalfBgImage != oldContentHalfBgImage) {
      $(contentHalf).css({
        'background-image': contentHalfBgImage
      });
    };
    $(contentHalf).find('.background-color').css({
      'background-color': contentHalfBgColor
    });
  };

  var normalizeValue = function (value) {
    if (value == null || (typeof value == 'string' && value.match(/^[\\'"]+$/))) {
      return '';
    } else {
      return value;
    }
  };

  // contentHalf background image and color save logic function.
  var contentHalfBgCommit = function (data, dataName) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = normalizeValue(data.imageSizes);
    commitData.color = data.color || 'rgba(255,255,255,0)';
    commitData.combinedLightness = contentHalfBgCombinedLightness;
    if (articlePage) {
      Edicy.articles.currentArticle.setData(dataName, commitData);
    } else if (productPage) {
      siteData.set(dataName, commitData);
    } else {
      pageData.set(dataName, commitData);
    };
  };

  var colorSum = function (bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/, '').replace(/\)/, '').split(',');
        $.each(bgColor, function (n, x) {
          bgColor[n] = +x;
        });
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/, '').replace(/\)/, '').split(',');
        $.each(fgColor, function (n, x) {
          fgColor[n] = +x;
        });
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) {
          bgColor.push(1.0);
        }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) {
          fgColor.push(1.0);
        }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) {
        result[3] = 1e-6;
      }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function (e) {
        return Math.floor(e);
      });
    }
  };

  var getCombinedColor = function (bgColor, fgColor) {
    var sum = colorSum(bgColor || [255, 255, 255, 1], fgColor || [255, 255, 255, 1]);
    return sum;
  };

  var getCombinedLightness = function (bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var bindContentItemImageLazyload = function () {
    $(document).ready(function () {
      setTimeout(function () {
        $('.js-content-item-box').addClass('not-loaded');
      }, 3000);
    });

    $('.js-lazyload').lazyload({
      threshold: 500,
      effect: "fadeIn",
      placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

      load: function () {
        var $contentItemBox = $(this).closest('.js-content-item-box');

        $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');

        setTimeout(function () {
          $contentItemBox.removeClass('not-loaded with-error');
          $contentItemBox.find('.js-loader').remove();
        }, 3000);
      }
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated on items list layouts.
  // ===========================================================================
  var initItemsPage = function () {
    bindContentItemImageLazyload();
  };

  // ===========================================================================
  // Change product image position on narrower screens (mobile devices)
  // ===========================================================================

  var handleProductPageContent = function () {
    $(document).ready(function () {
      changeProductImagePos();
    });

    $(window).resize(function () {
      changeProductImagePos();
    });

    var changeProductImagePos = function () {
      var productGallery = $('.js-product-gallery');
      var productImageContentBox = $('.js-content-item-box');
      var productRightContent = $('.js-product-right-content');

      if ($('.js-buy-btn-content .edy-buy-button-container').length >= 1) {
        if ($(window).width() < 640) {
          if ($('.js-product-right-content + .js-product-gallery').length === 0) {
            productRightContent.append(productGallery);
          }
        } else {
          if ($('.js-content-item-box + .js-product-gallery').length === 0) {
            productImageContentBox.parent().append(productGallery);
          }
        }
      }
    }
  };

  // ===========================================================================
  // Sets header menu initial width attribute for menu mode calculation.
  // ===========================================================================
  var setHeaderMenuInitialWidth = function () {
    var $headerMenu = $('.js-header-menu');
    $headerMenu.attr('data-initial-width', $headerMenu.outerWidth(true));
  };

  // ===========================================================================
  // Toggles product categories visibility in main menu.
  // ===========================================================================
  var bindRootItemSettings = function (rootItemValuesObj) {
    if (!('show_product_related_pages_in_main_menu' in rootItemValuesObj)) {
      rootItemValuesObj.show_product_related_pages_in_main_menu = false;
    }

    $('.js-root-item-settings-toggle').each(function (index, languageMenuSettingsButton) {
      var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [{
          "titleI18n": "show_in_main_menu",
          "type": "checkbox",
          "key": "show_product_related_pages_in_main_menu",
          "states": {
            "on": true,
            "off": false
          }
        }],

        buttonTitleI18n: "settings",

        values: rootItemValuesObj,

        containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

        preview: function (data) {
          if (!data.show_product_related_pages_in_main_menu === true) {
            $('.js-menu-item-products').addClass('is-hidden');
          } else {
            $('.js-menu-item-products').removeClass('is-hidden');
          }
        },

        commit: function (data) {
          siteData.set('settings_root_item', data);
        }
      });
    });
  };

  window.site = $.extend(window.site || {}, {
    initItemsPage: initItemsPage,
    bindRootItemSettings: bindRootItemSettings,
    contentHalfBgPreview: contentHalfBgPreview,
    contentHalfBgCommit: contentHalfBgCommit,
    handleProductPageContent: handleProductPageContent
  });

})(jQuery);
