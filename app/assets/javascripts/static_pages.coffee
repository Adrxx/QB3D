# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  
$(document).on 'ready', ->
  window.sr = new scrollReveal();
  $(".contact-form button").on 'click', ->
    $(@).html 'Enviando...'

  $(".contact-form").on("ajax:success", (e, data, status, xhr) -> 
    $(@).find('.square').html data
    $(@).find('button').html 'Intentar de nuevo'
  ).on "ajax:error", (e, xhr, status, error) ->
    $(@).find('button').html 'Intentar de nuevo'
    alert "Hubo un error al enviar el correo, intente de nuevo más tarde."

  $('.materials .row').on 'click', ->
    r = $(@).find('.colors')
    unless r.hasClass 'exploded'
      $(r).addClass 'exploded'
    else
      $(r).removeClass 'exploded'
