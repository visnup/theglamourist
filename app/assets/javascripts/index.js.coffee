#= require jquery.ba-hashchange
#= require jquery.transform2d
#= require underscore

return if $('body.index').length is 0

$('body.index-portfolio').each ->
  $(window)
    .on 'hashchange', ->
      if location.hash.length > 2
        thumb = $("a.thumb##{window.location.hash.substring(2)}")
        openSet thumb.closest('.set')
        loadPortrait thumb
      else
        closeSet $('.set.open')
        loadPortrait 'a.thumb:first'
    .on 'resize scroll', _.debounce ->
      height = $(window).height() + $(window).scrollTop() - 345
      $('ul.sets ul').css 'height', height
    , 200
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
    location.hash = "t#{$(this).attr('id')}"

loadPortrait = (link) ->
  return if $(link).length is 0

  $('a.thumb.selected').removeClass 'selected'

  src = $(link)
    .addClass('selected')
    .find('img').attr('src').replace(/_s.jpg$/, '_z.jpg')

  img = $('<img class="portrait">')
    .load ->
      portrait = $('#portrait')
      $this = $(this)
      rotation = "rotate(#{(Math.random() * 10)-5}deg)"

      old = $('img', portrait).removeClass('fade-in')
      _.delay (-> old.parent('a').remove()), 6000

      _.defer ->
        $this
          .appendTo(portrait)
          .wrap($('<a>', href: $(link).attr 'href'))
          .css
            position: 'absolute'
            top: Math.floor(Math.random() * 20)
            left: (portrait.width() - $this.width())/2
            transform: rotation
          .addClass('fade-in')
        $('#page').css 'minHeight', (i, min) ->
          Math.max $this.height()-10, parseInt(min)
    .attr 'src', src

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

  $('.set.closed')
    .each ->
      $('img', this).slice(1, 4).each ->
        rotation = "rotate(#{10*((Math.random() * 2)-1)}deg)"
        $(this).css transform: rotation
    .show()
