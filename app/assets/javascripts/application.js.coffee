#= require jquery
#= require turbolinks
#= require fastclick
#= require_self
#= require_tree .

$(document).on 'ready page:load', -> FastClick.attach(document.body)
