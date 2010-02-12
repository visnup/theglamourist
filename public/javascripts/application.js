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

  var loadPortrait = function(link) {
    var src = $(link)
      .siblings()
        .removeClass('selected')
        .end()
      .addClass('selected')
      .find('img').attr('src').replace(/_s.jpg$/, '.jpg');
    var img = $('<img>')
      .load(function() {
        var portrait = $('#portrait'),
            rotation = 'rotate(' + ((Math.random() * 20)-10) + 'deg)';
        var top = $(window).scrollTop() + 50 - portrait.offset().top;
        if (top < 0) top = 0;

        var left = portrait.find('img');
        left.filter(':lt(' + (left.length-3) + ')').fadeOut(function() {
          $(this).remove();
        });

        $(this)
          .hide()
          .appendTo(portrait)
          .wrap('<a href="' + $(link).data('flickr') + '">')
          .css({
            position: 'absolute',
            top: top + Math.random() * 50,
            left: (portrait.width() - $(this).width())/2,
            '-webkit-transform': rotation,
            '-moz-transform': rotation
          })
          .fadeIn('fast');
      })
      .attr('src', src);
  };

  if (window.location.hash)
    loadPortrait('a.thumb#' + window.location.hash.substring(2));
  else
    loadPortrait('a.thumb:first');

  $('a.thumb')
    .each(function() { $(this).data('flickr', $(this).attr('href')); })
    .attr('href', function() { return '#x' + $(this).attr('id'); })
    .click(function(e) { loadPortrait(this); });
});
