exports.TWITTER_CONSUMER_KEY        = ''
exports.TWITTER_CONSUMER_SECRET     = ''
exports.TWITTER_ACCESS_TOKEN_KEY    = ''
exports.TWITTER_ACCESS_TOKEN_SECRET = ''
exports.DEFAULT_QUERY               = '#RiodosSinos #NovoHamburgo from:ComusaNH'

exports.set = (options) ->
  exports.TWITTER_CONSUMER_KEY    = options.key    if options.key?
  exports.TWITTER_CONSUMER_SECRET = options.secret if options.secret?
