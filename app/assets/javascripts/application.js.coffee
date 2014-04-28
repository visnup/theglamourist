#= require zepto
#= require turbolinks
#= require fastclick
#= require_self
#= require_tree .

$(document).ready -> $(document).trigger 'ready'
$(document).on 'ready page:load', -> FastClick.attach(document.body)
$(document).on 'click', 'nav > ul', -> $(this).toggleClass 'hover'
