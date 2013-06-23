#= require masonry

$(document).on 'ready page:load', ->
  $('body.index-index').each ->
    new Masonry '#page',
      itemSelector: '.cover, section'
      columnWidth: 'section'
