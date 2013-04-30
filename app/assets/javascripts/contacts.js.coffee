$(document).on 'ready page:load', ->
  $('body.contacts').each ->
    $('textarea').focus -> $(this).addClass 'open'
