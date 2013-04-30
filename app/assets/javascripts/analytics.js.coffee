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
