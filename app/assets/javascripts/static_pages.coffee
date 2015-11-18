# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  $(window).on 'scroll', ->
    scroll_top = $(window).scrollTop()
    console.log scroll_top
    if scroll_top >= $('section.imagina').height()
      $('section.recibe').css 'height', (scroll_top - $('section.imagina').height()) + "px"
    else
      $('section.envianos').css 'height', scroll_top + "px"
