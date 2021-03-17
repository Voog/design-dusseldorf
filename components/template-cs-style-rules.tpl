.jq-select-content {
  padding: 0 28px 0 0;
}

.jq-select-inner {
  padding: 4px 10px;
}

.light-background {
  color: var(--color-dark);
}

.light-background .jq-select-arrow,
.light-background .form_field_select,
.light-background .jq-select-inner,
.light-background .form_field_textfield,
.light-background .form_field_textarea {
  color: var(--color-dark);
  background-color: var(--color-light);
}

.light-background .post-title a,
.light-background .custom-btn:not(.custom-btn-disabled) {
  color: var(--color-dark);
}

.light-background .post-title a:hover,
.light-background .custom-btn:not(.custom-btn-disabled):hover {
  color: var(--color-light);
}

.light-background .formatted {
  color: var(--color-dark);
}

.light-background .formatted h1,
.light-background .formatted h2,
.light-background .formatted h3,
.light-background .formatted h4,
.light-background .formatted p,
.light-background .formatted input {
  color: var(--color-dark);
}

.light-background .formatted .form_submit input,
.light-background .formatted .submit {
  border-color: var(--color-dark);
  color: var(--color-dark);
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  font-weight: var(--content-button-font-weight);
  line-height: var(--content-button-line-height);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
}

.light-background .formatted .form_submit input:hover,
.light-background .formatted .submit:hover {
  border-color: var(--color-light);
  color: var(--color-light);
}

.light-background .formatted a, .light-background .formatted a:hover {
  color: var(--content-links-color);
}

.light-background .formatted a.custom-btn, .light-background .formatted a:hover.custom-btn {
  text-transform: var(--content-button-text-transform);
}

.light-background .formatted a.custom-btn:not(.custom-btn-disabled), .light-background .formatted a:hover.custom-btn:not(.custom-btn-disabled) {
  border-color: var(--color-dark);
  color: var(--color-dark);
}

.light-background .formatted a:hover {
  color: var(--content-links-hover-color);
}

.light-background .formatted a:hover.custom-btn {
  text-transform: var(--content-button-text-transform);
}

.light-background .formatted a:hover.custom-btn:not(.custom-btn-disabled) {
  border-color: var(--color-light);
  color: var(--color-light);
}

.light-background .formatted table th, .light-background .formatted table td {
  border-color: var(--color-dark);
}

.light-background .menu-horizontal li a {
  color: var(--color-dark);
}

.light-background .menu-horizontal li a:hover {
  color: var(--color-dark);
}

.light-background .item-placeholder {
  color: var(--color-dark);
}

.dark-background {
  color: var(--color-light);
}

.dark-background h1,
.dark-background h2,
.dark-background h3 {
  color: var(--color-light);
}

.dark-background h1 .placeholder,
.dark-background h2 .placeholder,
.dark-background h3 .placeholder {
  color: var(--color-light);
  opacity: .5;
}

.dark-background .sub-menu a {
  color: var(--color-light);
  opacity: .42;
}

.dark-background .sub-menu a:hover {
  color: var(--color-light);
  opacity: 1;
}

.dark-background .placeholder {
  color: rgba(255, 255, 255, 0.5);
}

.dark-background .post-title a {
  color: var(--color-light);
}

.dark-background .post-title a:hover {
  opacity: .75;
}

.dark-background .post-date {
  color: rgba(255, 255, 255, 0.36);
}

.dark-background .formatted {
  color: var(--color-light);
}

.dark-background .formatted h1,
.dark-background .formatted h2,
.dark-background .formatted h3,
.dark-background .formatted h4,
.dark-background .formatted p,
.dark-background .formatted b,
.dark-background .formatted input {
  color: var(--color-light);
}

.dark-background .formatted .form_submit input,
.dark-background .formatted .submit {
  border-color: var(--color-light);
  color: var(--color-light);
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  font-weight: var(--content-button-font-weight);
  line-height: var(--content-button-line-height);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
}

.dark-background .formatted .form_submit input:hover,
.dark-background .formatted .submit:hover {
  border-color: var(--color-light);
  color: var(--color-light);
}

.dark-background .formatted a,
.dark-background .formatted a:hover {
  color: var(--content-links-color);
}

.dark-background .formatted a.custom-btn,
.dark-background .formatted a:hover.custom-btn {
  font-family: var(--font-primary);
  text-transform: var(--content-button-text-transform);
}

.dark-background .formatted a.custom-btn:not(.custom-btn-disabled),
.dark-background .formatted a:hover.custom-btn:not(.custom-btn-disabled) {
  border-color: var(--color-light);
  color: var(--color-light);
}

.dark-background .formatted table th,
.dark-background .formatted table td {
  border-color: var(--color-dark);
}

.dark-background .custom-btn:not(.custom-btn-disabled) {
  border-color: var(--color-light);
  color: var(--color-light);
}

.dark-background .menu-horizontal li a {
  color: var(--color-light);
}

.dark-background .menu-horizontal li a:hover {
  color: var(--color-light);
}

.dark-background .item-placeholder {
  color: var(--color-light);
}

.post-date,
.comment .comment-info {
  color: var(--color-dark);
  opacity: .36;
}

.blog-list .post-title a {
  color: var(--color-dark);
  opacity: 1;
}

.blog-list .post-title a:hover {
  color: var(--color-dark);
  opacity: .75;
}

.blog-list .post-wrap {
  border-top-color: var(--color-light);
}

.lang-flag::before {
  background-color: var(--color-dark);
}

@media screen and (max-width: 600px) {
  .post-nav-link:nth-child(2)::before {
    background-color: var(--color-light);
  }
}

.comments:before,
label .form_field_checkbox + .form_control_indicator::before,
.form_field_textfield,
.form_field_textarea {
  background-color: var(--color-light);
}

body, .footer, .topbar {
  background-color: var(--sidebar-background-color);
}

body,
h1,
h2,
h3,
.search .search-input {
  color: var(--color-dark);
}

.site-title {
  color: var(--color-dark);
}

.site-title a {
  color: var(--color-dark);
}

label .form_field_radio + .form_control_indicator::before {
  border-color: var(--color-light);
}

.lang-menu-btn .lang-title {
  color: var(--color-dark);
}

@media screen and (max-width: 600px) {
  .lang-options .menu .menu-item {
    color: var(--color-light);
    opacity: .5;
  }
  .option-btn {
    color: var(--color-light);
  }
  .option-btn:hover {
    color: var(--color-light);
    opacity: .8;
  }
  .front-page .main-inner {
    color: var(--color-light);
  }
  .footer {
    background: var(--color-light);
  }
  .mobile-menu-toggler span.flags-disabled .language-menu-btn .lang-title, .mobile-menu-toggler span:before.flags-disabled .language-menu-btn .lang-title, .mobile-menu-toggler span:after.flags-disabled .language-menu-btn .lang-title {
    color: var(--color-light);
  }
  #mobile-menu .mobile-menu-close:before, #mobile-menu .mobile-menu-close:after {
    background: var(--color-light);
  }
  #mobile-menu .navigation-menu ul a,
  #mobile-menu .language-menu ul a {
    color: var(--color-light);
    opacity: .5;
  }
  #mobile-menu .navigation-menu ul a.active,
  #mobile-menu .language-menu ul a.active {
    color: var(--color-light);
  }
  .mobile-menu-toggler span, .mobile-menu-toggler span:before, .mobile-menu-toggler span:after {
    background-color: var(--color-dark);
  }
}

body,
.font-size-small,
.jq-select,
.jq-select select,
.form_field_select,
.jq-select-inner,
.form_field_textfield,
.form_field_textarea {
  font-family: var(--font-primary);
}

h1,
h2,
h3,
.front-page .main-inner,
.site-title,
.main-menu,
.sub-menu,
.content-inner,
.footer-row .content-inner,
.search .search-input,
#mobile-menu,
.form_submit input,
.custom-btn {
  font-family: var(--font-primary);
}

.sidebar {
  background-color: var(--sidebar-background-color);
}

.sidebar .site-title {
  color: var(--color-dark);
  font-size: var(--sidebar-site-title-font-size);
  font-style: var(--sidebar-site-title-font-style);
  font-weight: var(--sidebar-site-title-font-weight);
  line-height: var(--sidebar-site-title-line-height);
  -webkit-text-decoration: var(--sidebar-site-title-text-decoration);
          text-decoration: var(--sidebar-site-title-text-decoration);
  text-transform: var(--sidebar-site-title-text-transform);
}

.sidebar .site-title a {
  color: var(--sidebar-site-title-color);
}

.main-menu ul a {
  color: var(--color-dark);
  font-family: var(--sidebar-mainmenu-font-family);
  font-size: var(--sidebar-mainmenu-font-size);
  font-style: var(--sidebar-mainmenu-font-style);
  font-weight: var(--sidebar-mainmenu-font-weight);
  line-height: var(--sidebar-mainmenu-line-height);
  -webkit-text-decoration: var(--sidebar-mainmenu-text-decoration);
          text-decoration: var(--sidebar-mainmenu-text-decoration);
  text-transform: var(--sidebar-mainmenu-text-transform);
}

.main-menu ul a:hover {
  font-style: var(--sidebar-mainmenu-hover-font-style);
  font-weight: var(--sidebar-mainmenu-hover-font-weight);
  -webkit-text-decoration: var(--sidebar-mainmenu-hover-text-decoration);
          text-decoration: var(--sidebar-mainmenu-hover-text-decoration);
  text-transform: var(--sidebar-mainmenu-hover-text-transform);
}

.main-menu ul a.active {
  font-style: var(--sidebar-mainmenu-active-font-style);
  font-weight: var(--sidebar-mainmenu-active-font-weight);
  -webkit-text-decoration: var(--sidebar-mainmenu-active-text-decoration);
          text-decoration: var(--sidebar-mainmenu-active-text-decoration);
  text-transform: var(--sidebar-mainmenu-active-text-transform);
}

.sub-menu a {
  color: var(--color-dark);
  font-family: var(--content-submenu-font-family);
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-font-style);
  font-weight: var(--content-submenu-font-weight);
  opacity: .36;
  border-bottom-style: var(--content-submenu-text-decoration);
  text-transform: var(--content-submenu-text-transform);
  border-bottom-width: 3px;
}

.dark-background .sub-menu a {
  color: var(--color-light);
}

.light-background .sub-menu a {
  color: var(--color-dark);
}

.sub-menu a:hover {
  color: var(--color-dark);
  font-style: var(--content-submenu-hover-font-style);
  font-weight: var(--content-submenu-hover-font-weight);
  opacity: 1;
  border-bottom-style: var(--content-submenu-hover-text-decoration);
  text-transform: var(--content-submenu-hover-text-transform);
  border-bottom-width: 3px;
}

.sub-menu a.active {
  color: var(--color-dark);
  font-style: var(--content-submenu-active-font-style);
  font-weight: var(--content-submenu-active-font-weight);
  opacity: 1;
  border-bottom-style: var(--content-submenu-active-text-decoration);
  text-transform: var(--content-submenu-active-text-transform);
  border-bottom-width: 3px;
}

.dark-background .sub-menu a.active {
  color: var(--color-light);
  border-bottom-color: var(--color-light);
}

.light-background .sub-menu a.active {
  color: var(--color-dark);
  border-bottom-color: var(--color-dark);
}

.formatted h1 {
  color: var(--h1-color);
}

.formatted h1,
.formatted h1 a,
.formatted h1 a:hover {
  font-family: var(--h1-font-family);
  font-size: var(--h1-font-size);
  font-style: var(--h1-font-style);
  font-weight: var(--h1-font-weight);
  letter-spacing: var(--h1-letter-spacing);
  line-height: var(--h1-line-height);
  text-align: var(--h1-alignment);
  -webkit-text-decoration: var(--h1-text-decoration);
          text-decoration: var(--h1-text-decoration);
  text-transform: var(--h1-text-transform);
}

.formatted h2 {
  color: var(--h2-color);
}

.formatted h2,
.formatted h2 a,
.formatted h2 a:hover {
  font-family: var(--h2-font-family);
  font-size: var(--h2-font-size);
  font-style: var(--h2-font-style);
  font-weight: var(--h2-font-weight);
  letter-spacing: var(--h2-letter-spacing);
  line-height: var(--h2-line-height);
  text-align: var(--h2-alignment);
  -webkit-text-decoration: var(--h2-text-decoration);
          text-decoration: var(--h2-text-decoration);
  text-transform: var(--h2-text-transform);
}

.formatted h3 {
  color: var(--h3-color);
}

.formatted h3,
.formatted h3 a,
.formatted h3 a:hover {
  font-family: var(--h3-font-family);
  font-size: var(--h3-font-size);
  font-style: var(--h3-font-style);
  font-weight: var(--h3-font-weight);
  line-height: var(--h3-line-height);
  letter-spacing: var(--h3-letter-spacing);
  text-align: var(--h3-alignment);
  -webkit-text-decoration: var(--h3-text-decoration);
          text-decoration: var(--h3-text-decoration);
  text-transform: var(--h3-text-transform);
}

.formatted .comment-form h2,
.formatted .comments h2 {
  font-size: 24px;
}

.main .formatted,
.main .post-content {
  font-size: var(--content-font-size);
  font-style: var(--content-font-style);
  font-weight: var(--content-font-weight);
  line-height: var(--content-line-height);
  text-align: var(--content-alignment);
  -webkit-text-decoration: var(--content-text-decoration);
          text-decoration: var(--content-text-decoration);
  text-transform: var(--content-text-transform);
}

.main .formatted .custom-btn, .main .formatted .custom-btn:hover,
.main .post-content .custom-btn,
.main .post-content .custom-btn:hover {
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  font-weight: var(--content-button-font-weight);
  line-height: var(--content-button-line-height);
  -webkit-text-decoration: var(--content-button-text-decoration);
          text-decoration: var(--content-button-text-decoration);
}

.main .formatted table td,
.main .formatted table th,
.main .post-content table td,
.main .post-content table th {
  padding: var(--table-cell-padding);
  border-style: var(--table-border-style);
}

.main .formatted a,
.main .post-content a,
.main .footer a {
  color: var(--content-links-color);
  font-style: var(--content-links-font-style);
  font-weight: var(--content-links-font-weight);
  -webkit-text-decoration: var(--content-links-text-decoration);
          text-decoration: var(--content-links-text-decoration);
  text-transform: var(--content-links-text-transform);
}

.main .formatted a:hover,
.main .post-content a:hover,
.main .footer a:hover {
  color: var(--content-links-hover-color);
  font-style: var(--content-links-hover-font-style);
  font-weight: var(--content-links-hover-font-weight);
  -webkit-text-decoration: var(--content-links-hover-text-decoration);
          text-decoration: var(--content-links-hover-text-decoration);
  text-transform: var(--content-links-hover-text-transform);
}

.main .footer-row .formatted {
  font-size: var(--footer-font-size);
  font-style: var(--footer-font-style);
  font-weight: var(--footer-font-weight);
  line-height: var(--footer-line-height);
  text-transform: var(--footer-text-transform);
}

.main .footer-row .formatted a:not(.custom-btn) {
  color: var(--content-links-color);
}

.main .footer-row .formatted a:not(.custom-btn):hover {
  color: var(--content-links-hover-color);
}

.main .footer-row .formatted a, .main .footer-row .formatted a:hover {
  font-style: var(--footer-font-style);
  font-weight: var(--footer-font-weight);
  line-height: var(--footer-line-height);
  text-transform: var(--footer-text-transform);
}

.main .footer-row .formatted a.custom-btn {
  font-size: var(--footer-font-size);
  text-decoration: none;
}

.footer-row .light-background {
  color: var(--color-dark);
}

.footer-row .light-background b {
  color: var(--color-dark);
}

.footer-row .light-background .custom-btn {
  border: 1px solid var(--color-dark);
  font-size: var(--footer-font-size);
}

.footer-row .light-background .custom-btn:not(.custom-btn-disabled) {
  color: var(--color-dark);
}

.footer-row .light-background .custom-btn:not(.custom-btn-disabled):hover {
  border-color: var(--color-light);
}

.footer-row .light-background .custom-btn:not(.custom-btn-disabled):hover:hover a {
  color: var(--color-light);
}

.footer-row .light-background .custom-btn:not(.custom-btn-disabled):hover:not(.custom-btn-disabled) {
  color: var(--color-light);
}

.footer-row .dark-background {
  color: var(--color-light);
}

.footer-row .dark-background .custom-btn:not(.custom-btn-disabled) {
  color: var(--color-light);
  border: 1px solid var(--color-light);
}
