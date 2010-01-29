// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  // setup the top nav
  $('#nav li a[href=' + window.location.pathname + ']')
    .addClass('selected')
    .css('width', function() { return $(this).width() + 50; });
  $('#nav li a:not(.selected)').hover(
    function() {
      if (!$(this).data('originalWidth'))
        $(this).data('originalWidth', $(this).width());
      $(this).animate({ width: $(this).width() + 50 }, 'fast');
    },
    function() {
      $(this).animate({ width: $(this).data('originalWidth') }, 'fast');
    });

  // focus first form elements
  $('#page form :text:first').focus();
});
