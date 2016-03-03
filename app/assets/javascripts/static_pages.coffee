# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready', ->

  window.sr = new ScrollReveal

  #Enter to right animation
  sr.reveal '.sr-right',
    reset: false
    origin: 'left'
    distance: '120px'
    duration: 600
    delay: 50
    viewFactor: 0.7
    opacity: 0

  #Enter to left animation
  sr.reveal '.sr-left',
    reset: false
    origin: 'right'
    distance: '120px'
    duration: 600
    delay: 50
    viewFactor: 0.7
    opacity: 0
    #easing: 'cubic-bezier(0.215, 0.610, 0.355, 1.000)'

  #Enter to left animation
  sr.reveal '.sr-neutral',
    reset: false
    origin: 'bottom'
    distance: '20px'
    duration: 400
    delay: 100
    opacity: 0
    viewFactor: 0.6

  #Enter to left animation
  sr.reveal '.sr-tst',
    reset: false
    origin: 'bottom'
    distance: '300px'
    duration: 1600
    delay: 0
    #viewFactor: 0.1
    viewOffset:
      top : 400
      right : 0
      bottom : 0
      left : 0
    opacity: 1.0
    scale: 1.0
    easing: 'cubic-bezier(0.215, 0.610, 0.355, 1.000)'



  window.lastY = 0
  window.deltaY = 0

  $('.menu-button').on 'click', ->
    console.log 'sads'
    target = $(@).parent().find('.right-wing')
    $('.links').one 'click', ->
      $(target).removeClass 'exploded'

    if $(target).hasClass 'exploded'
      $(target).removeClass 'exploded'
    else
      $(target).addClass 'exploded'


  $(document).on 'scroll', ->
    currentY = $(document).scrollTop()
    if currentY >= $('#imagina').offset().top - $('.main-nav').height()/2
      $('.main-nav').removeClass 'dark-mode'
    else
      $('.main-nav').addClass 'dark-mode'

    window.deltaY = window.lastY - currentY
    window.lastY = currentY

  # # Iterates over a string array of element queries
  # # and checks if a point in Y is contained in that element
  # getCurrentSection = (sections, currentY) ->
  #   for sect,i in sections
  #     if currentY > $(sect).offset().top && currentY < $(sect).offset().top + $(sect).height()
  #       return { name: sect, index: i }

  # stickySectionsDesktop = ['#imagina','#envianos','#recibe']
  # window.isNowScrolling = false
  # $(document).on 'wheel keydown', ->
    # initialY = $(document).scrollTop() + window.innerHeight/2
    # initalSection = getCurrentSection(stickySectionsDesktop,initialY)

    # if window.isNowScrolling
    #   $('html,body').stop(true,false)
    #   window.isNowScrolling = false

  #   $(document).one 'scrollstop', ->
  #     if !window.isNowScrolling
  #       currentY = $(document).scrollTop() + window.innerHeight/2
  #       currentSection = getCurrentSection(stickySectionsDesktop,currentY)

  #       if initalSection.index == currentSection.index && !(currentY <= window.innerHeight/2 || currentY >= $(document).height() - window.innerHeight/2 )
  #         nextIndex = if window.deltaY < 0
  #           Math.min(++currentSection.index,stickySectionsDesktop.length - 1)
  #         else
  #           Math.max(--currentSection.index,0)
  #         console.log nextIndex
  #         currentSection.name = stickySectionsDesktop[nextIndex]

  #       targetOffset = $(currentSection.name).offset().top
  #       window.isNowScrolling = true
  #       $('html,body').animate {
  #           scrollTop: targetOffset
  #         }, 300, ->
  #           window.isNowScrolling = false

  # stickySectionsMobile = ['#imagina','#envianos','#recibe']
  # $(document).on 'touchstart', ->
  #   initialY = $(document).scrollTop() + window.innerHeight/2
  #   initalSection = getCurrentSection(stickySectionsMobile,initialY)

  #   if window.isNowScrolling
  #     $('html,body').stop(true,false)
  #     window.isNowScrolling = false

  #   $(document).one 'touchend', ->
  #     if !window.isNowScrolling
  #       currentY = $(document).scrollTop() + window.innerHeight/2
  #       currentSection = getCurrentSection(stickySectionsMobile,currentY)
  #       console.log "2---> #{currentY}"

  #       if initalSection.index == currentSection.index && !(currentY <= window.innerHeight/2 || currentY >= $(document).height() - window.innerHeight/2 )
  #         console.log 'DELTA'
  #         nextIndex = if window.deltaY < 0
  #           console.log 'DOOOWN'
  #           Math.min(++currentSection.index,stickySectionsMobile.length - 1)
  #         else
  #           Math.max(--currentSection.index,0)
  #         console.log nextIndex
  #         currentSection.name = stickySectionsMobile[nextIndex]

  #       targetOffset = $(currentSection.name).offset().top
  #       window.isNowScrolling = true
  #       $('html,body').animate {
  #           scrollTop: targetOffset
  #         }, 300, ->
  #           window.isNowScrolling = false


  #MATERIALS
  $('#envianos .row').on 'click', ->
    r = $(@)
    unless r.hasClass 'exploded'
      $(r).addClass 'exploded'
    else
      $(r).removeClass 'exploded'

  #MAIL FORM JAVASCRIPT
  $(".contact-form button").on 'click', ->
    $(@).html 'Enviando...'

  $(".contact-form").on("ajax:success", (e, data, status, xhr) ->
    $(@).find('.square').html data
    $(@).find('button').html 'Intentar de nuevo'
  ).on "ajax:error", (e, xhr, status, error) ->
    $(@).find('button').html 'Intentar de nuevo'
    alert "Hubo un error al enviar el correo, intente de nuevo más tarde."
