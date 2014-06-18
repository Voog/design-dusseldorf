<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" id="viewport-meta" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

<meta property="og:type" content="website">
<meta property="og:url" content="{{ site.url }}">
<meta property="og:title" content="{{ site.name }}">
<meta property="og:description" content="{{ page.description }}">

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>

{% stylesheet_link "style.css?2" %}

<title>{% if article %}{{ article.title }} &mdash; {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} &mdash; {{ page.site_title }}{% endif %}{% endif %}</title>

<script src="{{ javascripts_path }}/modernizr.min.js"></script>

{% if blog %}{{ blog.rss_link }}{% endif %}