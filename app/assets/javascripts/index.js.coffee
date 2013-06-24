#= require masonry

$(document).on 'ready page:load', ->
  $('body.index-index').each ->
    masonry = new Masonry '#page',
      itemSelector: '.cover, section'
      columnWidth: 'section'
      isLayoutInstant: yes
    $('.cover img').on 'load', ->
      masonry.layout()
