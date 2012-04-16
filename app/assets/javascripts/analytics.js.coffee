#= require 'underscore'

# google analytics
_gaq = (window._gaq ||= [])

# window sizes
trackViewport = _.debounce (action) ->
  w = $(window).width()
  h = $(window).height()
  aspect = Math.floor w / h * 100
  _gaq.push [ '_trackEvent', 'Viewport', action, "#{w}x#{h}", aspect, true ]
  true
, 500

trackViewport 'Load'
$(window).resize -> trackViewport 'Resize'

# gallery clicks
$(document).on 'click', 'a.thumb', ->
  album = $(this).closest('.album').find('h4').text()
  _gaq.push [ '_trackEvent', 'Gallery', album, $(this).attr('href') ]
