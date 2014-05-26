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
        
        if (navigator.userAgent.indexOf('MSIE') !== -1 || navigator.appVersion.indexOf('Trident/') > 0) {
            $('html').addClass('msie'); 
        }
    });
   
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
                        
                        
                        setTimeout(function() {
                            $(document).on('click.js-popup-menu-click', function() {
                                $pop.hide();
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

