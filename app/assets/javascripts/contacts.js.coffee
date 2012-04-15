return if $('body.contacts').length is 0

$ ->
  # focus first form elements
  $('#page form :text:first').focus()
  $('textarea').focus -> $(this).addClass 'open'
