;(function($) {
    var searcherUIdefaults = {
        lang: 'en',
        resultTpl: '<div class="voog-search-modal-result"><h3 class="voog-search-title"><a class="voog-search-link" href="[[url]]">[[title]]</a></h3><p class="voog-search-content">[[content]]</p></div>',
        modalTpl: '<div class="voog-search-modal"><div class="voog-search-modal-results"></div><div class="voog-search-loader"></div></div>',
        noResults: 'No results found!'
    };

    var SearcherUI = function (el, options) {
        //this.el = el;
        //this.options = $.extend({}, searcherUIdefaults, options);
        this.init();
    };

    SearcherUI.prototype = {

        init: function() {
            
            //this.input = this.el.querySelector('input[type="search"], input[type="text"]');

            //this.modal = this.createModal();
            //this.searcher = new VoogSearchSDK(this.filterParams(this.options), proxy(this.handleSearchResult, this));
            //observe(this.el, "submit", proxy(this.handleSubmit, this));
            //observe(this.input, "keyup", proxy(this.handleInputKeyUp, this));
            //observe(this.el, "reset", proxy(this.handleInputKeyUp, this));
        }
        //,
        //
        //handleSubmit: function(event) {
        //    event.preventDefault();
        //    this.setLoading();
        //
        //    var val = this.input.value,
        //        resultEl = this.modal.querySelector('.voog-search-modal-results');
        //
        //    resultEl.innerHTML = '';
        //
        //    if (val) {
        //        this.searcher.query({
        //            q: val
        //        });
        //    } else {
        //        this.hideModal();
        //    }
        //    return false;
        //},
        //
        //setLoading: function() {
        //    this.loading_active = true;
        //    this.modal.className = this.modal.className.replace('loading', '').trim();
        //    this.modal.className = this.modal.className + ' loading';
        //},
        //
        //unsetLoading: function() {
        //    this.modal.className = this.modal.className.replace('loading', '').trim();
        //    this.loading_active = false;
        //},
        //
        //// Not all options are to be sent to search as params sdk
        //filterParams: function(p) {
        //    var allowed = ['per_page', 'page', 'lang', 'q', 'types', 'tags', 'path', 'tag_facets'],
        //        o = {};
        //    for (var i = allowed.length; i--;) {
        //        if (typeof p[allowed[i]] !== "undefined") {
        //            o[allowed[i]] = p[allowed[i]];
        //        }
        //    }
        //    return o;
        //},
        //
        //handleSearchResult: function(data) {
        //    this.pageLinks = data.pages;
        //    this.renderContent(data.result);
        //    this.showModal();
        //    this.unsetLoading();
        //},
        //
        //createModal: function() {
        //    var modal = createElements(this.options.modalTpl)[0];
        //    observe(modal, 'scroll', proxy(this.handleModalScroll, this));
        //    observe(modal, ['mousewheel', 'DOMMouseScroll'], proxy(this.handleMouseWheel, this));
        //    return modal;
        //},
        //
        //showModal: function() {
        //    var pos = offset(this.input),
        //        wSize= windowSize();
        //
        //    this.modal.style.visibility = "hidden";
        //    document.body.appendChild(this.modal);
        //
        //    var w = this.modal.offsetWidth,
        //        h = this.modal.offsetHeight;
        //
        //    this.modal.style.left = Math.min(Math.max(pos.left + ((pos.width - w)/2) , wSize.scrollLeft + 10), wSize.scrollLeft + wSize.width - w - 10) + 'px';
        //
        //    if (wSize.height + wSize.scrollTop < pos.top + pos.height + h) {
        //        this.modal.style.top = Math.max(pos.top - h, 0) + 'px';
        //    } else {
        //        this.modal.style.top = Math.max(pos.top + pos.height, 0) + 'px';
        //    }
        //
        //    this.modal.style.visibility = "visible";
        //
        //    if(!this.sideClickHandler) {
        //        this.sideClickHandler = observe(document, 'click', proxy(this.handleSideClick, this));
        //    }
        //    if(!this.resizeHandler) {
        //        this.resizeHandler = observe(window, 'resize', proxy(this.handleResize, this));
        //    }
        //},
        //
        //hideModal: function() {
        //    var parent = this.modal.parentNode;
        //    if (!parent) { return; }
        //    parent.removeChild(this.modal);
        //
        //    if(this.sideClickHandler) {
        //        this.sideClickHandler.stop();
        //        this.sideClickHandler = null;
        //    }
        //
        //    if(this.resizeHandler) {
        //        this.resizeHandler.stop();
        //        this.resizeHandler = null;
        //    }
        //},
        //
        //handleModalScroll: function(event) {
        //    var y = this.modal.scrollTop,
        //        maxy = this.modal.scrollHeight - this.modal.offsetHeight,
        //        treshold = 10;
        //
        //    if (y >= maxy - 10 && !this.loading_active && this.pageLinks && this.pageLinks.page < this.pageLinks.total) {
        //        this.fetchNextPage();
        //    }
        //},
        //
        //// stops page behind from scrolling if search rsults scroll is at bottom
        //handleMouseWheel: function(event) {
        //    var delta = event.wheelDeltaY/2 || event.detail * -10,
        //        y = this.modal.scrollTop,
        //        maxy = this.modal.scrollHeight - this.modal.offsetHeight;
        //
        //    if ((y >= maxy && delta < 0) || (y <= 0 && delta > 0)) {
        //        event.stopPropagation();
        //        event.preventDefault();
        //    }
        //},
        //
        //fetchNextPage: function() {
        //    this.setLoading();
        //    this.pageLinks.next();
        //},
        //
        //handleSideClick: function(event) {
        //    if (event.target !== this.input && event.target !== this.modal && !contains(this.modal, event.target)) {
        //        this.hideModal();
        //    }
        //},
        //
        //handleResize: function(event) {
        //    if (this.modal.parentNode) {
        //        this.showModal();
        //    }
        //},
        //
        //renderContent: function(results) {
        //    var resultEl = this.modal.querySelector('.voog-search-modal-results');
        //    this.modal.className = this.modal.className.replace('no-content', '').trim();
        //
        //    if(results.length) {
        //        for (var i = 0, max = results.length; i< max; i++) {
        //            resultEl.appendChild(createElements(this.options.resultTpl.replace(/\[\[url\]\]/g, results[i].path)
        //                                                  .replace(/\[\[title\]\]/g, results[i].title)
        //                                                  .replace(/\[\[content\]\]/g, results[i].description))[0]);
        //        }
        //    } else {
        //        resultEl.appendChild(document.createTextNode(this.options.noResults));
        //        this.modal.className += ' no-content';
        //    }
        //},
        //
        //handleInputKeyUp: function(event) {
        //    var that = this;
        //    setTimeout(proxy(function() {
        //        this.el.className = this.el.className.replace('not-empty', '').trim();
        //        if (this.input.value && this.input.value !== "") {
        //            this.el.className += ' not-empty';
        //        }
        //    }, this), 0);
        //}
    };
    window.VoogSearch = SearcherUI;
})(jQuery);