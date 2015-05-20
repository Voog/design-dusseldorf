;(function($) {

    $(function() {
        $('.js-popup-menu').jsPopupMenu();

        if ($('html').hasClass('no-placeholder')) {
            $('input[type="text"],textarea').each(function() {
                if ($(this).attr('placeholder') && !$(this).val()) {
                    $(this).val($(this).attr('placeholder'));
                }
                $(this).focus(function() {
                    if ($(this).val() == $(this).attr('placeholder')) {
                        $(this).val('');
                    }
                }).blur(function() {
                    if (!$(this).val() && $(this).attr('placeholder')) {
                        $(this).val($(this).attr('placeholder'));
                    }
                });
            });
        }

        $('.form_fields:not(.edy-fe-fields) select, .custom-select').jqSelect();

        $('body:not(.editmode) table').each(function() {
            $(this).wrap('<div class="table-holder" />');
        });

        $('.mobile-menu-toggler').click(function(event) {
            event.preventDefault();
            $('body').toggleClass('mobilemenu-open');
            $('body').removeClass('mobilesearch-open');
        });

        $('.mobile-menu-close').on('click', function(event) {
            event.preventDefault();

            if ($('body').hasClass('language-menu-open')) {
                $('body').removeClass('language-menu-open');
            }
            else {
                $('body').removeClass('mobilemenu-open');
            }
        });


        $('.language-menu-btn').on('click', function(event) {
            event.preventDefault();
            $('body').addClass('language-menu-open');
        });

        $('.comment-form-focus-input').focus(function() {
            var $el = $(this).hide();
            $(this).closest('.comment-form').find('.form_area').show().find('textarea').focus();
        });

        if ($('body').hasClass('editmode')) {
            setTitlebox();
            $(window).resize(setTitlebox);
        }

        if ($('body').hasClass('front-page')) {
            setFrontContent();
            //$(window).load(setFrontContent);
            $(window).resize(setFrontContent);
        }

        if ($('.comment-form').hasClass('form_with_errors')) {
          $('html, body').scrollTop($('.comment-form').offset().top);
        } else if ($('form').find('.form_error, .form_notice').length > 0) {
          $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
        }
    });

    var setFrontContent = function() {
      if ($(window).width() > 1023) {

        // Calc for nav element padding, to align with center row

        var whViewp = $(window).height(),
            whHeader = $('.header-row').height(),
            whSiteTitle = $('.sidebar .site-title').outerHeight(),
            padSideIn = parseInt($('.sidebar-inner').css('padding-top')),
            padLiItem = $('.main-menu li').outerHeight() * (1/3),
            padNav = whHeader - padSideIn - whSiteTitle - padLiItem;
            if (padNav < whViewp) {var padNavTarget = $('.main-menu').css('padding-top', padNav)};
            console.log("viewport");
            console.log(whViewp);


        var whBody = $(document).height(),
            whFoot = $('.footer-row').height(),

            //whHeader = Math.round(parseFloat($('.header-row .content-full').css('min-height'))),
            whCentInnerPad = parseInt($('.center-row .inner-padding').css('padding-top')) * 2,
            whBodyFootRem = whBody - whFoot - whHeader - whCentInnerPad + 1,
            whCenterInnerTarget = $('.center-row .content-inner').css('min-height', whBodyFootRem);


            console.log(whHeader);
            console.log($('.header-row .content-full').css('min-height'));
            console.log(Math.round(parseFloat($('.header-row .content-full').css('min-height'))));
            console.log(parseFloat($('.header-row .content-full').css('min-height')));
            console.log(parseInt($('.header-row .content-full').css('min-height')));
            console.log(whBody);



      }
    };

    var setTitlebox = function() {
        var $c = $('.site-title:visible');
        if ($c.is(':empty')) {
            $('.site-title-editable').appendTo($c);
        }
    };

})(jQuery);


(function($) {
    $.fn.extend({
        jsPopupMenu: function(options) {
            this.each(function() {
                var $menu = $(this),
                    $btn = $menu.find('.js-popup-menu-btn'),
                    $pop = $menu.find('.js-popup-menu-popover');

                $pop.hide();
                $btn.on('click', function(event) {
                    event.preventDefault();
                    if ($pop.is(':hidden')) {
                        $pop.show();
                        $btn.addClass('open');

                        setTimeout(function() {
                            $(document).on('click.js-popup-menu-click', function() {
                                $pop.hide();
                                $btn.removeClass('open');
                                $(this).off('.js-popup-menu-click');
                            });
                        },0);

                    }
                });
            });
            return this;
        }
    });

})(jQuery);

(function($) {
    $.jquerySelect = function() {

        return {
            init: function($elem, settings) {
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
                }

                else if ($elem.hasClass('form_field_size_medium')) {
                    $elem.removeClass('form_field_size_medium');
                    $holder.addClass('form_field_size_medium');
                }

                else if ($elem.hasClass('form_field_size_small')) {
                    $elem.removeClass('form_field_size_small');
                    $holder.addClass('form_field_size_small');
                }
                else {
                    $holder.addClass('form_field_size_small');
                }

                $elem.change($.proxy(function() {
                    $inner.text($elem.children(':selected').text());
                }, this));

                $elem.keyup($.proxy(function() {
                    $inner.text($elem.children(':selected').text());
                }, this));

                $elem.bind('update', $.proxy(function() {
                    $inner.text($elem.children(':selected').text());
                }, this));
            }
        };
    }();

    $.fn.extend({
        jqSelect: function(options) {
            this.each(function() {
                var settings = $.extend({}, options);
                $.jquerySelect.init($(this), settings);
            });
            return this;
        }
    });

})(jQuery);

(function($) {

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

    var contentHalfBgImageSizesContains = function(sizes, url) {
      for (var i = sizes.length; i--;) {
        if (url.indexOf(sizes[i].url.trim()) > -1) {
          return false;
        }
      }
      return false;
    };

    // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
    var handleContentHalfImageLightnessClass = function() {
      if (contentHalfBgCombinedLightness >= 0.5) {
        $(contentHalf).find('.js-background-type').addClass('light-background').removeClass('dark-background');
      } else {
        $(contentHalf).find('.js-background-type').addClass('dark-background').removeClass('light-background');
      }
    };

    // Defines the suitable image based on the viewport width.
    var suitableImage = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : 'none';

    var contentHalfBgImagePrevious = $(contentHalf).css('background-image'),
        //contentHalfBgImagePrevious = 'url(' + suitableImage.url + ')',
        //contentHalfBgImagePrevious = $('.content-full').css('background-image'),
        contentHalfBgImage = (data.image && data.image !== '') ? 'url(' + suitableImage.url + ')' : 'none',
        contentHalfBgImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        contentHalfBgColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        contentHalfBgColorOpacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
        //contentHalfBgColorLightness = (data.colorData && data.colorData !== '' && data.colorData.lightness) ? data.colorData.lightness : 1,
        contentHalfBgColorLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;
        console.log(contentHalfBgImagePrevious);
        console.log(suitableImage);
        console.log(data);

    if (colorExtractImageUrl) {
      if (contentHalfBgImageSizesContains(contentHalfBgImageSizes, contentHalfBgImagePrevious)) {
        contentHalfBgCombinedLightness = getCombinedLightness(contentHalfBgImage, contentHalfBgColor);
        handleContentHalfImageLightnessClass();
        console.log("first");
        console.log(contentHalf.contentHalfBgImageColor);
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/photos/g,'/photos'));
        console.log(colorExtractImage);
        colorExtractImage.load(function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            //contentHalf.contentHalfBgImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            contentHalfBgImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';

            //contentHalfBgCombinedLightness = getCombinedLightness(contentHalf.contentHalfBgImageColor, contentHalfBgColor);
            contentHalfBgCombinedLightness = getCombinedLightness(contentHalfBgImageColor, contentHalfBgColor);

            handleContentHalfImageLightnessClass();
            console.log(contentHalfBgCombinedLightness);
            console.log("sec");
          });
        });
      };
    } else {
      contentHalfBgCombinedLightness = getCombinedLightness('rgba(255,255,255,1)', contentHalfBgColor);
      handleContentHalfImageLightnessClass();
      console.log(contentHalfBgCombinedLightness);
      console.log("third");
    };

    // Updates the contentHalf background image and background color.
    $(contentHalf).css({'background-image' : contentHalfBgImage});
    $(contentHalf).find('.background-color').css({'background-color' : contentHalfBgColor});
    console.log(contentHalfBgCombinedLightness);
  };

  // contentHalf background image and color save logic function.
  var contentHalfBgCommit = function(data, dataName) {
    var commitData = $.extend(true, {}, data);
        commitData.image = data.image || '';
        commitData.imageSizes = data.imageSizes || '';
        commitData.color = data.color || 'rgba(255,255,255,0)';
        commitData.combinedLightness = contentHalfBgCombinedLightness;
        pageData.set(dataName, commitData);
  };

  var colorSum = function(bgColor, fgColor) {
  if (bgColor && fgColor) {
    if (typeof bgColor == 'string') {
      bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
      $.each(bgColor, function(n, x) {bgColor[n] = +x;});
    }
    if (typeof fgColor == 'string') {
      fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
      $.each(fgColor, function(n, x) {fgColor[n] = +x;});
    }
    if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
      if (bgColor.length == 3) { bgColor.push(1.0); }
    }
    if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
      if (fgColor.length == 3) { fgColor.push(1.0); }
    }
    var result = [0, 0, 0, 0];
    result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
    if (result[3] === 0) { result[3] = 1e-6; }
    result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
    result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
    result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
    return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      $(this).toggleClass('js-flag-disable-btn');
      $('.js-menu-lang-wrap').toggleClass('flags-enabled flags-disabled');

      siteData.set("flags_state", flagsState);
    });
  };

  window.site = $.extend(window.site || {}, {
    contentHalfBgPreview: contentHalfBgPreview,
    contentHalfBgCommit: contentHalfBgCommit,
    toggleFlags: toggleFlags,
  });

})(jQuery);
