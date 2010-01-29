// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  var expand = function() {
    $(this)
      .animate({ width: $(this).data('selectedWidth') }, 'fast')
      .parent().siblings().find('a')
        .each(function() {
          $(this)
            .clearQueue()
            .animate({ width: $(this).data('startWidth') }, 'fast');
        });
  };

  // setup the top nav
  $('#nav li a')
    .each(function() {
      var w = $(this).width();
      $(this).data({ 'startWidth': w, 'selectedWidth': w + 50 });
    })
    .mouseenter(expand)
    .click(function() {
      $('#nav li a.selected').removeClass('selected');
      $(this).addClass('selected');
    })
    .filter('a[href=' + window.location.pathname + ']')
      .addClass('selected')
      .css('width', function() { return $(this).data('selectedWidth'); });
  $('#nav').mouseleave(function() { expand.apply($('#nav li a.selected')); });

  // focus first form elements
  $('#page form :text:first').focus();
});
