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
    y0 = y1 = start = 0
    $(document)
      .on 'touchstart', 'ul.albums ul', (e) ->
        y0 = y1 = e.originalEvent.touches[0].pageY
        start = $(this).scrollTop() + y0
      .on 'touchmove', 'ul.albums ul', (e) ->
        y1 = e.originalEvent.touches[0].pageY
        $(this).scrollTop start - y1
      .on 'click', 'ul.albums ul a.thumb', (e) ->
        if Math.abs(y1 - y0) > 10
          e.preventDefault()
          e.stopImmediatePropagation()
        else
          true

  $(document).on 'click', 'a.thumb', (e) ->
    e.preventDefault()
    location.hash = "#{$(this).attr('id').substring(1)}"

loadPortrait = (link) ->
  return if $(link).length is 0

  $('a.thumb.selected').removeClass 'selected'

  $portrait = $('#portrait')

  thumb = $(link)
    .addClass('selected')
    .find('img')
  src = thumb.attr('src').replace(/_s.jpg$/, '_n.jpg')
    #.data('original')

  img = $('<img class="portrait">')
    .load ->
      $this = $(this)

      $this
        .appendTo($portrait)
        .wrap($('<a>', href: $(link).attr('href')))
        .after($('<div class="caption">').html(thumb.attr('title')?.replace(/\n/g, '<br/>')))
        .addClass('fade-in')

      sizeImage $this
      alignPortrait $portrait
    .attr('src', src)

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
  el = $($img?.parent() || 'a:last', $portrait)
  if el.length > 0
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

getColor = (img) ->
  canvas = $('#color-test')
  if canvas.length is 0
    canvas = $('<canvas width=10 height=10 id="color-test">')
      .css(position: 'absolute', left: 10, top: 10)
      .appendTo(document.body)

  ctx = canvas[0].getContext('2d')
  ctx.drawImage img, 0, 0, 10, 10
  ctx.getImageData 10, 10, 1, 1
