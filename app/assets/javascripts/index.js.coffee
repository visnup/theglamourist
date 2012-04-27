#= require jquery.ba-hashchange
#= require jquery.masonry
#= require jquery.transform2d
#= require underscore

return if $('body.index').length is 0

$('body.index-index').each ->
  $ ->
    $('#page').masonry
      itemSelector: '.cover, section'
      columnWidth: $('section').outerWidth()

$('body.index-portfolio').each ->
  $(window)
    .on 'hashchange', ->
      if location.hash.length > 1
        thumb = $("a.thumb#t#{window.location.hash.substring(1)}")
        openAlbum thumb.closest('.album')
        loadPortrait thumb
      else
        closeAlbum $('.album.open')
        loadPortrait 'li.cover:first a.thumb'
    .on 'resize', _.debounce ->
      portrait = $('#portrait')
      imgs = $('#portrait img')

      imgs[-3..-1].each -> sizeImage $(this)
      alignPortrait $('#portrait')
    , 50

  $(document)
    .on 'click', 'a.thumb', (e) ->
      e.preventDefault()
      location.hash = $(this).attr('id').substring(1)
    .on 'click', 'a.arrow', (e) ->
      e.preventDefault()
      dir = if $(this).hasClass('left') then '-' else '+'
      ul = $(this).siblings('ul')
      ul.stop().animate scrollLeft: "#{dir}=#{ul.width()}", 200
    .on 'keyup', (e) ->
      switch e.keyCode
        when 37  # left
          $('a.thumb.selected').closest('li').prev('li').find('a').click()
        when 39  # right
          $('a.thumb.selected').closest('li').next('li').find('a').click()

  if Modernizr.touch
    # prevent clicks after scroll
    x0 = x1 = start = 0
    $(document)
      .on 'touchstart', 'ul.albums ul, #portrait', (e) ->
        x0 = x1 = e.originalEvent.touches[0].pageX
      .on 'touchmove', 'ul.albums ul, #portrait', (e) ->
        x1 = e.originalEvent.touches[0].pageX
      .on 'click', 'ul.albums ul a.thumb, #portrait a', (e) ->
        if Math.abs(x1 - x0) > 10
          e.preventDefault()
          e.stopImmediatePropagation()
        else
          true

  $ ->
    $('.album ul').on 'scroll', _.debounce ->
      ul = $(this)
      last = $('li:last', this)
      ul.prev('.arrow').toggle ul.scrollLeft() > 0
      ul.next('.arrow').toggle last.position().left + last.width() > ul.width()
    , 50

    $(window).resize().hashchange()

loadPortrait = (link) ->
  $link = $(link)
  return if $link.length is 0

  $('a.thumb.selected').removeClass 'selected'

  $portrait = $('#portrait')

  thumb = $link.addClass('selected').find('img')
  src = thumb.attr('src').replace(/_s.jpg$/, '_n.jpg')

  id = "p#{$link.attr('id').substring(1)}"
  if (img = $("##{id}", $portrait)).length is 0
    $('<img>', id: id, class: 'portrait')
      .load ->
        $this = $(this)

        $this
          .appendTo($portrait)
          .wrap($('<a>', href: $link.attr('href')))
          .after($('<div class="caption">').html(thumb.attr('title')?.replace(/\n/g, '<br/>')))
          .addClass('fade-in')

        sizeImage $this
        alignPortrait $portrait, $this
      .attr('src', src)
  else
    sizeImage img
    alignPortrait $portrait, img

sizeImage = ($img) ->
  ww = $(window).width() + 2
  wh = $(window).height() + 2

  $img.css(height: wh, width: 'auto', marginBottom: 0)

  iw = $img.width()
  ih = $img.height()
  ir = iw / ih

  if 0.6 < ir < 1
    if iw < ww/2
      $img.css
        height: 'auto'
        width: ww/2
      $img.css marginBottom: (wh - $img.height())/2
  else if 1 <= ir < 1.6
    if iw < ww
      $img.css
        height: 'auto'
        width: ww
      $img.css marginBottom: (wh - $img.height())/2

alignPortrait = ($portrait, $img) ->
  if ($img = $($img?.closest('a') || 'a:last', $portrait)).length > 0
    d = $img.position().left - $(window).width() + $img.width()
    if Math.abs(d) > 10
      $portrait.stop().animate scrollLeft: $portrait.scrollLeft() + d, 500

openAlbum = (album) ->
  $album = $(album)

  return if $album.is '.open'

  $album
    .toggleClass('open closed')
    .find('ul').scroll()

  $('ul.albums')
    .find('a.back').show().end()
    .find('.title')
      .text($('h4', album).text())

  $('.album.closed').hide()

closeAlbum = (album) ->
  $('ul.albums')
    .find('a.back').hide().end()
    .find('.title')
      .text('Choose an album below')

  $(album).toggleClass 'open closed'

  $('.album.closed').show()
