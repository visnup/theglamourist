return if $('body.contacts').length is 0

$ -> $('textarea').focus -> $(this).addClass 'open'
