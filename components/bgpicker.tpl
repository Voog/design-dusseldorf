{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.2/edicy-tools.js'></script>
  <script>
    // Front page cover image and color data preview and save logic
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var bgPickerCover = new Edicy.BgPicker($('.js-bgpicker-cover-settings'), {
      picture: true,
      color: true,
      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : 'none',
            col = (data.color && data.color !== '') ? data.color : '';
            colObj = getRGBA(col);

        $('.js-bgpicker-cover-image').css({'background-image' : img});
        
        if (colObj) {
          if (data.image === null || data.image === '') {
            $('.js-bgpicker-cover-color').css({'background-color' : 'rgb('+ colObj.r +','+ colObj.g +','+ colObj.b+')' });
          }
          else {
            $('.js-bgpicker-cover-color').css({'background-color' : 'rgba('+ colObj.r +','+ colObj.g +','+ colObj.b+', 0.5)' });
          }
        }
        else {
          $('.js-bgpicker-cover-color').css({'background-color' : 'transparent'});
        }
        
        
      },

      commit: function(data) {
        
        var colObj = colObj = getRGBA(data.color) || '';
        
        pageData.set({
          'cover_image': data.image || '',
          'cover_color': data.color || '',
          'cover_color_obj' : colObj
        });
      }
    });
    
    var getRGBA = function(colorStr) {
        if (!colorStr || typeof colorStr !== 'string') {
           return;
        }

        var arr = colorStr.match(/(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,?\s*([\d\.]+)?\s*)/);
        if (arr) {
            return {
                r: +arr[2],
                g: +arr[3],
                b: +arr[4],
                a: (arr[5]) ? +arr[5] : 1
            };
        }
    };

  </script>
{% endeditorjsblock %}
