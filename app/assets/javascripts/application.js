//= require jquery
//= require jquery_ujs
//= require jquery.ba-hashchange
//= require_self
//= require_tree .

$(function() {
  // focus first form elements
  $('#page form :text:first').focus();

  // setup hrefs from ids
  $('a.thumb')
    .each(function() { $(this).data('flickr', $(this).attr('href')); })
    .attr('href', function() { return '#t' + $(this).attr('id'); });
  $('body.index-index a.thumb').data('flickr', '/portfolio');

  $('body.index-portfolio').each(function() {
    var $window = $(window),
        $ul = $('ul.sets ul');

    $window
      .resize(function() { $ul.css('height', $window.height() - 400); })
      .resize();

    // https://github.com/Modernizr/Modernizr/blob/master/modernizr.js#L347
    if ('ontouchstart' in window) {
      var scrollStart = 0;
      $ul
        .bind('touchstart', function(e) {
          scrollStart = $ul.scrollTop() + e.originalEvent.touches[0].pageY;
        })
        .bind('touchmove', function(e) {
          e.preventDefault();
          $ul.scrollTop(scrollStart - e.originalEvent.touches[0].pageY);
        });
    }
  });

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

  function loadPortrait(link) {
    if ($(link).length == 0) return;
    $('a.thumb.selected').removeClass('selected');
    var src = $(link)
      .addClass('selected')
      .find('img').attr('src').replace(/_s.jpg$/, '.jpg');
    var img = $('<img class="portrait">')
      .load(function() {
        var portrait = $('#portrait'),
            $this = $(this),
            rotation = 'rotate(' + ((Math.random() * 10)-5) + 'deg)';
        var top = $(window).scrollTop() + 50 - portrait.offset().top;
        if (top < 0) top = 0;

        portrait.find('img').fadeOut(3000, function() {
          $(this).parent('a').remove();
        });

        setTimeout(function() {
          $this
            .hide()
            .appendTo(portrait)
            .wrap('<a href="' + $(link).data('flickr') + '">')
            .css({
              position: 'absolute',
              top: top + Math.random() * ($(window).height()-400)/5,
              left: (portrait.width() - $this.width())/2,
              '-webkit-transform': rotation,
              '-moz-transform': rotation,
              '-ms-transform': rotation
            })
            .fadeIn(100);
        }, 0);
      })
      .attr('src', src);
  }

  function openSet(set) {
    var $set = $(set);

    if ($set.is('.open')) return;

    $set
      .toggleClass('open closed')
      .find('img').slice(1, 4)
        .css({
          '-webkit-transform': 'none',
          '-moz-transform': 'none',
          '-ms-transform': 'none'
        });

    $('ul.sets')
      .find('a.back').show().end()
      .find('.title')
        .text($('h4', set).text());

    $('.set.closed').hide();
  }

  function closeSet(set) {
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
            '-moz-transform': rotation,
            '-ms-transform': rotation
          });
        });
      })
      .show();
  }
});
