(function() {
  var delta, didScroll, hasScrolled, lastScrollTop, maxScroll;

  $('#hover-footer').append($('#footer-wrapper').clone().prop('id', ''));

  didScroll = void 0;

  lastScrollTop = 0;

  delta = $(window).height() - $('#site-header').height();

  maxScroll = $('footer').offset().top - $('#hover-footer').offset().top - $('#page-content').offset().top - delta / 2;

  hasScrolled = function() {
    var st;
    st = $(this).scrollTop();
    if (st > lastScrollTop && st <= delta) {
      return;
    }
    if (st > lastScrollTop && st < maxScroll) {
      if (!$('#hover-footer').hasClass('scroll-down')) {
        $('#hover-footer').addClass('scroll-down');
      }
    } else {
      if (st + $(window).height() <= $(document).height() && $('#hover-footer').hasClass('scroll-down')) {
        $('#hover-footer').removeClass('scroll-down');
      }
    }
    lastScrollTop = st;
  };

  $(window).scroll(function(event) {
    didScroll = true;
  });

  setInterval((function() {
    if (didScroll) {
      hasScrolled();
      didScroll = false;
    }
  }), 250);

}).call(this);
