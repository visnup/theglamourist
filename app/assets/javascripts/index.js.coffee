#= require jquery.ba-hashchange
#= require jquery.transform2d
#= require underscore

return if $('body.index').length is 0

$('body.index-index').each ->

  rgb2hsl = (r, g, b) ->
    r /= 255
    g /= 255
    b /= 255

    min = Math.min r, g, b
    max = Math.max r, g, b
    delta = max - min

    l = (max + min) / 2

    if delta == 0
      h = 0
      s = 0
    else
      s =
        if l < 0.5 then delta / (max + min)
        else            delta / (2 - max - min)

      delta_r = ( ( ( max - r ) / 6 ) + ( delta / 2 ) ) / delta
      delta_g = ( ( ( max - g ) / 6 ) + ( delta / 2 ) ) / delta
      delta_b = ( ( ( max - b ) / 6 ) + ( delta / 2 ) ) / delta

      h =
        if      r == max then delta_b - delta_g
        else if g == max then ( 1 / 3 ) + delta_r - delta_b
        else if b == max then ( 2 / 3 ) + delta_g - delta_r

      if h < 0
        h += 1
      else if (h > 1)
        h -= 1

    [ Math.round(h*360), Math.round(s*100), Math.round(l*100) ]

  $ ->
    $('.cover img').load ->
      d = 10
      canvas = $("<canvas width=#{d} height=#{d}>").css
          position: 'absolute'
          left: -d - 5
          top: -d - 5
        .appendTo('body')
      ctx = canvas[0].getContext '2d'
      ctx.drawImage this, 0, 0, d, d

      rgb = ctx.getImageData(0, 0, d, d).data

      hi = [ 0, 0, 0 ]
      for i in [0 ... rgb.length] by 4
        hsl = rgb2hsl rgb[i], rgb[i+1], rgb[i+2]
        hi = hsl if hsl[1] > hi[1] && 50 < hsl[2] < 80

      $('h2 a').css color: "hsl(#{hi[0]}, #{hi[1]}%, #{hi[2]}%)"

$('body.index-portfolio').each ->
  $(window)
    .on 'hashchange', ->
      if location.hash.length > 1
        thumb = $("a.thumb##{window.location.hash.substring(1)}")
        openSet thumb.closest('.set')
        loadPortrait thumb
      else
        closeSet $('.set.open')
        loadPortrait 'a.thumb:first'
  $ -> $(window).resize().hashchange()

  if Modernizr.touch
    y0 = y1 = start = 0
    $(document)
      .on 'touchstart', 'ul.sets ul', (e) ->
        y0 = y1 = e.originalEvent.touches[0].pageY
        start = $(this).scrollTop() + y0
      .on 'touchmove', 'ul.sets ul', (e) ->
        y1 = e.originalEvent.touches[0].pageY
        $(this).scrollTop start - y1
      .on 'click', 'ul.sets ul a.thumb', (e) ->
        if Math.abs(y1 - y0) > 10
          e.preventDefault()
          e.stopImmediatePropagation()
        else
          true

  $(document).on 'click', 'a.thumb', (e) ->
    e.preventDefault()
    location.hash = $(this).attr('id')

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
        .after($('<div class="caption">').text(thumb.attr('title')))
        .css(height: wh)
        .addClass('fade-in')

      iw = $this.width()
      ih = $this.height()
      ir = iw / ih

      if 0.7 < ir < 1
        if iw < ww/2
          $this.css
            height: 'auto'
            width: ww/2
      else if 1 <= ir < 1.6
        if iw < ww
          $this.css
            height: 'auto'
            width: ww

      pw = _.reduce $('img', portrait), ((s, img) -> s + $(img).width()), 0
      portrait.css 'left', ww - pw
    .attr('src', src)

openSet = (set) ->
  $set = $(set)

  return if $set.is '.open'

  $set
    .toggleClass('open closed')
    .find('img').slice(1, 4)
      .css transform: 'none'

  $('ul.sets')
    .find('a.back').show().end()
    .find('.title')
      .text($('h4', set).text())

  $('.set.closed').hide()

closeSet = (set) ->
  $('ul.sets')
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
