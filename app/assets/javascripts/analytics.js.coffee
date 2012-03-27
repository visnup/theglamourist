#= require 'underscore'

# google analytics
_gaq = window._gaq ||= []

# window sizes
trackWindowDimensions = (action) ->
  w = $(window).width()
  h = $(window).height()
  _gaq.push [ '_trackEvent', 'Window Dimensions', action, "#{w}x#{h}", w/h ]

trackWindowDimensions 'Load'
$(window).resize _.debounce((-> trackWindowDimensions 'Resize'), 500)

# gallery clicks
$(document).on 'click', 'a.thumb', ->
  _gaq.push [ '_trackEvent', 'Gallery', 'Click', $(this).attr('href') ]
