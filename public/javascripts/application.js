$(function() {
  // setup the top nav
  var expand = function() {
    $(this)
      .animate({ width: $(this).data('selectedWidth') }, 'fast')
      .parent().siblings().find('a')
        .each(function() {
          if ($(this).data('startWidth'))
            $(this)
              .clearQueue()
              .animate({ width: $(this).data('startWidth') }, 'fast');
        });
  };

  $('#nav li a')
    .each(function() {
      var w = $(this).width();
      $(this).data({ 'startWidth': w, 'selectedWidth': w + 50 });
    })
    .wrapInner('<span>')
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

  // setup hrefs from ids
  $('a.thumb')
    .each(function() { $(this).data('flickr', $(this).attr('href')); })
    .attr('href', function() { return '#t' + $(this).attr('id'); });
  $('body.index-index a.thumb').data('flickr', '/portfolio');

  var loadPortrait = function(link) {
    if ($(link).length == 0) return;
    $('a.thumb.selected').removeClass('selected');
    var src = $(link)
      .addClass('selected')
      .find('img').attr('src').replace(/_s.jpg$/, '.jpg');
    var img = $('<img>')
      .load(function() {
        var portrait = $('#portrait'),
            rotation = 'rotate(' + ((Math.random() * 10)-5) + 'deg)';
        var top = $(window).scrollTop() + 50 - portrait.offset().top;
        if (top < 0) top = 0;

        portrait.find('img').fadeOut(5000, function() {
          $(this).parent().remove();
        });

        $(this)
          .hide()
          .appendTo(portrait)
          .wrap('<a href="' + $(link).data('flickr') + '">')
          .css({
            position: 'absolute',
            top: top + Math.random() * 50,
            left: (portrait.width() - $(this).width())/2,
            //filter: 'progid:DXImageTransform.Microsoft.Matrix(M11=0.70710678, M12=0.70710678, M21=-0.70710678, M22=0.70710678)',
            '-webkit-transform': rotation,
            '-moz-transform': rotation
          })
          .fadeIn('fast');
      })
      .attr('src', src);
  };

  var openSet = function(set) {
    var $set = $(set);

    if ($set.is('.open')) return;

    $set
      .toggleClass('open closed')
      .find('img').slice(1, 4)
        .css({
          '-webkit-transform': 'none',
          '-moz-transform': 'none'
        });

    $('ul.sets')
      .find('a.back').show().end()
      .find('.title')
        .text($('h4', set).text());

    $('.set.closed').hide();
  };

  var closeSet = function(set) {
    $('ul.sets')
      .find('a.back').hide().end()
      .find('.title')
        .text('Choose a set below');

    $(set).toggleClass('open closed')

    $('.set.closed')
      .each(function() {
        $('img', this).slice(1, 4).each(function() {
          var rotation = 'rotate(' + 10*((Math.random() * 2)-1) + 'deg)';
          $(this).css({
            '-webkit-transform': rotation,
            '-moz-transform': rotation
          });
        });
      })
      .show();
  };

  $(window)
    .hashchange(function() {
      if (location.hash.length > 2) {
        var thumb = $('a.thumb#' + window.location.hash.substring(2));
        openSet(thumb.closest('.set'));
        loadPortrait(thumb);
      } else {
        closeSet($('.set.open'));
        loadPortrait('a.thumb:first');
      }
    })
    .hashchange();
});
