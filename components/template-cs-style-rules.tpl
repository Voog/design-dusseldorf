.light-background {
  color: var(--color-dark);
}
.light-background .post-title a,
.light-background .custom-btn {
  color: var(--color-dark);
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
  color: var(--color-light);
}
.light-background .formatted a, .light-background .formatted a:hover {
  color: var(--content-links-color);
}
.light-background .formatted a.custom-btn, .light-background .formatted a:hover.custom-btn {
  color: var(--color-dark);
  text-transform: var(--content-button-text-transform);
}
.light-background .formatted a:hover {
  color: var(--content-links-hover-color);
}
.light-background .formatted a:hover.custom-btn {
  color: var(--color-light);
  text-transform: var(--content-button-text-transform);
}

.dark-background {
  color: var(--color-light);
}
.dark-background h1,
.dark-background h2,
.dark-background h3 {
  color: var(--color-light);
  opacity: .87;
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
.dark-background .formatted a, .dark-background .formatted a:hover {
  color: var(--content-links-color);
}
.dark-background .formatted a.custom-btn, .dark-background .formatted a:hover.custom-btn {
  color: var(--color-light);
  text-transform: var(--content-button-text-transform);
}
.dark-background .custom-btn {
  border-color: var(--color-light);
  color: var(--color-light);
}

.post-date,
.comment .comment-info {
  color: var(--color-dark);
  opacity: .36;
}

.sub-menu a {
  color: var(--color-dark);
  opacity: .36;
}
.sub-menu a:hover, .sub-menu a.active {
  color: var(--color-dark);
  opacity: .87;
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

body,
.topbar,
.footer,
.comments:before,
label .form_field_checkbox + .form_control_indicator::before,
.form_field_textfield,
.form_field_textarea {
  background-color: var(--color-light);
}

body,
h1,
h2,
h3,
.form_field_textfield,
.form_field_textarea,
.search .search-input {
  color: var(--color-dark);
}

.site-title {
  color: var(--color-dark);
}
.site-title a {
  color: var(--color-dark);
}

table td,
table th {
  border-color: rgba(0, 0, 0, 0.36);
}

.footer-row .light-background {
  color: rgba(0, 0, 0, 0.6);
}
.footer-row .light-background b {
  color: rgba(0, 0, 0, 0.5);
}
.footer-row .light-background .custom-btn {
  color: var(--color-dark);
}
.footer-row .light-background .custom-btn:hover {
  color: var(--color-light);
}
.footer-row .light-background .custom-btn:hover:hover a {
  color: var(--color-light);
}
.footer-row .dark-background {
  color: rgba(255, 255, 255, 0.6);
}
.footer-row .dark-background .custom-btn {
  color: var(--color-light);
}

label .form_field_radio + .form_control_indicator::before {
  border-color: var(--color-light);
}

@media screen and (max-width: 600px) {
  .lang-options .menu .menu-item {
    color: rgba(255, 255, 255, 0.5);
  }

  .option-btn {
    color: var(--color-light);
  }

  .option-btn:hover {
    color: rgba(255, 255, 255, 0.8);
  }

  .front-page .main-inner {
    color: var(--color-light);
  }

  .footer {
    background: white;
  }

  .mobile-menu-toggler span.flags-disabled .language-menu-btn .lang-title, .mobile-menu-toggler span:before.flags-disabled .language-menu-btn .lang-title, .mobile-menu-toggler span:after.flags-disabled .language-menu-btn .lang-title {
    color: var(--color-light);
  }

  #mobile-menu .mobile-menu-close:before, #mobile-menu .mobile-menu-close:after {
    background: white;
  }

  #mobile-menu .navigation-menu ul a,
  #mobile-menu .language-menu ul a {
    color: rgba(255, 255, 255, 0.5);
  }

  #mobile-menu .navigation-menu ul a.active,
  #mobile-menu .language-menu ul a.active {
    color: var(--color-light);
  }

  .mobile-menu-toggler span, .mobile-menu-toggler span:before, .mobile-menu-toggler span:after {
    background-color: rgba(0, 0, 0, 0.87);
  }
}
body,
h3,
.font-size-small,
.jq-select,
.jq-select select,
.form_field_textfield,
.form_field_textarea,
.form_submit input {
  font-family: var(--font-secondary);
}

h1,
h2,
.front-page .main-inner,
.site-title,
.main-menu,
.sub-menu,
.content-inner,
.footer-row .content-inner,
.search .search-input,
#mobile-menu {
  font-family: var(--font-primary);
}

.sidebar {
  background-color: var(--sidebar-background-color);
}
.sidebar .site-title {
  color: var(--sidebar-site-title-color);
  font-size: var(--sidebar-site-title-font-size);
  font-style: var(--sidebar-site-title-font-style);
  font-weight: var(--sidebar-site-title-font-weight);
  line-height: var(--sidebar-site-title-line-height);
  text-decoration: var(--sidebar-site-title-text-decoration);
  text-transform: var(--sidebar-site-title-text-transform);
}
.sidebar .site-title a {
  color: var(--sidebar-site-title-color);
}

.main-menu ul a {
  color: var(--sidebar-mainmenu-color);
  font-family: var(--sidebar-mainmenu-font-family);
  font-size: var(--sidebar-mainmenu-font-size);
  font-style: var(--sidebar-mainmenu-font-style);
  font-weight: var(--sidebar-mainmenu-font-weight);
  line-height: var(--sidebar-mainmenu-line-height);
  text-decoration: var(--sidebar-mainmenu-text-decoration);
  text-transform: var(--sidebar-mainmenu-text-transform);
}
.main-menu ul a:hover {
  color: var(--sidebar-mainmenu-hover-color);
  font-style: var(--sidebar-mainmenu-hover-font-style);
  font-weight: var(--sidebar-mainmenu-hover-font-weight);
  text-decoration: var(--sidebar-mainmenu-hover-text-decoration);
  text-transform: var(--sidebar-mainmenu-hover-text-transform);
}
.main-menu ul a.active {
  color: var(--sidebar-mainmenu-active-color);
  font-style: var(--sidebar-mainmenu-active-font-style);
  font-weight: var(--sidebar-mainmenu-active-font-weight);
  text-decoration: var(--sidebar-mainmenu-active-text-decoration);
  text-transform: var(--sidebar-mainmenu-active-text-transform);
}

.sub-menu a {
  font-family: var(--content-submenu-font-family);
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-font-style);
  font-weight: var(--content-submenu-font-weight);
  text-decoration: var(--content-submenu-text-decoration);
  text-transform: var(--content-submenu-text-transform);
}
.sub-menu a:hover {
  font-style: var(--content-submenu-hover-font-style);
  font-weight: var(--content-submenu-hover-font-weight);
  text-decoration: var(--content-submenu-hover-text-decoration);
  text-transform: var(--content-submenu-hover-text-transform);
}
.sub-menu a.active {
  font-style: var(--content-submenu-active-font-style);
  font-weight: var(--content-submenu-active-font-weight);
  text-decoration: var(--content-submenu-active-text-decoration);
  text-transform: var(--content-submenu-active-text-transform);
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
  text-decoration: var(--h1-text-decoration);
  text-transform: var(--h1-text-transform);
}
.formatted h2 {
  color: var(--h2-color);
}
.formatted h2, .formatted h2 a, .formatted h2 a:hover {
  font-family: var(--h2-font-family);
  font-size: var(--h2-font-size);
  font-style: var(--h2-font-style);
  font-weight: var(--h2-font-weight);
  letter-spacing: var(--h2-letter-spacing);
  line-height: var(--h2-line-height);
  text-align: var(--h2-alignment);
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
  text-decoration: var(--h3-text-decoration);
  text-transform: var(--h3-text-transform);
}

.main .formatted,
.main .post-content {
  font-size: var(--content-font-size);
  font-style: var(--content-font-style);
  font-weight: var(--content-font-weight);
  line-height: var(--content-line-height);
  text-align: var(--content-alignment);
  text-decoration: var(--content-text-decoration);
  text-transform: var(--content-text-transform);
}
.main .formatted .custom-btn, .main .formatted .custom-btn:hover,
.main .post-content .custom-btn,
.main .post-content .custom-btn:hover {
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  font-weight: var(--content-button-font-weight);
  text-decoration: var(--content-button-text-decoration);
}

.main .formatted a,
.main .post-content a,
.main .footer a {
  color: var(--content-links-color);
  font-style: var(--content-links-font-style);
  font-weight: var(--content-links-font-weight);
  text-decoration: var(--content-links-text-decoration);
  text-transform: var(--content-links-text-transform);
}
.main .formatted a:hover,
.main .post-content a:hover,
.main .footer a:hover {
  color: var(--content-links-hover-color);
  font-style: var(--content-links-hover-font-style);
  font-weight: var(--content-links-hover-font-weight);
  text-decoration: var(--content-links-hover-text-decoration);
  text-transform: var(--content-links-hover-text-transform);
}

/*

// Footer
.footer {
  background-color: var(--footer-background-color);

  .footer-content {
    color: var(--footer-color);
    font-family: var(--footer-font-family);
    font-size: var(--footer-font-size);
    font-style: var(--footer-font-style);
    font-weight: var(--footer-font-weight);
    letter-spacing: var(--footer-letter-spacing);
    line-height: var(--footer-line-height);
    text-align: var(--footer-alignment);
    text-decoration: var(--footer-text-decoration);
    text-transform: var(--footer-text-transform);
  }
}

// TABLES
main .content {
  table {
    background-color: var(--table-background-color);

    td,
    th {
      border: var(--table-border-width) var(--table-border-color) solid;
      padding: var(--table-cell-padding);
    }
  }
}

// FORMS
.formatted {
  form,
  .form {
    padding: var(--form-padding);
    background-color: var(--form-background-color);
  }
}

.form_field_textfield,
.form_field_textarea,
.form_submit input,
input[type=submit],
input[type=text],
textarea {
  font-family: var(--form-field-text-font-family);
}

// scss-lint:disable SelectorFormat, ImportantRule
.form_field_textfield,
.form_field_textarea {
  background-color: var(--form-field-background-color);
  border: var(--form-field-border-width) var(--form-field-border-color) solid;
  color: var(--form-field-text-color);
  font-size: var(--form-field-text-font-size);
  line-height: var(--form-field-text-line-height);
  font-style: var(--form-field-text-font-style);
  font-weight: var(--form-field-text-font-weight);
  padding-left: var(--form-field-padding);
  padding-right: var(--form-field-padding);
  text-decoration: var(--form-field-text-text-decoration);
  text-transform: var(--form-field-text-text-transform);
}

.form_submit input,
.submit {
  padding: var(--form-button-padding);
  font-family: var(--form-button-font-family);
  font-size: var(--form-button-font-size);
  font-style: var(--form-button-font-style);
  font-weight: var(--form-button-font-weight);
  line-height: var(--form-button-line-height);
  letter-spacing: var(--form-button-letter-spacing);
  color: var(--form-button-color);
  text-decoration: var(--form-button-text-decoration);
  text-transform: var(--form-button-text-transform);
  background-color: var(--form-button-background-color);

  &:hover {
    font-size: var(--form-button-hover-font-size);
    font-style: var(--form-button-hover-font-style);
    font-weight: var(--form-button-hover-font-weight);
    color: var(--form-button-hover-color);
    text-decoration: var(--form-button-hover-text-decoration);
    text-transform: var(--form-button-hover-text-transform);
    background-color: var(--form-button-hover-background-color);
  }
}

label {
  .form_field_checkbox {
    + .form_control_indicator::before {
      background: var(--form-field-background-color);
    }
  }

  .form_field_radio {
    + .form_control_indicator::before {
      border-color: var(--form-field-background-color);
    }

    // scss-lint: disable NestingDepth
    &:checked {
      + .form_control_indicator::before {
        background-color: var(--form-field-text-color);
      }
    }
  }
}
*/
