#= require jquery.masonry

return if $('body.index').length is 0

$('body.index-index').each ->
  $ ->
    $('#page').masonry
      itemSelector: '.cover, section'
      columnWidth: $('section').outerWidth()
