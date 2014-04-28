var request = require('request')

var api = 'https://api.instagram.com/v1/'
  , accessToken = '538328.643541b.be39dd953e644df58d2ce0f2460b049c'

var instagram = module.exports = {
  get: function(path, next) {
    var url = path.indexOf('//') === -1 ? api + path : path
    request({
      url: url,
      qs: { access_token: accessToken },
      json: true
    }, instagram.handler(next))
  },
  post: function(path, next) {
    request.post({
      url: api + path,
      form: { access_token: accessToken },
      json: true
    }, instagram.handler(next))
  },
  handler: function(next) {
    return function(err, res, body) {
      if (err) return next(err)
      if (!body.meta) return next(Error(body))
      if (body.meta.code !== 200) return next(Error(body.meta.error_message))

      next(null, body, res)
    }
  }
}
