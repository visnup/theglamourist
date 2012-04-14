#= require jquery.ba-hashchange
#= require jquery.transform2d
#= require underscore

return if $('body.index').length is 0

$('body.index-portfolio').each ->
  $(window)
    .on 'hashchange', ->
      if location.hash.length > 1
        thumb = $("a.thumb#t#{window.location.hash.substring(1)}")
        openSet thumb.closest('.set')
        loadPortrait thumb
      else
        closeSet $('.set.open')
        loadPortrait 'a.thumb:first'
    .on 'resize', _.debounce ->
      portrait = $('#portrait')
      imgs = $('#portrait img')

      imgs[-3..-1].each -> sizeImage $(this)
      alignPortrait $('#portrait')
    , 50
  $ -> $(window).resize().hashchange()

  if Modernizr.touch
    x0 = x1 = start = 0
    $(document)
      .on 'touchstart', 'ul.albums ul, #portrait', (e) ->
        x0 = x1 = e.originalEvent.touches[0].pageX
        start = $(this).scrollLeft() + x0
      .on 'touchmove', 'ul.albums ul, #portrait', (e) ->
        x1 = e.originalEvent.touches[0].pageX
        $(this).scrollLeft start - x1
      .on 'click', 'ul.albums ul a.thumb, #portrait a', (e) ->
        if Math.abs(x1 - x0) > 10
          e.preventDefault()
          e.stopImmediatePropagation()
        else
          true

  $(document)
    .on 'click', 'a.thumb', (e) ->
      e.preventDefault()
      location.hash = "#{$(this).attr('id').substring(1)}"
    .on 'keyup', (e) ->
      switch e.keyCode
        when 37  # left
          $('a.thumb.selected').closest('li').prev('li').find('a').click()
        when 39  # right
          $('a.thumb.selected').closest('li').next('li').find('a').click()

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
  if (el = $($img?.closest('a') || 'a:last', $portrait)).length > 0
    $portrait
      .stop()
      .animate scrollLeft: $portrait.scrollLeft() + el.position().left, 500

openSet = (set) ->
  $set = $(set)

  return if $set.is '.open'

  $set
    .toggleClass('open closed')
    .find('img').slice(1, 4)
      .css transform: 'none'

  $('ul.albums')
    .find('a.back').show().end()
    .find('.title')
      .text($('h4', set).text())

  $('.set.closed').hide()

closeSet = (set) ->
  $('ul.albums')
    .find('a.back').hide().end()
    .find('.title')
      .text('Choose a set below')

  $(set).toggleClass 'open closed'

  $('.set.closed').show()
