{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.3/edicy-tools.js'></script>
  <script>
    // Front page cover image and color data preview and save logic
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var bgPickerCover = new Edicy.BgPicker($('.js-bgpicker-cover-settings'), {
      picture: true,
      color: true,
      showAlpha: true,
      preview: function(data) {

        var image = (data.image && data.image !== '') ? 'url("' + data.image + '")' : 'none',
            color = (data.color && data.color !== '') ? data.color : '',
            colorData = (data.colorData && data.colorData !== '') ? data.colorData : '',
            lightness = colorData && colorData !== '' && colorData.lightness ? colorData.lightness : 0;

        $('.js-bgpicker-cover-color').removeClass('light-background dark-background').addClass(lightness <= 0.5 ? 'dark-background' : 'light-background');

        $('.js-bgpicker-cover-image').css({'background-image' : image });

        if (color && color !== '') {
          $('.js-bgpicker-cover-color').css({'background-color' : color });
        }
        else {
          $('.js-bgpicker-cover-color').css({'background-color' : 'transparent'});
        }
      },

      commit: function(data) {
        pageData.set({
          'cover_image': data.image || '',
          'cover_color': data.color || '',
          'cover_colorData' : data.colorData || '',
          'cover_lightness' : data.colorData && data.colorData != '' && data.colorData.lightness ? data.colorData.lightness : 0
        });
      }
    });

  </script>
{% endeditorjsblock %}
