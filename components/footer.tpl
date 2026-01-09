<footer class="footer">
  <div class="footer-inner">
    <div class="cfx">
      {% include "search" %}
      {% if front_page != true %}
        <div class="footer-left">
          {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
          {% xcontent name="footer" title_tooltip=footer_content_title_tooltip %}
        </div>
      {% endif %}
    </div>
    {% if site.branding.enabled and page.path == blank %}
      <div class="voog-reference">
        {% loginblock %}
          {{ "footer_login_link" | lc }}
        {% endloginblock %}
      </div>
    {% endif %}
  </div>
</footer>
