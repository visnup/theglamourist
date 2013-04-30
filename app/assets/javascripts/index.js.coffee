#= require jquery.masonry

$(document).on 'ready page:load', ->
  $('body.index-index').each ->
    $('#page').masonry
      itemSelector: '.cover, section'
      columnWidth: $('section').outerWidth()
