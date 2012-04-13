#= require jquery.ba-hashchange
#= require jquery.transform2d
#= require underscore

return if $('body.index').length is 0

$('body.index-portfolio').each ->
  $(window)
    .on 'hashchange', ->
      if location.hash.length > 1
        thumb = $("a.thumb##{window.location.hash.substring(2)}")
        openSet thumb.closest('.set')
        loadPortrait thumb
      else
        closeSet $('.set.open')
        loadPortrait 'a.thumb:first'
    .on 'resize', _.debounce ->
      wh = $(window).height()
      $('#portrait img').each ->
        $(this).css 'marginBottom', (wh - $(this).height())/2
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
    location.hash = "p#{$(this).attr('id')}"

loadPortrait = (link) ->
  return if $(link).length is 0

  $('a.thumb.selected').removeClass 'selected'

  portrait = $('#portrait')
  thumb = $(link)
    .addClass('selected')
    .find('img')
  src = thumb.attr('src').replace(/_s.jpg$/, '_n.jpg')
    #.data('original')

  img = $('<img class="portrait">')
    .load ->
      $this = $(this)

      ww = $(window).width() + 2
      wh = $(window).height() + 2

      $this
        .appendTo(portrait)
        .wrap($('<a>', href: $(link).attr('href')))
        .after($('<div class="caption">').html(thumb.attr('title')?.replace(/\n/g, '<br/>')))
        .css(height: wh)
        .addClass('fade-in')

      iw = $this.width()
      ih = $this.height()
      ir = iw / ih

      if 0.6 < ir < 1
        if iw < ww/2
          $this.css
            height: 'auto'
            width: ww/2
          $this.css marginBottom: (wh - $this.height())/2
      else if 1 <= ir < 1.6
        if iw < ww
          $this.css
            height: 'auto'
            width: ww
          $this.css marginBottom: (wh - $this.height())/2

      pw = _.reduce $('img', portrait), ((s, img) -> s + $(img).width()), 0
      portrait.css 'left', ww - pw - 1
    .attr('src', src)

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
