#= require 'underscore'

# google analytics
_gaq = window._gaq ||= []

# window sizes
trackWindowDimensions = (action) ->
  w = $(window).width()
  h = $(window).height()
  event = [ '_trackEvent', 'Window Dimensions', action, "#{w}x#{h}", w/h, true ]
  console.log event
  _gaq.push event

  true

$(document).ready -> trackWindowDimensions 'Load'
$(window).resize _.debounce((-> trackWindowDimensions 'Resize'), 500)

# gallery clicks
$(document).on 'click', 'a.thumb', ->
  set = $(this).closest('.set').find('h4').text()
  _gaq.push [ '_trackEvent', 'Gallery', set, $(this).attr('href') ]
