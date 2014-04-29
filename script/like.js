#!/usr/bin/env node

var async = require('async')
  , sprintf = require('sprintf').sprintf
  , instagram = require('./instagram')

var tags = [ 'beautyblogger', 'bloggerstyle', 'makeupartist', 'mua',
    'nycphotographer', 'onthetable', 'productjunkie', 'sfblogger', 'sfeats',
    'styleblogger', 'vsco', 'vscocam', '냠냠', '먹스타그램', ]
  , users = {}
  , t0 = Date.now(), r0 = null

var queue = async.queue(function(url, next) {
  instagram.get(url, function(err, body, res) {
    if (err) return next(err)

    var remaining = +res.headers['x-ratelimit-remaining']
      , now = Date.now()

    var tag = url.match('tags/([^/]+)')[1]
      , photos = body.data

    // add next page if photos are less than an hour old
    var age = daysOld(latest(photos), now)
    console.log(sprintf('%s %0.2f days ago', tag, age))
    if (age < 1 && body.pagination.next_url)
      queue.push(body.pagination.next_url)

    async.each(photos, function(photo, next) {
      // skip photos with 0 likes or over 15 likes
      if (photo.likes.count < 1 || 15 < photo.likes.count) return next()

      // skip photos older than a day
      if (daysOld(photo, now) > 1) return next()

      // skip users we've seen before
      if (users[photo.user.id]) return next()

      instagram.get('users/' + photo.user.id, function(err, body) {
        if (err) return next(err)

        var user = body.data

        // skip users with more than 500 followers
        if (user.counts.followed_by > 500) return next()

        users[user.id] = true
        console.log(sprintf('%s %s %2d ❤️  %3d 😀  %s',
            tag, photo.link, photo.likes.count, user.counts.followed_by,
            user.username))

        instagram.post('media/' + photo.id + '/likes', next)
      })
    }, function(err) {
      if (err)
        console.log(err)

      if (!r0) {
        r0 = remaining
        return next()
      }

      var rate = (r0 - remaining) / (now - t0) * 1000
        , delay = (r0 - remaining) * 1000 - (now - t0)
      console.log(sprintf('%d req remaining at %0.2f req/s = %0.1f minutes remaining: pausing for %d s', remaining, rate, remaining/rate/60, delay/1000))
      setTimeout(next, delay)
    })
  })
}, 1)

for (var i = 0; i < tags.length; i++)
  queue.push('tags/' + tags[i] + '/media/recent')

function daysOld(photo, now) {
  now = now || Date.now()
  return (now - (+photo.created_time * 1000)) / 1000 / 60 / 60 / 24;
}

function latest(photos) {
  var photo = photos[0]

  for (var i = 1; i < photos.length; i++)
    if (photos[i].created_time > photo.created_time)
      photo = photos[i]

  return photo
}

// vim:syntax=javascript
