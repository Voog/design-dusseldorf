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

var setTitlebox = function () {
  var $c = $('.site-title:visible');
  if ($c.is(':empty')) {
    $('.site-title-editable').appendTo($c);
  }
};

// ===========================================================================
// Sets header menu initial width attribute for menu mode calculation.
// ===========================================================================
var setHeaderMenuInitialWidth = function () {
  var $headerMenu = $('.js-header-menu');

  $headerMenu.attr('data-initial-width', $headerMenu.outerWidth(true));
};

if ($('body').hasClass('editmode')) {
  setTitlebox();

  $(window).resize(debounce(setTitlebox, 100));

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

// ===========================================================================
// Function to detect if site is displayed in editmode.
// ===========================================================================
var editmode = function () {
  return $('html').hasClass('editmode');
};

if (!Modernizr.flexbox && editmode()) {
  bindFallbackHeaderContentAreaWidthCalculation();
  bindFallbackFooterContentAreaWidthCalculation();
}

// ===========================================================================
// Binds editmode image drop areas.
// ===========================================================================
var bindContentItemImgDropAreas = function (placeholderText) {
  $('.js-content-item-img-drop-area').each(function (index, imgDropAreaTarget) {
    var $imgDropAreaTarget = $(imgDropAreaTarget),
      $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
      itemId = $contentItemBox.data('item-id'),
      itemType = $contentItemBox.data('item-type'),
      itemData = new Edicy.CustomData({
        type: itemType,
        id: itemId
      });

    var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
      positionable: false,
      target_width: 1280,
      placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
      removeBtn: '<div class="edy-img-drop-area-remove-image">' +
        '<div class="edy-img-drop-area-remove-image-ico">' +
        '<svg width="16" height="20" viewBox="0 0 26 30" xmlns="http://www.w3.org/2000/svg">' +
        '<g fill-rule="nonzero" fill="currentColor">' +
        '<g transform="translate(2 5)">' +
        '<path d="M0 .997h2V21c0 1 1 2 2 2h14c1 0 2-1 2-2V1h2v20c0 2.25-1.75 4-4 4H4c-2.25 0-4-1.75-4-4V.997z"/>' +
        '<rect x="10" y="4" width="2" height="16" rx="1"/>' +
        '<rect x="5" y="4" width="2" height="16" rx="1"/>' +
        '<rect x="15" y="4" width="2" height="16" rx="1"/>' +
        '</g>' +
        '<path d="M26 4v2H0V4h7V2c0-1 1-2 2-2h8c1 0 2 1 2 2v2h7zM9 4h8V3c0-.5-.5-1-1-1h-6c-.5 0-1 .5-1 1v1z"/>' +
        '</g>' +
        '</svg>' +
        '</div>' +
        '</div>',

      change: function (data) {
        var imageId;

        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
          .css('opacity', .1);

        if (data) {
          imageId = data.original_id;

          $contentItemBox
            .removeClass('without-image is-loaded with-error')
            .addClass('with-image not-loaded');

          setImageOrientation($contentItemBox, data.width, data.height);
        } else {
          imageId = null;

          $contentItemBox
            .removeClass('with-image is-loaded with-error')
            .addClass('without-image not-loaded');

          $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
        }

        setItemImage($contentItemBox, $imgDropAreaTarget, itemId, imageId, itemType);
      }
    });
  });
};

var setImageOrientation = function ($contentItemBox, width, height) {
  var $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
    $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');

  if (width > height) {
    $imgDropAreaTarget
      .removeClass('image-landscape image-square image-portrait')
      .addClass('image-landscape');
  } else if (width === height) {
    $imgDropAreaTarget
      .removeClass('image-landscape image-square image-portrait')
      .addClass('image-square');
  } else {
    $imgDropAreaTarget
      .removeClass('image-landscape image-square image-portrait')
      .addClass('image-portrait');
  }

  if ($imgDropAreaTarget.hasClass('image-square')) {
    $cropToggleButton
      .removeClass('is-visible')
      .addClass('is-hidden');
  } else {
    $cropToggleButton
      .removeClass('is-hidden')
      .addClass('is-visible');
  }
};

var setItemImage = function ($contentItemBox, $imgDropArea, itemId, imageId, itemType) {
  var apiType = itemType === 'article' ? 'articles' : 'pages',
    itemData = new Edicy.CustomData({
      type: itemType,
      id: itemId
    });

  $.ajax({
    type: 'PATCH',
    contentType: 'application/json',
    url: '/admin/api/' + apiType + '/' + itemId,
    data: JSON.stringify({
      'image_id': imageId
    }),
    dataType: 'json',
    success: function (data) {
      itemData.set('image_crop_state', 'not-cropped');
      $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
      $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 1);
      $imgDropArea.css('opacity', 1);
    },
    timeout: 30000,
    error: function (data) {
      $contentItemBox.removeClass('not-loaded is-loaded with-error').addClass('with-error');
    }
  });
};

window.template = $.extend(window.template || {}, {
  bindContentItemImgDropAreas: bindContentItemImgDropAreas
});

window.site = $.extend(window.site || {}, {
  initSettingsEditorBtn: initSettingsEditorBtn,
  toggleFlags: toggleFlags
});
