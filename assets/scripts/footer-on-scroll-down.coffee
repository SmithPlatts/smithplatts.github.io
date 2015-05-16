---
---

# Clone the Footer node so that we have an up-to-date version of the footer content
$('#hover-footer').append($('#footer-wrapper').clone().prop('id', ''))

# Base Variables
didScroll = undefined
lastScrollTop = 0
delta = $(window).height() - $('#site-header').height()

# Get the max scrolling room before we should be re-hiding the 'footer'
maxScroll = $('footer').offset().top - $('#hover-footer').offset().top - $('#page-content').offset().top - delta / 2

hasScrolled = ->
    st = $(this).scrollTop()

    # Don't move until the delta has been scrolled past
    if st > lastScrollTop and st <= delta
        return

    # If the scrollbar has moved further down, and not past max scroll, keep showing the 'footer'
    if st > lastScrollTop and st < maxScroll
        if !$('#hover-footer').hasClass('scroll-down')
            $('#hover-footer').addClass('scroll-down')
    else
        if st + $(window).height() <= $(document).height() and $('#hover-footer').hasClass('scroll-down')
            $('#hover-footer').removeClass('scroll-down')

    lastScrollTop = st
    return

$(window).scroll (event) ->
    didScroll = true
    return

setInterval (->
    if didScroll
        hasScrolled()
        didScroll = false
    return
), 250
