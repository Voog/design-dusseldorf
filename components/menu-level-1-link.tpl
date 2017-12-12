<li{% if render_product_related_pages == true and item.layout_title == product_list_layout or item.layout_title == product_layout %} class="{% unless show_product_related_pages_in_main_menu %}is-hidden {% endunless %}js-menu-item-products"{% endif %}>
  <a href="{{ item.url }}" {% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="fci-editor-menuadd untranslated"{% endunless %}>{{ item.title }}</a>
</li>
