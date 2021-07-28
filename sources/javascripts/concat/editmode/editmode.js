;
(function ($) {

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

  var toggleFlags = function () {
    $('.js-option-toggle-flags').on('click', function (event) {
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

  var initSettingsEditorBtn = function () {
    window.addEventListener('DOMContentLoaded', function (event) {
      var shadowDom = document.querySelector(".edy-next-shadowdom").shadowRoot;
      var setSettingsBtn = setInterval(function () {
        if (shadowDom.querySelectorAll('div[class^="toolbar__"]').length) {
          var toolbarExpandBtn = shadowDom.querySelector('div[class^="toolbar-expand"]');
          var toolbar = shadowDom.querySelector('div[class^="toolbar__"]');
          var settingsBtn = document.querySelector(".js-layout_settings-btn");
          var toolbarItem = shadowDom.querySelector('div[class^="toolbar-content-item__"]');

          settingsBtn.className = toolbarItem.className + ' ' + settingsBtn.className;

          toolbar.insertBefore(settingsBtn, toolbarExpandBtn);

          shadowDom.querySelector(".js-layout_settings-btn").addEventListener(
            "click",
            function (e) {
              if (document.querySelector('body').classList.contains('layout_settings-visible')) {
                document.querySelector('div.editor_default').style.display = 'none';
              }
              document.querySelector('body').classList.toggle('layout_settings-visible');
              e.stopImmediatePropagation();
            }
          );

          var positionPopover = function () {
            var settingsPopover = $('.js-layout_settings-popover');
            var settingsPopoverArrow = $('.layout_settings-arrow');

            if ($(window).width() > 768) {
              settingsPopover.css({
                right: window.innerWidth - settingsBtn.getBoundingClientRect().right - (settingsPopover.width() / 2)
              });
              settingsPopoverArrow.css({
                right: settingsPopover.width() / 2
              });
            } else {
              settingsPopover.css({
                right: 0
              });
              settingsPopoverArrow.css({
                right: 72
              });
            }
          }

          $(window).resize(debounce(function () {
            positionPopover();
          }, 25));

          positionPopover();
          clearInterval(setSettingsBtn);
        }
      }, 500);

      $('body').append($('.js-layout_settings-popover'));
    });
  };

  if ($('body').hasClass('editmode')) {
    setTitlebox;

    $(window).resize(debounce(setTitlebox, 100));
  }

  var setTitlebox = function () {
    var $c = $('.site-title:visible');
    if ($c.is(':empty')) {
      $('.site-title-editable').appendTo($c);
    }
  };

  if ($('body').hasClass('front-page')) {
    // In edit mode maintain column equilibrium while user inputs new data
    var delay = (function () {
      var timer = 0;
      return function (callback, ms) {
        clearTimeout(timer);
        timer = setTimeout(callback, ms);
      };
    })();

    $('.center-row .content-inner').keyup(function () {
      delay(function () {
        setEqualHeights();
      }, 350);
    });
  }

  // Equalize center-row left and right half content columns when user adds or removes content
  var setEqualHeights = function () {

    if ($(document).width() >= 1024) {

      var whCrow = $('.center-row').height();

      var whLeftCont = $('.content-left').height(),
        whRightCont = $('.content-right').height();

      var whLeft = $('.content-left .content-inner').height(),
        whRight = $('.content-right .content-inner').height();

      var whLeftInner = $('.content-left .content-inner .inner-bottom').height(),
        whRightInner = $('.content-right .content-inner .inner-bottom').height();

      if (whLeftInner > whRightInner) {
        $('.content-right .content-inner').animate({
          'min-height': whLeft
        }, 'slow');
      };
      if (whRightInner > whLeftInner) {
        $('.content-left .content-inner').animate({
          'min-height': whRight
        }, 'slow');
      };

    };

    var contLeft = $('.content-left .content-inner').height(),
      contRight = $('.content-right .content-inner').height(),
      contLeftBottom = $('.content-left .content-inner .inner-bottom').height(),
      contRightBottom = $('.content-right .content-inner .inner-bottom').height();

    // Remove inner-bottom absolute value, if user content needs to expand the parent container
    if (contLeft < contLeftBottom) {
      $('.center-row .content-left .inner-bottom').css("position", "relative");
    } else if (contLeftBottom < contLeft) {
      $('.center-row .content-left .inner-bottom').css("position", "absolute");
    };

    if (contRight < contRightBottom) {
      $('.center-row .content-right .inner-bottom').css("position", "relative");
    } else if (contRightBottom < contRight) {
      $('.center-row .content-right .inner-bottom').css("position", "absolute");
    };

  };

  // ===========================================================================
  // Sets functions that will be initiated globally.
  // ===========================================================================
  var init = function () {
    if (!Modernizr.flexbox) {
      bindFallbackHeaderContentAreaWidthCalculation();
      bindFallbackFooterContentAreaWidthCalculation();
    }
  };

  window.site = $.extend(window.site || {}, {
    toggleFlags: toggleFlags,
    initSettingsEditorBtn: initSettingsEditorBtn
  });

  // ===========================================================================
  // Initiates global functions.
  // ===========================================================================
  init();

})(jQuery);
